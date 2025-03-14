import 'dart:async';
import 'dart:collection';

import 'package:injectable/injectable.dart';

import '../../../utils/utils.dart';
import '../models/queue_item.dart';
import 'queue_item_processor.dart';
import 'queue_local_data_source.dart';

@lazySingleton
class QueueManager {
  static const maxAttempts = 3;
  final QueueLocalDataSource localDataSource;
  final Map<String, QueueItemProcessor> domainProcessors;
  final Queue<QueueItem> _inMemoryQueue = Queue();

  bool _isProcessing = false;
  bool _initialized = false;

  QueueManager({
    required this.localDataSource,
    required List<QueueItemProcessor> processors,
  }) : domainProcessors = {
          for (final p in processors) p.domainKey: p,
        };

  Future<void> init() async {
    final items = await localDataSource.fetchPendingItems();
    _inMemoryQueue.addAll(items);
    _initialized = true;
    _processNext();
  }

  Future<void> add(QueueItem item) async {
    if (!_initialized) {
      throw Exception("GlobalQueueManager not initialized yet!");
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
      await localDataSource.removeQueueItem(currentItem.id);
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
    final processor = domainProcessors[item.domain];
    if (processor == null) {
      throw Exception("No processor found for domain: ${item.domain}");
    }
    await processor.processItem(item);
  }
}
