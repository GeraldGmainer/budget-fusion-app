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
  final Queue<QueueItem> _inMemoryQueue = Queue();
  final Map<DomainType, OfflineFirstRemoteDataSource> _remoteSources = {};
  final Map<DomainType, OfflineFirstLocalDataSource> _localSources = {};
  bool _isProcessing = false;
  bool _initialized = false;

  QueueManager(this.localDataSource);

  void registerDomainSources(
    DomainType domain,
    OfflineFirstLocalDataSource localSource,
    OfflineFirstRemoteDataSource remoteSource,
  ) {
    _remoteSources[domain] = remoteSource;
    _localSources[domain] = localSource;
  }

  Future<void> init() async {
    final items = await localDataSource.fetchPendingItems();
    _inMemoryQueue.addAll(items);
    _initialized = true;
    _processNext();
  }

  Future<void> add(QueueItem item) async {
    if (!_initialized) {
      throw Exception("QueueManager not initialized yet!");
    }
    await localDataSource.addQueueItem(item);
    _inMemoryQueue.add(item);
    _processNext();
  }

  void _processNext() async {
    if (_isProcessing || _inMemoryQueue.isEmpty) return;

    _isProcessing = true;
    final currentItem = _inMemoryQueue.first;

    try {
      await _processQueueItem(currentItem);
      _inMemoryQueue.removeFirst();
      await localDataSource.removeQueueItem(currentItem.entityId);
    } on Exception catch (e, stack) {
      BudgetLogger.instance.e("Queue task failed", e, stack);
      final updatedAttempts = currentItem.attempts + 1;

      if (updatedAttempts >= maxAttempts) {
        final failedItem = currentItem.copyWith(attempts: updatedAttempts, done: true);
        await localDataSource.updateQueueItem(failedItem);
        _inMemoryQueue.removeFirst();
      } else {
        final retriedItem = currentItem.copyWith(attempts: updatedAttempts);
        _inMemoryQueue.removeFirst();
        _inMemoryQueue.addFirst(retriedItem);
        await localDataSource.updateQueueItem(retriedItem);
      }
    } finally {
      _isProcessing = false;
      if (_inMemoryQueue.isNotEmpty) {
        _processNext();
      }
    }
  }

  Future<void> _processQueueItem(QueueItem item) async {
    _log("Processing queue item: $item");

    final remoteSource = _remoteSources[item.domain];
    final localSource = _localSources[item.domain];
    if (remoteSource == null || localSource == null) {
      throw Exception("Domain sources not registered for domain ${item.domain}");
    }
    final jsonMap = jsonDecode(item.entityPayload) as Map<String, dynamic>;

    try {
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
          await remoteSource.delete(item.entityId);
          break;
      }
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("Queue processing error", e, stackTrace);
      rethrow;
    }
  }

  void dispose() {
    streamController.close();
  }

  final StreamController<List<QueueItem>> streamController = StreamController.broadcast();

  _log(String msg) {
    DomainLogger.instance.d("QueueManager", msg);
  }
}
