import 'dart:async';

import 'package:injectable/injectable.dart';

import '../models/queue_item.dart';
import 'queue_log_entry.dart';

@lazySingleton
class QueueLogger {
  final List<QueueLogEntry> _logs = [];
  final StreamController<List<QueueLogEntry>> _logController = StreamController.broadcast();

  Stream<List<QueueLogEntry>> get logsStream => _logController.stream;

  void log(QueueLogEvent event, QueueItem item, {required int attempt, String? note}) {
    final entry = QueueLogEntry(
      entityId: item.entityId,
      entityType: item.entityType,
      taskType: item.taskType,
      event: event,
      attempt: attempt,
      at: DateTime.now(),
      note: note,
      pauseReason: item.pauseReason,
    );
    _logs.insert(0, entry);
    _emitLogs();
  }

  void _emitLogs() {
    _logController.add(List.unmodifiable(_logs));
  }

  void dispose() {
    _logController.close();
  }

  List<QueueLogEntry> get logsSnapshot => List.unmodifiable(_logs);
}
