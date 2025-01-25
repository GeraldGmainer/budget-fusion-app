import 'dart:collection';

import 'package:injectable/injectable.dart';

import '../../utils/utils.dart';

@lazySingleton
class QueueManager {
  final _queue = Queue<Future<void> Function()>();
  bool _isProcessing = false;

  void add(Future<void> Function() task) {
    _queue.add(task);
    _processNext();
  }

  void _processNext() async {
    if (_isProcessing || _queue.isEmpty) return;

    _isProcessing = true;
    try {
      await _queue.removeFirst()();
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("Queue task failed", e, stackTrace);
    } finally {
      _isProcessing = false;
      _processNext();
    }
  }
}
