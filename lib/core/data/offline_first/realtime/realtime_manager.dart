import 'package:budget_fusion_app/core/constants/feature_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../utils/utils.dart';
import '../../../supabase/supabase.dart';
import '../../data_sources/data_source_adapter.dart';
import '../../models/dto.dart';

typedef _ReloadFn = Future<void> Function();

@lazySingleton
class RealtimeManager {
  final Map<String, Map<Object, _ReloadFn>> _reloaders = {};
  final Map<String, RealtimeChannel> _channels = {};
  final Map<String, PublishSubject<void>> _subjects = {};

  RealtimeManager();

  void register<E extends Dto>(
    Object owner,
    DataSourceAdapter<E> adapter,
    Future<List<E>> Function({Map<String, dynamic>? filters, required bool forceReload}) loadAll,
  ) {
    final table = adapter.remote.table;
    final channelId = 'public:$table';
    Future<void> reload() async => loadAll(forceReload: false);

    _reloaders.putIfAbsent(channelId, () => {});
    _reloaders[channelId]![owner] = reload;

    _subjects.putIfAbsent(channelId, () {
      final s = PublishSubject<void>();
      s.debounceTime(FeatureConstants.realtimeDebounceDuration).listen((_) async {
        final rs = _reloaders[channelId]?.values.toList(growable: false) ?? const [];
        for (final r in rs) {
          r();
        }
      });
      return s;
    });
  }

  void listen(String table) {
    final channelId = 'public:$table';
    if (_channels.containsKey(channelId)) return;

    final subject = _subjects[channelId]!;
    final ch = supabase
        .channel(channelId)
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: table,
          callback: (_) => subject.add(null),
        )
        .subscribe();
    _channels[channelId] = ch;
    EntityLogger.instance.d("RealtimeManager", table, "subscribed $channelId");
  }

  Future<void> unregister<E extends Dto>(Object owner, DataSourceAdapter<E> adapter) async {
    final table = adapter.remote.table;
    final channelId = 'public:$table';
    final map = _reloaders[channelId];
    if (map == null) return;
    map.remove(owner);
    if (map.isEmpty) {
      _reloaders.remove(channelId);
      final ch = _channels.remove(channelId);
      if (ch != null) {
        await supabase.removeChannel(ch);
      }
      final subj = _subjects.remove(channelId);
      subj?.close();
      EntityLogger.instance.d("RealtimeManager", table, "unsubscribed $channelId");
    }
  }

  Future<void> dispose() async {
    for (final ch in _channels.values) {
      await supabase.removeChannel(ch);
    }
    for (final s in _subjects.values) {
      await s.close();
    }
    _channels.clear();
    _subjects.clear();
    _reloaders.clear();
  }
}
