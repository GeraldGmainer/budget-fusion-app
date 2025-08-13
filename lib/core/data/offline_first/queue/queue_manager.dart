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
  static const networkRetryDelay = Duration(seconds: 1);

  final QueueLocalDataSource _queueDataSource;
  final RemoteLoadingService _remoteLoadingService;
  final ConnectivityService _connectivityService;
  final QueueLogger _queueLogger;
  final SyncManager _syncManager;

  final Queue<QueueItem> _inMemoryQueue = Queue();
  final Map<EntityType, DataSourceAdapter> _adapters = {};
  final Set<String> _excludeIdsBuffer = <String>{};

  final Map<String, int> _offlineRetryCount = {};
  final Set<String> _pausedIds = <String>{};

  final StreamController<List<QueueItem>> streamController = StreamController.broadcast();
  final StreamController<Set<String>> _drainedIds = StreamController.broadcast();

  Timer? _drainTimer;
  Timer? _retryTimer;
  bool _isProcessing = false;
  bool _initialized = false;
  bool _isOnline = true;
  StreamSubscription<List<ConnectivityResult>>? _connSub;

  List<QueueItem> get pendingSnapshot => List.unmodifiable(_inMemoryQueue.where((q) => !q.done));

  List<QueueLogEntry> get logsSnapshot => _queueLogger.logsSnapshot;

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
    _inMemoryQueue.addAll(items);
    _initialized = true;
    _emitPending();
    _log("init QueueManager done");
    _processNext();
  }

  Future<void> add(QueueItem item) async {
    if (!_initialized) throw Exception("QueueManager not initialized yet!");
    await _queueDataSource.addQueueItem(item);
    _inMemoryQueue.add(item);
    _queueLogger.log(QueueLogEvent.added, item, attempt: 0, note: null);
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

    if (_isOnline && _pausedIds.isNotEmpty) {
      _pausedIds.clear();
      _offlineRetryCount.clear();
    }

    if (_allPaused()) {
      _log("All items paused for offline");
      _scheduleDrainIfIdle();
      return;
    }

    while (_inMemoryQueue.isNotEmpty && _pausedIds.contains(_inMemoryQueue.first.entityId)) {
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

    _queueLogger.log(QueueLogEvent.processing, currentItem, attempt: currentItem.attempts, note: null);

    try {
      await _processQueueItem(currentItem, adapter);
      _inMemoryQueue.removeFirst();
      await _queueDataSource.removeQueueItem(currentItem.entityId);
      _offlineRetryCount.remove(currentItem.entityId);
      _pausedIds.remove(currentItem.entityId);
      _queueLogger.log(QueueLogEvent.succeeded, currentItem, attempt: currentItem.attempts, note: null);
      _emitPending();
    } catch (e, stack) {
      final offline = _isOfflineError(e);
      if (offline) {
        final count = (_offlineRetryCount[currentItem.entityId] ?? 0) + 1;
        _offlineRetryCount[currentItem.entityId] = count;
        if (count >= offlineMaxRetries) {
          _pausedIds.add(currentItem.entityId);
          _queueLogger.log(QueueLogEvent.retried, currentItem, attempt: currentItem.attempts, note: "offline paused");
          _emitPending();
        } else {
          BudgetLogger.instance.i("Queue offline, retry $count/$offlineMaxRetries scheduled");
          _queueLogger.log(QueueLogEvent.retried, currentItem, attempt: currentItem.attempts, note: "offline");
          _emitPending();
          _retryTimer?.cancel();
          _retryTimer = Timer(networkRetryDelay, () {
            if (_inMemoryQueue.isNotEmpty && !_isProcessing) _processNext();
          });
        }
      } else {
        final updatedAttempts = currentItem.attempts + 1;
        if (updatedAttempts >= maxAttempts) {
          final failedItem = currentItem.copyWith(attempts: updatedAttempts, done: true);
          await _queueDataSource.updateQueueItem(failedItem);
          final failStatus = currentItem.taskType == QueueTaskType.delete ? SyncStatus.deleteFailed : SyncStatus.syncFailed;
          await adapter.local.updateSyncStatus(currentItem.entityId, failStatus);
          _inMemoryQueue.removeFirst();
          _offlineRetryCount.remove(currentItem.entityId);
          _pausedIds.remove(currentItem.entityId);
          _queueLogger.log(QueueLogEvent.failed, currentItem, attempt: updatedAttempts, note: e.toString());
          _emitPending();
        } else {
          final retriedItem = currentItem.copyWith(attempts: updatedAttempts);
          _inMemoryQueue.removeFirst();
          _inMemoryQueue.addFirst(retriedItem);
          await _queueDataSource.updateQueueItem(retriedItem);
          final failStatus = currentItem.taskType == QueueTaskType.delete ? SyncStatus.deleteFailed : SyncStatus.syncFailed;
          await adapter.local.updateSyncStatus(currentItem.entityId, failStatus);
          BudgetLogger.instance.e("Queue task failed", e, stack);
          _queueLogger.log(QueueLogEvent.retried, currentItem, attempt: updatedAttempts, note: e.toString());
          _emitPending();
          _retryTimer?.cancel();
          _retryTimer = Timer(networkRetryDelay, () {
            if (_inMemoryQueue.isNotEmpty && !_isProcessing) {
              _processNext();
            }
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
    if (_inMemoryQueue.isNotEmpty || _isProcessing || _excludeIdsBuffer.isEmpty) return;
    _drainTimer?.cancel();
    _drainTimer = Timer(const Duration(milliseconds: 80), () {
      if (_inMemoryQueue.isEmpty && !_isProcessing && _excludeIdsBuffer.isNotEmpty) {
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
    if (_inMemoryQueue.isEmpty) return false;
    for (final q in _inMemoryQueue) {
      if (!_pausedIds.contains(q.entityId)) return false;
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
      _pausedIds.clear();
      _offlineRetryCount.clear();
      if (_inMemoryQueue.isNotEmpty && !_isProcessing) _processNext();
    }
  }

  _log(String msg) {
    EntityLogger.instance.d("QueueManager", "queue", msg);
  }
}
