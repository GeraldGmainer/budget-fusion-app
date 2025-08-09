import 'dart:async';

import 'package:budget_fusion_app/core/data/sync_manager/sync_all_response.dart';
import 'package:injectable/injectable.dart';

import '../../../utils/utils.dart';
import '../../core.dart';
import '../data_sources/data_source_adapter.dart';
import 'sync_cursor_repo.dart';
import 'sync_remote_source.dart';

@lazySingleton
class SyncManager {
  final SyncCursorRepo _syncCursorRepo;
  final SyncRemoteSource _syncRemoteSource;
  final Map<EntityType, OfflineFirstDataManager> _dataManagers = {};
  final Map<EntityType, DataSourceAdapter> _adapters = {};
  DateTime? _lastSyncTime;
  Future<void>? _ongoingSync;

  SyncManager(this._syncCursorRepo, this._syncRemoteSource);

  void register(OfflineFirstDataManager dataManager, DataSourceAdapter adapter) {
    _dataManagers[adapter.type] = dataManager;
    _adapters[adapter.type] = adapter;
  }

  Future<void> syncAll() async {
    final now = DateTime.now();
    if (_ongoingSync != null) {
      return _ongoingSync!;
    }
    if (_lastSyncTime != null && now.difference(_lastSyncTime!) < FeatureConstants.syncAllCacheDuration) {
      _log("Recent sync already completed | skipping new sync");
      return;
    }

    _log("Starting sync");

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
    final result = await _syncRemoteSource.syncAll(cursors: cursors, entities: _adapters.keys);

    for (final entry in _adapters.entries) {
      final raw = result.deltas[entry.key.name];
      if (raw == null) continue;
      final adapter = entry.value;
      if (raw.upserts.isNotEmpty) {
        final dtos = adapter.fromJsons(raw.upserts);
        await adapter.local.saveAllNotSynced(dtos);
      }
      for (final id in raw.deletes) {
        await adapter.local.deleteById(id);
      }
    }

    for (final dm in _dataManagers.values) {
      await dm.refresh();
    }

    final updatedTimestamps = <EntityType, DateTime>{};
    for (final type in _adapters.keys) {
      final key = type.name;
      final raw = result.deltas[key];
      if (raw == null) continue;
      if (raw.upserts.isEmpty && raw.deletes.isEmpty) continue;
      final ts = result.newTimestamps[key];
      if (ts != null) {
        await _syncCursorRepo.setLastSyncedAt(type, ts);
        updatedTimestamps[type] = ts;
      }
    }
    _logTimestamps(updatedTimestamps);
    _logChanges(result);
  }

  void _logTimestamps(Map<EntityType, DateTime> updated) {
    if (updated.isEmpty) {
      _log("skipped cursor update (0 changes)");
      return;
    }
    for (final e in updated.entries) {
      _log("updated cursor for ${e.key.name}: ${_formatTime(e.value)}");
    }
  }

  String _formatTime(DateTime dt) => dt.toUtc().toIso8601String().split('.').first;

  void _logChanges(SyncAllResponse result) {
    final logStr = _adapters.keys
        .map((t) {
          final k = t.name;
          final r = result.deltas[k];
          final c = r == null ? 0 : r.upserts.length + r.deletes.length;
          return '${t.name}:${EntityLogger.bold(c)}';
        })
        .join(', ');
    _log('sync done --> changes: $logStr', dark: true);
  }

  _log(String msg, {bool dark = false}) {
    EntityLogger.instance.d("SyncManager", "sync", msg, darkColor: dark);
  }
}
