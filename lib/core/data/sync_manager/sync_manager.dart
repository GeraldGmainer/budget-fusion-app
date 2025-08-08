import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../utils/utils.dart';
import '../../core.dart';
import '../domain_sync_adapter.dart';
import 'sync_all_response.dart';
import 'sync_cursor_repo.dart';
import 'sync_remote_source.dart';

@lazySingleton
class SyncManager {
  final SyncCursorRepo _syncCursorRepo;
  final SyncRemoteSource _syncRemoteSource;
  final Map<EntityType, OfflineFirstDataManager> _dataManagers = {};
  final Map<EntityType, DomainSyncAdapter> _adapters = {};
  DateTime? _lastSyncTime;
  Future<void>? _ongoingSync;

  SyncManager(this._syncCursorRepo, this._syncRemoteSource);

  void register(OfflineFirstDataManager dataManager, DomainSyncAdapter adapter) {
    _dataManagers[adapter.type] = dataManager;
    _adapters[adapter.type] = adapter;
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

    _log("Starting sync, called from $cameFrom");

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
      final localDataSource = _adapters[entity]!.local;
      await localDataSource.saveAllNotSynced(delta.upserts);
      for (final id in delta.deletes) {
        await localDataSource.deleteById(id);
      }
    }

    for (final dm in _dataManagers.values) {
      dm.refresh();
    }

    final newTs = result.newTimestamps;
    final tsByEntity = <EntityType, DateTime?>{
      EntityType.account: newTs.account,
      EntityType.category: newTs.category,
      EntityType.booking: newTs.booking,
      EntityType.profile: newTs.profile,
      EntityType.currency: newTs.currency,
    };

    for (final entry in deltas.entries) {
      final entity = entry.key;
      final delta = entry.value;
      if (delta.upserts.isEmpty && delta.deletes.isEmpty) continue;
      final ts = tsByEntity[entity];
      if (ts == null) continue;
      await _syncCursorRepo.setLastSyncedAt(entity, ts);
    }

    final changes = deltas.map((e, d) => MapEntry(e, d.upserts.length + d.deletes.length));
    final logStr = changes.entries.map((e) => '${e.key.name}:${e.value}').join(', ');
    _log('sync done --> changes: $logStr', dark: true);
  }

  _log(String msg, {bool dark = false}) {
    EntityLogger.instance.d("SyncManager", "sync", msg, darkColor: dark);
  }
}
