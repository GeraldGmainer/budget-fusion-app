import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/core/data/data_sources/data_source_adapter.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

import '../models/queue_item.dart';
import 'queue_local_data_source.dart';

@lazySingleton
class QueueManager {
  static const maxAttempts = 3;
  static const networkRetryDelay = Duration(seconds: 1);

  final QueueLocalDataSource queueDataSource;
  final RemoteLoadingService remoteLoadingService;
  final ConnectivityService connectivityService;

  final Queue<QueueItem> _inMemoryQueue = Queue();
  final Map<EntityType, DataSourceAdapter> _adapters = {};
  final Set<String> _excludeIdsBuffer = <String>{};
  final List<QueueLogEntry> _logs = [];

  final StreamController<List<QueueItem>> streamController = StreamController.broadcast();
  final StreamController<Set<String>> _drainedIds = StreamController.broadcast();
  final StreamController<List<QueueLogEntry>> _logController = StreamController.broadcast();

  Timer? _drainTimer;
  Timer? _retryTimer;
  bool _isProcessing = false;
  bool _initialized = false;
  bool _isOnline = true;
  StreamSubscription<List<ConnectivityResult>>? _connSub;

  QueueManager(this.queueDataSource, this.remoteLoadingService, this.connectivityService) {
    _initConnectivity();
  }

  Stream<List<QueueItem>> get pendingItemsStream => streamController.stream;

  Stream<Set<String>> get drainedIds => _drainedIds.stream;

  Stream<List<QueueLogEntry>> get logsStream => _logController.stream;

  void register(DataSourceAdapter adapter) => _adapters[adapter.type] = adapter;

  Future<void> init() async {
    _log("init QueueManager");
    final items = await queueDataSource.fetchPendingItems();
    _inMemoryQueue.addAll(items);
    _initialized = true;
    _emitPending();
    _emitLogs();
    _log("init QueueManager done");
    _processNext();
  }

  Future<void> add(QueueItem item) async {
    if (!_initialized) throw Exception("QueueManager not initialized yet!");
    await queueDataSource.addQueueItem(item);
    _inMemoryQueue.add(item);
    _appendLog(QueueLogEvent.added, item, attempt: 0, note: null);
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

    _appendLog(QueueLogEvent.processing, currentItem, attempt: currentItem.attempts, note: null);

    try {
      await _processQueueItem(currentItem, adapter);
      _inMemoryQueue.removeFirst();
      await queueDataSource.removeQueueItem(currentItem.entityId);
      _appendLog(QueueLogEvent.succeeded, currentItem, attempt: currentItem.attempts, note: null);
      _emitPending();
    } catch (e, stack) {
      final offline = _isOfflineError(e);
      if (offline) {
        final updatedAttempts = currentItem.attempts + 1;
        if (updatedAttempts >= maxAttempts) {
          final failedItem = currentItem.copyWith(attempts: updatedAttempts, done: true);
          await queueDataSource.updateQueueItem(failedItem);
          await adapter.local.updateSyncStatus(currentItem.entityId, SyncStatus.syncFailed);
          _inMemoryQueue.removeFirst();
          _appendLog(QueueLogEvent.failed, currentItem, attempt: updatedAttempts, note: "offline");
          _emitPending();
        } else {
          final retriedItem = currentItem.copyWith(attempts: updatedAttempts);
          _inMemoryQueue.removeFirst();
          _inMemoryQueue.addFirst(retriedItem);
          await queueDataSource.updateQueueItem(retriedItem);
          BudgetLogger.instance.i("Queue offline, retry scheduled");
          _appendLog(QueueLogEvent.retried, currentItem, attempt: updatedAttempts, note: "offline");
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
          await queueDataSource.updateQueueItem(failedItem);
          await adapter.local.updateSyncStatus(currentItem.entityId, SyncStatus.syncFailed);
          _inMemoryQueue.removeFirst();
          _appendLog(QueueLogEvent.failed, currentItem, attempt: updatedAttempts, note: e.toString());
          _emitPending();
        } else {
          final retriedItem = currentItem.copyWith(attempts: updatedAttempts);
          _inMemoryQueue.removeFirst();
          _inMemoryQueue.addFirst(retriedItem);
          await queueDataSource.updateQueueItem(retriedItem);
          BudgetLogger.instance.e("Queue task failed", e, stack);
          _appendLog(QueueLogEvent.retried, currentItem, attempt: updatedAttempts, note: e.toString());
          _emitPending();
          _retryTimer?.cancel();
          _retryTimer = Timer(networkRetryDelay, () {
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
    await remoteLoadingService.wrap(() async {
      switch (item.taskType) {
        case QueueTaskType.upsert:
          final updatedDto = await adapter.remote.upsert(item.entityId, jsonMap);
          if (updatedDto.updatedAt == null) {
            throw "QueueManager: upserting queue task returned updatedAt as null";
          }
          await adapter.local.markAsSynced(updatedDto.id.value, updatedDto.updatedAt!);
          _excludeIdsBuffer.add(updatedDto.id.value);
          break;
        case QueueTaskType.delete:
          await adapter.remote.deleteById(item.entityId);
          _excludeIdsBuffer.add(item.entityId);
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
    _logController.close();
  }

  void _appendLog(QueueLogEvent event, QueueItem item, {required int attempt, String? note}) {
    final entry = QueueLogEntry(
      entityId: item.entityId,
      entityType: item.entityType,
      taskType: item.taskType,
      event: event,
      attempt: attempt,
      at: DateTime.now(),
      note: note,
    );
    _logs.insert(0, entry);
    _emitLogs();
  }

  void _emitLogs() {
    _logController.add(List.unmodifiable(_logs));
  }

  bool _isOfflineError(Object e) {
    final s = e.toString().toLowerCase();
    return e.runtimeType.toString() == 'NoInternetException' || s.contains('no internet') || s.contains('error.internet');
  }

  Future<void> _initConnectivity() async {
    _connSub = connectivityService.onConnectivityChanged.listen(_onConnectivityChanged);
    final r = await connectivityService.checkConnectivity();
    _onConnectivityChanged(r);
  }

  void _onConnectivityChanged(List<ConnectivityResult> result) {
    final nowOnline = connectivityService.evaluateResult(result);
    final wasOffline = !_isOnline && nowOnline;
    _isOnline = nowOnline;
    if (wasOffline) {
      if (_inMemoryQueue.isNotEmpty && !_isProcessing) {
        _log("reconnected to internet, retry next queue item");
        _processNext();
      }
    }
  }

  _log(String msg) {
    EntityLogger.instance.d("QueueManager", "queue", msg);
  }

  List<QueueItem> get pendingSnapshot => List.unmodifiable(_inMemoryQueue.where((q) => !q.done));

  List<QueueLogEntry> get logsSnapshot => List.unmodifiable(_logs);
}

enum QueueLogEvent { added, processing, retried, succeeded, failed }

class QueueLogEntry {
  final String entityId;
  final EntityType entityType;
  final QueueTaskType taskType;
  final QueueLogEvent event;
  final int attempt;
  final DateTime at;
  final String? note;

  const QueueLogEntry({
    required this.entityId,
    required this.entityType,
    required this.taskType,
    required this.event,
    required this.attempt,
    required this.at,
    this.note,
  });
}
