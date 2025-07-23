import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:injectable/injectable.dart';

import 'queue_local_data_source.dart';

@lazySingleton
class QueueManager {
  static const maxAttempts = 3;
  final QueueLocalDataSource queueDataSource;
  final RemoteLoadingService remoteLoadingService;
  final Queue<QueueItem> _inMemoryQueue = Queue();
  final Map<EntityType, OfflineFirstRemoteDataSource> _remoteSources = {};
  final Map<EntityType, OfflineFirstLocalDataSource> _localSources = {};
  final StreamController<List<QueueItem>> streamController = StreamController.broadcast();

  Stream<List<QueueItem>> get pendingItemsStream => streamController.stream;
  bool _isProcessing = false;
  bool _initialized = false;

  QueueManager(this.queueDataSource, this.remoteLoadingService);

  void registerEntitySources(EntityType entity, OfflineFirstLocalDataSource lds, OfflineFirstRemoteDataSource rds) {
    _remoteSources[entity] = rds;
    _localSources[entity] = lds;
  }

  Future<void> init() async {
    _log("init QueueManager");
    final items = await queueDataSource.fetchPendingItems();
    _inMemoryQueue.addAll(items);
    _initialized = true;
    _emitPending();
    _log("init QueueManager done");
    _processNext();
  }

  Future<void> add(QueueItem item) async {
    if (!_initialized) {
      throw Exception("QueueManager not initialized yet!");
    }
    await queueDataSource.addQueueItem(item);
    _inMemoryQueue.add(item);

    if (!_isProcessing) {
      _processNext();
    } else {
      _emitPending();
    }
  }

  Future<void> _processNext() async {
    if (_inMemoryQueue.isEmpty) {
      _log("Queue is empty");
      return;
    }
    if (_isProcessing) {
      _log("Queue is busy");
      return;
    }
    _emitPending();

    _isProcessing = true;
    final currentItem = _inMemoryQueue.first;
    final remoteSource = _remoteSources[currentItem.entityType];
    final localSource = _localSources[currentItem.entityType];

    if (remoteSource == null || localSource == null) {
      BudgetLogger.instance.e("Queue processing error", "Entity sources not registered for entity ${currentItem.entityType}");
      return;
    }

    try {
      await _processQueueItem(currentItem, remoteSource, localSource);
      _inMemoryQueue.removeFirst();
      await queueDataSource.removeQueueItem(currentItem.entityId);
      _emitPending();
    } on Exception catch (e, stack) {
      BudgetLogger.instance.e("Queue task failed", e, stack);
      final updatedAttempts = currentItem.attempts + 1;

      if (updatedAttempts >= maxAttempts) {
        final failedItem = currentItem.copyWith(attempts: updatedAttempts, done: true);
        await queueDataSource.updateQueueItem(failedItem);
        await localSource.updateSyncStatus(currentItem.entityId, SyncStatus.syncFailed);
        _inMemoryQueue.removeFirst();
        _emitPending();
      } else {
        final retriedItem = currentItem.copyWith(attempts: updatedAttempts);
        _inMemoryQueue.removeFirst();
        _inMemoryQueue.addFirst(retriedItem);
        await queueDataSource.updateQueueItem(retriedItem);
        _emitPending();
      }
    } finally {
      _isProcessing = false;
      if (_inMemoryQueue.isNotEmpty) {
        _processNext();
      }
    }
  }

  Future<void> _processQueueItem(QueueItem item, OfflineFirstRemoteDataSource<OfflineFirstDto> remoteSource, OfflineFirstLocalDataSource<OfflineFirstDto> localSource) async {
    _log("Processing queue item with entityId: ${item.entityId}");

    final jsonMap = jsonDecode(item.entityPayload) as Map<String, dynamic>;

    try {
      await remoteLoadingService.wrap(() async {
        switch (item.taskType) {
          case QueueTaskType.upsert:
            final updatedDto = await remoteSource.upsert(item.entityId, jsonMap);
            if (updatedDto.updatedAt == null) {
              BudgetLogger.instance.i("QueueManager upsert QueueItem: $item");
              BudgetLogger.instance.i("QueueManager upsert jsonMap: $jsonMap");
              BudgetLogger.instance.i("QueueManager upsert updatedDto: $updatedDto");
              // TODO throw custom exception
              throw "QueueManager: upserting queue task returned updatedAt as null";
            }
            await localSource.markAsSynced(updatedDto.id.value, updatedDto.updatedAt!);
            break;
          case QueueTaskType.delete:
            await remoteSource.deleteById(item.entityId);
            break;
        }
      });
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("Queue processing error", e, stackTrace);
      rethrow;
    }
  }

  void _emitPending() {
    streamController.add(_inMemoryQueue.where((q) => !q.done).toList());
  }

  bool isSynced(String entityId) {
    if (!_initialized) {
      return false;
    }
    final isPending = _inMemoryQueue.any((q) => !q.done && q.entityId == entityId);
    return !isPending;
  }

  void dispose() {
    streamController.close();
  }

  _log(String msg) {
    EntityLogger.instance.d("QueueManager", "queue", msg);
  }
}
