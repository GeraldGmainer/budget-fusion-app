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
  final QueueLocalDataSource localDataSource;
  final RemoteLoadingService remoteLoadingService;
  final Queue<QueueItem> _inMemoryQueue = Queue();
  final Map<DomainType, OfflineFirstRemoteDataSource> _remoteSources = {};
  final Map<DomainType, OfflineFirstLocalDataSource> _localSources = {};
  final StreamController<List<QueueItem>> streamController = StreamController.broadcast();

  Stream<List<QueueItem>> get pendingItemsStream => streamController.stream;
  bool _isProcessing = false;
  bool _initialized = false;

  QueueManager(this.localDataSource, this.remoteLoadingService);

  void registerDomainSources(DomainType domain, OfflineFirstLocalDataSource lds, OfflineFirstRemoteDataSource rds) {
    _remoteSources[domain] = rds;
    _localSources[domain] = lds;
  }

  Future<void> init() async {
    _log("init QueueManager");
    final items = await localDataSource.fetchPendingItems();
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
    await localDataSource.addQueueItem(item);
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

    try {
      await _processQueueItem(currentItem);
      _inMemoryQueue.removeFirst();
      await localDataSource.removeQueueItem(currentItem.entityId);
      _emitPending();
    } on Exception catch (e, stack) {
      BudgetLogger.instance.e("Queue task failed", e, stack);
      final updatedAttempts = currentItem.attempts + 1;

      if (updatedAttempts >= maxAttempts) {
        final failedItem = currentItem.copyWith(attempts: updatedAttempts, done: true);
        await localDataSource.updateQueueItem(failedItem);
        _inMemoryQueue.removeFirst();
        _emitPending();
      } else {
        final retriedItem = currentItem.copyWith(attempts: updatedAttempts);
        _inMemoryQueue.removeFirst();
        _inMemoryQueue.addFirst(retriedItem);
        await localDataSource.updateQueueItem(retriedItem);
        _emitPending();
      }
    } finally {
      _isProcessing = false;
      if (_inMemoryQueue.isNotEmpty) {
        _processNext();
      }
    }
  }

  Future<void> _processQueueItem(QueueItem item) async {
    _log("Processing queue item with entityId: ${item.entityId}");

    final remoteSource = _remoteSources[item.domain];
    final localSource = _localSources[item.domain];
    if (remoteSource == null || localSource == null) {
      throw Exception("Domain sources not registered for domain ${item.domain}");
    }
    final jsonMap = jsonDecode(item.entityPayload) as Map<String, dynamic>;

    try {
      await remoteLoadingService.wrap(() async {
        switch (item.type) {
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
    DomainLogger.instance.d("QueueManager", "queue", msg);
  }
}
