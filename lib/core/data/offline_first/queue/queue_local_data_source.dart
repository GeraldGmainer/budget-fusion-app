import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../utils/utils.dart';
import '../../../enums/entity_type.dart';
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
      "   attempts: ${item.attempts} / done: ${item.done}",
    );
    await db.insert('queue_items', {
      'entity_id': item.entityId,
      'task_type': item.taskType.toString(),
      'entity_type': item.entityType.toString(),
      'entity_payload': item.entityPayload,
      'attempts': item.attempts,
      'done': item.done ? 1 : 0,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateQueueItem(QueueItem item) async {
    _log("Updating queue item with entityId '${item.entityId}' in ${EntityLogger.applyColor(item.entityType.name)}");
    await db.update(
      'queue_items',
      {'task_type': item.taskType.name, 'entity_payload': item.entityPayload, 'attempts': item.attempts, 'done': item.done ? 1 : 0},
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
      return QueueItem(
        entityId: map['entity_id'] as String,
        entityType: EntityType.fromString(map['entity_type'] as String),
        taskType: QueueTaskType.fromString(map['task_type'] as String),
        entityPayload: map['entity_payload'] as String,
        attempts: map['attempts'] as int,
        done: (map['done'] as int) == 1,
      );
    }).toList();
  }

  _log(String msg) {
    EntityLogger.instance.d("QueueDataSource", "queue", msg);
  }
}
