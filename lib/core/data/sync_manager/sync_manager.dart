import 'dart:async';

import 'package:budget_fusion_app/core/data/sync_manager/sync_all_response.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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
  final ConnectivityService _connectivityService;
  final RemoteLoadingService remoteLoadingService;
  final Map<EntityType, OfflineFirstDataManager> _dataManagers = {};
  final Map<EntityType, DataSourceAdapter> _adapters = {};
  DateTime? _lastSyncTime;
  DateTime? _lastOfflineAt;
  bool _isOnline = true;
  Future<void>? _ongoingSync;
  StreamSubscription<List<ConnectivityResult>>? _connSub;

  SyncManager(this._syncCursorRepo, this._syncRemoteSource, this._connectivityService, this.remoteLoadingService) {
    _initConnectivity();
  }

  void register(OfflineFirstDataManager dataManager, DataSourceAdapter adapter) {
    _dataManagers[adapter.type] = dataManager;
    _adapters[adapter.type] = adapter;
  }

  Future<void> syncAll({Set<String> excludeIds = const {}, bool forceReload = false}) async {
    final now = DateTime.now();
    if (_ongoingSync != null) return _ongoingSync!;
    if (!_isOnline) {
      _lastOfflineAt = now;
      _log("Offline | skipping sync");
      return;
    }

    if (_lastOfflineAt != null) {
      final wait = FeatureConstants.syncOfflineBackoff;
      if (now.difference(_lastOfflineAt!) < wait) {
        _log("offline backoff active (${wait.inSeconds}s)");
        return;
      }
    }

    if (!forceReload && _lastSyncTime != null && now.difference(_lastSyncTime!) < FeatureConstants.syncAllCacheDuration) {
      _log("Recent sync already completed | skipping new sync");
      return;
    }

    final completer = Completer<void>();
    _ongoingSync = completer.future;

    try {
      await remoteLoadingService.wrap(() async {
        await _syncAll(excludeIds);
      });
      _lastSyncTime = DateTime.now();
      _lastOfflineAt = null;
      completer.complete();
    } on NoInternetException {
      _lastOfflineAt = DateTime.now();
      _log("offline, skipping sync");
      completer.complete();
    } catch (e, st) {
      // If you sometimes call syncAll() unawaited, prefer not to rethrow here.
      completer.completeError(e, st);
      rethrow;
    } finally {
      _ongoingSync = null;
    }
  }

  Future<void> _syncAll(Set<String> excludeIds) async {
    final cursors = await _syncCursorRepo.getAll();
    final result = await _syncRemoteSource.syncAll(cursors: cursors, entities: _adapters.keys, excludeIds: excludeIds);

    final changed = <EntityType>{};

    for (final entry in _adapters.entries) {
      final raw = result.deltas[entry.key.name];
      if (raw == null) continue;
      if (raw.upserts.isNotEmpty) {
        final dtos = entry.value.fromJsons(raw.upserts);
        await entry.value.local.saveAllNotSynced(dtos);
        changed.add(entry.key);
      }
      if (raw.deletes.isNotEmpty) {
        await entry.value.local.deleteByIds(raw.deletes);
        changed.add(entry.key);
      }
    }

    for (final type in changed) {
      final dm = _dataManagers[type];
      if (dm != null) {
        await dm.refresh();
      }
    }

    final updatedTimestamps = <EntityType, DateTime>{};
    for (final type in changed) {
      final key = type.name;
      final ts = result.newTimestamps[key];
      if (ts != null) {
        await _syncCursorRepo.setLastSyncedAt(type, ts);
        updatedTimestamps[type] = ts;
      }
    }

    _logTimestamps(updatedTimestamps);
    _logChanges(result);
  }

  Future<void> _initConnectivity() async {
    _connSub = _connectivityService.onConnectivityChanged.listen(_onConnectivityChanged);
    final r = await _connectivityService.checkConnectivity();
    _onConnectivityChanged(r);
  }

  void _onConnectivityChanged(List<ConnectivityResult> result) {
    final nowOnline = _connectivityService.evaluateResult(result);
    final wasOffline = !_isOnline && nowOnline;
    _isOnline = nowOnline;
    if (wasOffline) {
      _lastOfflineAt = null;
      unawaited(syncAll());
    }
  }

  void _logTimestamps(Map<EntityType, DateTime> updated) {
    if (updated.isEmpty) {
      _log("skipped cursor update (0 changes)");
      return;
    }
    for (final e in updated.entries) {
      _log("updated cursor for ${e.key.name}: ${_formatTime(e.value)}", type: e.key);
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

  _log(String msg, {EntityType? type, bool dark = false}) {
    EntityLogger.instance.d("SyncManager", type?.name ?? "sync", msg, darkColor: dark);
  }

  void dispose() {
    _connSub?.cancel();
  }
}
