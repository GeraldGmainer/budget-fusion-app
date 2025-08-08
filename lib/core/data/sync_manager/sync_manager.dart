import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../utils/utils.dart';
import '../../core.dart';
import 'sync_all_response.dart';
import 'sync_cursor_repo.dart';
import 'sync_remote_source.dart';

@lazySingleton
class SyncManager {
  final SyncCursorRepo _syncCursorRepo;
  final SyncRemoteSource _syncRemoteSource;
  final Map<EntityType, OfflineFirstDataManager> _dataManagers = {};
  final Map<EntityType, OfflineFirstLocalDataSource> _localSources = {};
  DateTime? _lastSyncTime;
  Future<void>? _ongoingSync;

  SyncManager(this._syncCursorRepo, this._syncRemoteSource);

  void register(EntityType entity, OfflineFirstDataManager dm, OfflineFirstLocalDataSource lds) {
    _dataManagers[entity] = dm;
    _localSources[entity] = lds;
  }

  Future<void> syncAll(String cameFrom) async {
    final now = DateTime.now();
    if (_ongoingSync != null) {
      return _ongoingSync!;
    }
    if (_lastSyncTime != null && now.difference(_lastSyncTime!) < FeatureConstants.syncAllCacheDuration) {
      _log("Recent sync already completed | skipping new sync | called from $cameFrom");
      return;
    }

    _log("Starting sync | called from $cameFrom");

    final completer = Completer<void>();
    _ongoingSync = completer.future;

    try {
      await _syncAll();
      _lastSyncTime = DateTime.now();
      completer.complete();
    } catch (e, st) {
      completer.completeError(e, st);
      rethrow;
    } finally {
      _ongoingSync = null;
    }
  }

  Future<void> _syncAll() async {
    final cursors = await _syncCursorRepo.getAll();
    final result = await _syncRemoteSource.syncAll(cursors);

    // TODO dont define every EntityType manually
    final deltas = <EntityType, SyncDelta>{
      EntityType.account: result.account,
      EntityType.category: result.category,
      EntityType.booking: result.booking,
      EntityType.profile: result.profile,
      EntityType.currency: result.currency,
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
      EntityType.currency: newTs.currency,
    };
    // TODO only set cursor when result.entity.length > 0
    await _syncCursorRepo.setAll(newCursors);

    final changes = deltas.map((e, d) => MapEntry(e, d.upserts.length + d.deletes.length));
    final logStr = changes.entries.map((e) => '${e.key.name}:${e.value}').join(', ');
    _log('sync done | changes: $logStr');
  }

  _log(String msg) {
    EntityLogger.instance.d("SyncManager", "sync", msg);
  }
}
