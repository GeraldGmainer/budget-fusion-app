import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../utils/utils.dart';
import '../../../constants/feature_constants.dart';
import '../../../supabase/supabase.dart';

typedef ReloadFn = FutureOr<void> Function();

@lazySingleton
class RealtimeManager {
  final Map<String, PublishSubject<void>> _subjects = {};
  final Map<String, int> _refCounts = {};
  RealtimeChannel? _schemaChannel;
  bool _started = false;

  Stream<void> eventStream(String table) => _subjects.putIfAbsent(table, () => PublishSubject<void>()).stream;

  Future<Null> Function() onEvent(String table, ReloadFn reload) {
    final sub = eventStream(table).debounceTime(FeatureConstants.realtimeDebounceDuration).listen((_) => reload());
    _refCounts[table] = (_refCounts[table] ?? 0) + 1;
    return () async {
      await sub.cancel();
      final left = (_refCounts[table] ?? 1) - 1;
      if (left <= 0) {
        _refCounts.remove(table);
        final s = _subjects.remove(table);
        await s?.close();
      } else {
        _refCounts[table] = left;
      }
    };
  }

  Future<void> start() async {
    if (_started) return;
    _schemaChannel = supabase
        .channel('realtime:public')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          callback: (PostgresChangePayload payload) {
            final table = payload.table;
            final subject = _subjects[table];
            EntityLogger.instance.d("RealtimeManager", table, "received realtime event --> loadAll");
            subject?.add(null);
          },
        )
        .subscribe();
    _started = true;
    EntityLogger.instance.d("RealtimeManager", "realtime", "subscribed to all public schemas");
  }

  Future<void> stop() async {
    if (!_started) return;
    if (_schemaChannel != null) {
      await supabase.removeChannel(_schemaChannel!);
      _schemaChannel = null;
    }
    _started = false;
  }

  Future<void> dispose() async {
    await stop();
    for (final s in _subjects.values) {
      await s.close();
    }
    _subjects.clear();
    _refCounts.clear();
  }
}
