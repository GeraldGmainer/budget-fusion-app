import 'dart:async';

import 'package:injectable/injectable.dart';

import '../models/queue_item.dart';
import 'queue_log_entry.dart';
import 'queue_log_local_data_source.dart';

@lazySingleton
class QueueLogger {
  final QueueLogLocalDataSource _dataSource;
  final StreamController<List<QueueLogEntry>> _logController = StreamController.broadcast();

  QueueLogger(this._dataSource);

  Stream<List<QueueLogEntry>> get logsStream => _logController.stream;

  Future<void> log(QueueLogEvent event, QueueItem item) async {
    final entry = QueueLogEntry(
      entityId: item.entityId,
      entityType: item.entityType,
      taskType: item.taskType,
      event: event,
      attempt: item.attempts,
      at: DateTime.now(),
      pauseReason: item.pauseReason,
    );
    await _dataSource.insertLog(entry);
    final logs = await _dataSource.fetchLogs();
    _logController.add(logs);
  }

  Future<void> clearAll() async {
    await _dataSource.clear();
    _logController.add(const []);
  }

  Future<List<QueueLogEntry>> get logsSnapshot => _dataSource.fetchLogs();

  void dispose() {
    _logController.close();
  }
}
