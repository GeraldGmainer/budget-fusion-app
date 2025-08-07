import 'package:injectable/injectable.dart';
import 'package:synchronized/synchronized.dart';

import '../../../utils/utils.dart';
import '../../core.dart';
import '../offline_first/data_sources/offline_first_local_data_source.dart';
import 'sync_all_response.dart';
import 'sync_cursor_repo.dart';
import 'sync_remote_source.dart';

@lazySingleton
class SyncManager {
  final SyncCursorRepo _syncCursorRepo;
  final SyncRemoteSource _syncRemoteSource;
  final Map<EntityType, OfflineFirstDataManager> _dataManagers = {};
  final Map<EntityType, OfflineFirstLocalDataSource> _localSources = {};
  final _lock = Lock();

  SyncManager(this._syncCursorRepo, this._syncRemoteSource);

  void register(EntityType entity, OfflineFirstDataManager dm, OfflineFirstLocalDataSource lds) {
    _dataManagers[entity] = dm;
    _localSources[entity] = lds;
  }

  Future<void> syncAll() => _lock.synchronized(() => _syncAll());

  Future<void> _syncAll() async {
    final entities = _dataManagers.keys.map((e) => e.name).join(' | ');
    _log('sync start | entities $entities');

    final rawCursors = await _syncCursorRepo.getAll();
    final cursors = rawCursors.map((entity, ts) => MapEntry(entity, ts));
    final result = await _syncRemoteSource.syncAll(cursors);

    final deltas = <EntityType, SyncDelta>{
      EntityType.account: result.account,
      EntityType.category: result.category,
      EntityType.booking: result.booking,
      EntityType.profile: result.profile,
    };

    for (final entry in deltas.entries) {
      final entity = entry.key;
      final delta = entry.value;
      final localDataSource = _localSources[entity]!;
      await localDataSource.saveAllNotSynced(delta.upserts);
      for (final id in delta.deletes) {
        await localDataSource.deleteById(id);
      }
    }

    for (final dm in _dataManagers.values) {
      dm.refresh();
    }

    final newTs = result.newTimestamps;
    final newCursors = <EntityType, DateTime?>{
      EntityType.account: newTs.account,
      EntityType.category: newTs.category,
      EntityType.booking: newTs.booking,
      EntityType.profile: newTs.profile,
    };
    await _syncCursorRepo.setAll(newCursors);

    final changes = deltas.map((e, d) => MapEntry(e, d.upserts.length + d.deletes.length));
    final logStr = changes.entries.map((e) => '${e.key.name}:${e.value}').join(', ');
    _log('sync done | changes: $logStr');
  }

  // TODO syncAll wird noch ned angerufen
  // mit chatGPT errötern, was tun
  // chatGPT meint, data manager soll nur für das lokale Zeug zuständig sein. Sync Manager call remote sources
  // Future<void> syncAll() async {
  //   final entities = _dataManagers.keys.toList();
  //   _log("sync start | entities '${entities.map((x) => x.name).join(" | ")}'");
  //   final cursors = await _syncCursorRepo.getAll();
  //   final SyncAllResponse syncResult = await _syncRemoteSource.syncAll(cursors);
  //
  //   final deltas = {
  //     EntityType.account: syncResult.account,
  //     EntityType.booking: syncResult.booking,
  //     EntityType.category: syncResult.category,
  //     EntityType.profile: syncResult.profile,
  //   };
  //   for (final entry in deltas.entries) {
  //     final entity = entry.key;
  //     final delta = entry.value;
  //     final lds = _localSources[entity]!;
  //     await lds.saveAllNotSynced(delta.upserts);
  //     for (final id in delta.deletes) {
  //       await lds.deleteById(id);
  //     }
  //   }
  //   for (final dm in _dataManagers.values) {
  //     dm.refresh();
  //   }
  //   final newCursors = {
  //     EntityType.account: syncResult.newTimestamps.account,
  //     EntityType.booking: syncResult.newTimestamps.booking,
  //     EntityType.category: syncResult.newTimestamps.category,
  //     EntityType.profile: syncResult.newTimestamps.profile,
  //   };
  //   await _syncCursorRepo.setAll(newCursors);
  //   final changes = deltas.map((e, d) => MapEntry(e, d.upserts.length + d.deletes.length));
  //   _log("sync done | changes: ${changes.entries.map((e) => '${e.key.name}:${e.value}').join(', ')}");
  // }

  _log(String msg) {
    EntityLogger.instance.d("SyncManager", "sync", msg);
  }
}
