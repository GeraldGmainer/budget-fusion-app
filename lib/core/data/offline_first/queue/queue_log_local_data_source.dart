import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../../core.dart';

@lazySingleton
class QueueLogLocalDataSource {
  final Database db;

  QueueLogLocalDataSource(this.db);

  Future<void> insertLog(QueueLogEntry entry) async {
    await db.insert('queue_logs', {
      'entity_id': entry.entityId,
      'entity_type': entry.entityType.name,
      'task_type': entry.taskType.name,
      'event': entry.event.name,
      'attempt': entry.attempt,
      'at': entry.at.toIso8601String(),
      'pause_reason': entry.pauseReason?.name,
    });
  }

  Future<List<QueueLogEntry>> fetchLogs({int limit = 200}) async {
    final rows = await db.query(
      'queue_logs',
      orderBy: 'id DESC',
      limit: limit,
    );
    return rows.map((map) {
      return QueueLogEntry(
        entityId: map['entity_id'] as String,
        entityType: EntityType.fromString(map['entity_type'] as String),
        taskType: QueueTaskType.fromString(map['task_type'] as String),
        event: QueueLogEvent.values.firstWhere((e) => e.name == map['event']),
        attempt: map['attempt'] as int,
        at: DateTime.parse(map['at'] as String),
        pauseReason: QueuePauseReason.fromString(map['pause_reason'] as String?),
      );
    }).toList();
  }

  Future<void> clear() async {
    await db.delete('queue_logs');
  }
}
