import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

import '../../data_sources/data_source_adapter.dart';
import '../../sync_manager/sync_manager.dart';
import 'queue_local_data_source.dart';
import 'queue_logger.dart';

@lazySingleton
class QueueManager {
  static const maxAttempts = 3;
  static const offlineMaxRetries = 3;

  final QueueLocalDataSource _queueDataSource;
  final RemoteLoadingService _remoteLoadingService;
  final ConnectivityService _connectivityService;
  final QueueLogger _queueLogger;
  final SyncManager _syncManager;

  final Queue<QueueItem> _inMemoryQueue = Queue();
  final Map<EntityType, DataSourceAdapter> _adapters = {};
  final Set<String> _excludeIdsBuffer = <String>{};

  final Map<String, int> _offlineRetryCount = {};
  final Map<String, QueuePauseReason> _paused = {};

  final StreamController<List<QueueItem>> streamController = StreamController.broadcast();
  final StreamController<Set<String>> _drainedIds = StreamController.broadcast();

  Timer? _drainTimer;
  Timer? _retryTimer;
  bool _isProcessing = false;
  bool _initialized = false;
  bool _isOnline = true;
  StreamSubscription<List<ConnectivityResult>>? _connSub;

  List<QueueItem> get pendingSnapshot => List.unmodifiable(_inMemoryQueue.where((q) => !q.done));

  Future<List<QueueLogEntry>> get logsSnapshot => _queueLogger.logsSnapshot;

  QueueManager(
    this._queueDataSource,
    this._remoteLoadingService,
    this._connectivityService,
    this._queueLogger,
    this._syncManager,
  ) {
    _initConnectivity();
  }

  Stream<List<QueueItem>> get pendingItemsStream => streamController.stream;

  Stream<Set<String>> get drainedIds => _drainedIds.stream;

  Stream<List<QueueLogEntry>> get logsStream => _queueLogger.logsStream;

  void register(DataSourceAdapter adapter) => _adapters[adapter.type] = adapter;

  Future<void> init() async {
    _log("init QueueManager");
    final items = await _queueDataSource.fetchPendingItems();
    for (final it in items) {
      if (it.pauseReason == QueuePauseReason.attemptsExhausted) {
        final reset = it.copyWith(attempts: 0, pausedReason: null);
        await _queueDataSource.updateQueueItem(reset);
        _inMemoryQueue.add(reset);
      } else if (it.pauseReason == QueuePauseReason.offline) {
        _paused[it.entityId] = QueuePauseReason.offline;
        _inMemoryQueue.add(it);
      } else {
        _inMemoryQueue.add(it);
      }
    }
    _initialized = true;
    _emitPending();
    _log("init QueueManager done");

    if (_isOnline && _paused.isNotEmpty) {
      final ids = _paused.entries.where((e) => e.value == QueuePauseReason.offline).map((e) => e.key).toList();
      final list = _inMemoryQueue.toList();
      for (final id in ids) {
        final ix = list.indexWhere((q) => q.entityId == id);
        if (ix >= 0) {
          final it = list[ix];
          final reset = it.copyWith(attempts: 0, pausedReason: null);
          list[ix] = reset;
          unawaited(_queueDataSource.updateQueueItem(reset));
        }
        _paused.remove(id);
        _offlineRetryCount.remove(id);
      }
      _inMemoryQueue
        ..clear()
        ..addAll(list);
      _emitPending();
    }
    _processNext();
  }

  Future<void> add(QueueItem item) async {
    if (!_initialized) throw Exception("QueueManager not initialized yet!");
    await _queueDataSource.addQueueItem(item);
    _inMemoryQueue.add(item);
    _queueLogger.log(QueueLogEvent.added, item);
    _drainTimer?.cancel();
    if (!_isProcessing) {
      _processNext();
    } else {
      _emitPending();
    }
  }

