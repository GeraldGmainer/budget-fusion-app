import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../utils/utils.dart';
import '../../../enums/entity_type.dart';
import '../enums/queue_pause_reason.dart';
import '../enums/queue_task_type.dart';
import '../models/queue_item.dart';

@lazySingleton
class QueueLocalDataSource {
  final Database db;

  QueueLocalDataSource(this.db);

  Future<void> addQueueItem(QueueItem item) async {
    _log("Adding queue item with entityId '${item.entityId}' in ${EntityLogger.applyColor(item.entityType.name)}");
    BudgetLogger.instance.d(
      "add queue item:\n"
      "   taskType: ${item.taskType}\n"
      "   entityType: ${item.entityType}\n"
      "   entityPayload: ${item.entityPayload}\n"
      "   attempts: ${item.attempts} / done: ${item.done} / pauseReason: ${item.pauseReason}\n"
      "   error: ${item.lastError} / at: ${item.lastErrorAt}",
    );
    await db.insert('queue_items', {
      'entity_id': item.entityId,
      'task_type': item.taskType.name.toString(),
      'entity_type': item.entityType.toString(),
      'entity_payload': item.entityPayload,
      'attempts': item.attempts,
      'done': item.done ? 1 : 0,
      'pause_reason': item.pauseReason?.name.toString(),
      'last_error': item.lastError,
      'last_error_at': item.lastErrorAt?.toIso8601String(),
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateQueueItem(QueueItem item) async {
    _log("Updating queue item with entityId '${item.entityId}' in ${EntityLogger.applyColor(item.entityType.name)}");
    await db.update(
      'queue_items',
      {
        'task_type': item.taskType.name.toString(),
        'entity_payload': item.entityPayload.toString(),
        'attempts': item.attempts,
        'done': item.done ? 1 : 0,
        'pause_reason': item.pauseReason?.name.toString(),
        'last_error': item.lastError,
        'last_error_at': item.lastErrorAt?.toIso8601String(),
      },
      where: 'entity_id = ?',
      whereArgs: [item.entityId],
    );
  }

  Future<void> removeQueueItem(String id) async {
    _log("Removing queue item with entityId '$id'");
    await db.delete('queue_items', where: 'entity_id = ?', whereArgs: [id]);
  }

  Future<List<QueueItem>> fetchPendingItems() async {
    _log("Fetching pending queue items");
    final rows = await db.query('queue_items', where: 'done = 0');
    return rows.map((map) {
      final atStr = map['last_error_at'] as String?;
      final at = (atStr == null || atStr.isEmpty) ? null : DateTime.tryParse(atStr);
      return QueueItem(
        entityId: map['entity_id'] as String,
        entityType: EntityType.fromString(map['entity_type'] as String),
        taskType: QueueTaskType.fromString(map['task_type'] as String),
        entityPayload: map['entity_payload'] as String,
        attempts: map['attempts'] as int,
        done: (map['done'] as int) == 1,
        pauseReason: QueuePauseReason.fromString(map['pause_reason'] as String?),
        lastError: map['last_error'] as String?,
        lastErrorAt: at,
      );
    }).toList();
  }

  void _log(String msg) {
    EntityLogger.instance.d("QueueDataSource", "queue", msg);
  }
}
