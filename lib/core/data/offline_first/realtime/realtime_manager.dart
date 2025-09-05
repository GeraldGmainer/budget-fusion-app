import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../utils/utils.dart';
import '../../../core.dart';

typedef ReloadFn = FutureOr<void> Function();

@singleton
class RealtimeManager {
  final SupabaseAuthManager supabaseAuthManager;
  final Map<String, PublishSubject<void>> _subjects = {};
  final Map<String, int> _refCounts = {};
  RealtimeChannel? _schemaChannel;
  bool _started = false;

  StreamSubscription<SupabaseAuthEvent>? _authSub;

  RealtimeManager(this.supabaseAuthManager);

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
      if (_subjects.isEmpty) _scheduleStop();
    };
  }

  Future<void> init() async {
    _authSub = supabaseAuthManager.stream.listen((e) async {
      if (e.type == SupabaseAuthType.tokenRefreshed && e.session != null) {
        try {
          Supabase.instance.client.realtime.setAuth(e.session!.accessToken);
        } catch (_) {}
        BudgetLogger.instance.i("restart realtime");
        await restart();
      } else if (e.type == SupabaseAuthType.signedOut) {
        await stop();
      }
    });
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
            EntityLogger.instance.d("RealtimeManager", table, "received");
            subject?.add(null);
          },
        )
        .subscribe();
    _started = true;
    EntityLogger.instance.d("RealtimeManager", "realtime", "subscribed");
  }

  Future<void> restart() async {
    BudgetLogger.instance.i("restart realtime $_started");
    await stop();
    await start();
  }

  Future<void> stop() async {
    BudgetLogger.instance.i("stop realtime $_started");
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
    await _authSub?.cancel();
  }

  void _scheduleStop() {
    Future<void>.delayed(const Duration(seconds: 5)).then((_) {
      if (_subjects.isEmpty) stop();
    });
  }
}