  Future<void> _processNext() async {
    if (_inMemoryQueue.isEmpty) {
      _log("Queue is empty");
      _scheduleDrainIfIdle();
      return;
    }
    if (_isProcessing) {
      _log("Queue is busy");
      return;
    }

    if (_allPaused()) {
      _log("All items paused for offline");
      _scheduleDrainIfIdle();
      return;
    }

    while (_inMemoryQueue.isNotEmpty && _paused.containsKey(_inMemoryQueue.first.entityId)) {
      final moved = _inMemoryQueue.removeFirst();
      _inMemoryQueue.addLast(moved);
    }
    if (_inMemoryQueue.isEmpty) {
      _scheduleDrainIfIdle();
      return;
    }

    _emitPending();
    _isProcessing = true;

    final currentItem = _inMemoryQueue.first;
    final adapter = _adapters[currentItem.entityType];
    if (adapter == null) {
      BudgetLogger.instance.e("Queue processing error", "Entity adapter not registered for entity ${currentItem.entityType}");
      _isProcessing = false;
      _scheduleDrainIfIdle();
      return;
    }

    _queueLogger.log(QueueLogEvent.processing, currentItem);

    try {
      await _processQueueItem(currentItem, adapter);
      _inMemoryQueue.removeFirst();
      await _queueDataSource.removeQueueItem(currentItem.entityId);
      _offlineRetryCount.remove(currentItem.entityId);
      _paused.remove(currentItem.entityId);
      _queueLogger.log(QueueLogEvent.succeeded, currentItem);
      _emitPending();
    } catch (e, stack) {
      final offline = _isOfflineError(e);
      if (offline) {
        final count = (_offlineRetryCount[currentItem.entityId] ?? 0) + 1;
        _offlineRetryCount[currentItem.entityId] = count;

        if (count >= offlineMaxRetries) {
          BudgetLogger.instance.i("Queue offline, pausing");
          _paused[currentItem.entityId] = QueuePauseReason.offline;
          final pausedItem = currentItem.copyWith(pausedReason: QueuePauseReason.offline, attempts: count);
          await _queueDataSource.updateQueueItem(pausedItem);
          _inMemoryQueue.removeFirst();
          _inMemoryQueue.addLast(pausedItem);
          _queueLogger.log(QueueLogEvent.pause, pausedItem);
          final failStatus = currentItem.taskType == QueueTaskType.delete ? SyncStatus.deleteFailed : SyncStatus.syncFailed;
          await adapter.local.updateSyncStatus(currentItem.entityId, failStatus);
          _emitPending();
          _syncManager.hackifixRefresh();
        } else {
          BudgetLogger.instance.i("Queue offline, retry $count/$offlineMaxRetries scheduled\n$currentItem");
          final retriedItem = currentItem.copyWith(attempts: count);
          _queueLogger.log(QueueLogEvent.retry, retriedItem);
          final status = currentItem.taskType == QueueTaskType.delete ? SyncStatus.pendingDelete : SyncStatus.updatedLocally;
          await adapter.local.updateSyncStatus(retriedItem.entityId, status);
          _inMemoryQueue.removeFirst();
          _inMemoryQueue.addLast(retriedItem);
          _emitPending();
          _retryTimer?.cancel();
          _retryTimer = Timer(FeatureConstants.queueNetworkRetryDelay, () {
            if (_inMemoryQueue.isNotEmpty && !_isProcessing) _processNext();
          });
        }
      } else {
        final updatedAttempts = currentItem.attempts + 1;
        if (updatedAttempts >= maxAttempts) {
          final pausedItem = currentItem.copyWith(attempts: updatedAttempts, pausedReason: QueuePauseReason.attemptsExhausted);
          await _queueDataSource.updateQueueItem(pausedItem);
          final failStatus = currentItem.taskType == QueueTaskType.delete ? SyncStatus.deleteFailed : SyncStatus.syncFailed;
          await adapter.local.updateSyncStatus(currentItem.entityId, failStatus);
          _inMemoryQueue.removeFirst();
          _paused[currentItem.entityId] = QueuePauseReason.attemptsExhausted;
          _queueLogger.log(QueueLogEvent.pause, pausedItem);
          _inMemoryQueue.addLast(pausedItem);
          _emitPending();
        } else {
          final retriedItem = currentItem.copyWith(attempts: updatedAttempts);
          _inMemoryQueue.removeFirst();
          _inMemoryQueue.addLast(retriedItem);
          await _queueDataSource.updateQueueItem(retriedItem);
          BudgetLogger.instance.e("Queue task failed", e, stack);
          final isFKError = _isForeignKeyMissing(e);
          _queueLogger.log(isFKError ? QueueLogEvent.missingForeignKey : QueueLogEvent.retry, retriedItem);
          final status = currentItem.taskType == QueueTaskType.delete ? SyncStatus.pendingDelete : SyncStatus.updatedLocally;
          await adapter.local.updateSyncStatus(retriedItem.entityId, status);
          _emitPending();
          _retryTimer?.cancel();
          _retryTimer = Timer(FeatureConstants.queueNetworkRetryDelay, () {
            if (_inMemoryQueue.isNotEmpty && !_isProcessing) _processNext();
          });
        }
      }
    } finally {
      _isProcessing = false;
      if (_inMemoryQueue.isNotEmpty) {
        if (_retryTimer == null || !_retryTimer!.isActive) {
          _processNext();
        } else {
          _scheduleDrainIfIdle();
        }
      } else {
        _scheduleDrainIfIdle();
      }
    }
  }

