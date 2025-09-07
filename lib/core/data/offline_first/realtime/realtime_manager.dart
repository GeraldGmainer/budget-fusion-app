import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../utils/utils.dart';
import '../../../core.dart';

typedef ReloadFn = FutureOr<void> Function();

@singleton
class RealtimeManager {
  final Map<String, PublishSubject<void>> _subjects = {};
  final Map<String, int> _refCounts = {};
  RealtimeChannel? _schemaChannel;
  bool _started = false;

  StreamSubscription<SupabaseAuthEvent>? _authSub;

  Stream<void> eventStream(String table) => _subjects.putIfAbsent(table, () => PublishSubject<void>()).stream;

  Future<Null> Function() onEvent(String table, ReloadFn reload) {
    final sub = eventStream(table).debounceTime(FeatureConstants.realtimeDebounceDuration).listen((_) => reload());
    _refCounts[table] = (_refCounts[table] ?? 0) + 1;
    return () async {
      await sub.cancel();
      final left = (_refCounts[table] ?? 1) - 1;
      if (left <= 0) {
        _refCounts.remove(table);
        final subject = _subjects.remove(table);
        await subject?.close();
      } else {
        _refCounts[table] = left;
      }
      if (_subjects.isEmpty) _scheduleStop();
    };
  }

  Future<void> start() async {
    if (_started) return;
    final token = supabase.auth.currentSession?.accessToken;
    if (token != null) {
      supabase.realtime.setAuth(token);
    }
    _schemaChannel = supabase
        .channel('realtime:public')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          callback: (PostgresChangePayload payload) {
            final table = payload.table;
            final subject = _subjects[table];
            EntityLogger.instance.d("RealtimeManager", table, "received");
            subject?.add(null);
          },
        )
        .subscribe();
    _started = true;
    EntityLogger.instance.d("RealtimeManager", "realtime", "subscribed");
  }

  Future<void> restart() async {
    if (!_started) return;
    await stop();
    await Future.delayed(Duration(seconds: 2));
    await start();
  }

  Future<void> stop() async {
    if (!_started) return;
    if (_schemaChannel != null) {
      await supabase.removeChannel(_schemaChannel!);
      EntityLogger.instance.d("RealtimeManager", "realtime", "stopped");
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
    await _authSub?.cancel();
    EntityLogger.instance.d("RealtimeManager", "realtime", "disposed");
  }

  void _scheduleStop() {
    Future<void>.delayed(const Duration(seconds: 5)).then((_) {
      if (_subjects.isEmpty) {
        EntityLogger.instance.d("RealtimeManager", "realtime", "scheduled stop");
        stop();
      }
    });
  }
}