  Future<void> _processQueueItem(QueueItem item, DataSourceAdapter adapter) async {
    _log("Processing queue item with entityId: ${item.entityId}");
    final jsonMap = jsonDecode(item.entityPayload) as Map<String, dynamic>;
    await _remoteLoadingService.wrap(() async {
      switch (item.taskType) {
        case QueueTaskType.upsert:
          final updatedDto = await adapter.remote.upsert(item.entityId, jsonMap);
          if (updatedDto.createdAt == null) throw "QueueManager: upserting queue task returned createdAt as null";
          if (updatedDto.updatedAt == null) throw "QueueManager: upserting queue task returned updatedAt as null";
          await adapter.local.markAsSynced(updatedDto.id.value, updatedDto.createdAt!, updatedDto.updatedAt!);
          _excludeIdsBuffer.add(updatedDto.id.value);
          break;
        case QueueTaskType.delete:
          await adapter.remote.deleteById(item.entityId);
          unawaited(_syncManager.syncAll());
          break;
      }
    });
  }

  void _scheduleDrainIfIdle() {
    if (_isProcessing || _excludeIdsBuffer.isEmpty) return;
    _drainTimer?.cancel();
    _drainTimer = Timer(const Duration(milliseconds: 80), () {
      if (!_isProcessing && _excludeIdsBuffer.isNotEmpty) {
        final ids = Set<String>.from(_excludeIdsBuffer);
        _excludeIdsBuffer.clear();
        _drainedIds.add(ids);
      }
    });
  }

  void _emitPending() {
    streamController.add(_inMemoryQueue.where((q) => !q.done).toList());
  }

  bool isSynced(String entityId) {
    if (!_initialized) return false;
    final isPending = _inMemoryQueue.any((q) => !q.done && q.entityId == entityId);
    return !isPending;
  }

  void dispose() {
    _drainTimer?.cancel();
    _retryTimer?.cancel();
    _connSub?.cancel();
    _drainedIds.close();
    streamController.close();
    _queueLogger.dispose();
  }

  bool _isOfflineError(Object e) {
    final s = e.toString().toLowerCase();
    return e.runtimeType.toString() == 'NoInternetException' || s.contains('no internet') || s.contains('error.internet');
  }

  bool _allPaused() {
    final pending = _inMemoryQueue.where((q) => !q.done);
    if (pending.isEmpty) return false;
    for (final q in pending) {
      if (!_paused.containsKey(q.entityId)) return false;
    }
    return true;
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
      final toWake = _paused.entries.where((e) => e.value == QueuePauseReason.offline || e.value == QueuePauseReason.attemptsExhausted).map((e) => e.key).toList();

      final list = _inMemoryQueue.toList();
      for (final id in toWake) {
        final ix = list.indexWhere((q) => q.entityId == id);
        if (ix >= 0) {
          final it = list[ix];
          final reset = it.copyWith(attempts: 0, pausedReason: null);
          list[ix] = reset;
          unawaited(_queueDataSource.updateQueueItem(reset));
        }
        _paused.remove(id);
        _offlineRetryCount.remove(id);
      }
      _inMemoryQueue
        ..clear()
        ..addAll(list);

      if (_inMemoryQueue.isNotEmpty && !_isProcessing) _processNext();
    }
  }

  bool _isForeignKeyMissing(Object e) {
    final s = e.toString();
    if (!s.contains('PostgrestException')) return false;
    return s.contains('23503') || s.toLowerCase().contains('foreign key constraint') || s.toLowerCase().contains('is not present in table');
  }

  _log(String msg) {
    EntityLogger.instance.d("QueueManager", "queue", msg);
  }
}
