import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../core.dart';

@lazySingleton
class QueueLocalDataSource {
  final Database db;

  QueueLocalDataSource(this.db);

  Future<void> addQueueItem(QueueItem item) async {
    await db.insert(
      'queue_items',
      {
        'entity_id': item.entityId,
        'type': item.type.toString(),
        'entity_payload': item.entityPayload,
        'attempts': item.attempts,
        'done': item.done ? 1 : 0,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateQueueItem(QueueItem item) async {
    await db.update(
      'queue_items',
      {
        'type': item.type.name,
        'entity_payload': item.entityPayload,
        'attempts': item.attempts,
        'done': item.done ? 1 : 0,
      },
      where: 'entity_id = ?',
      whereArgs: [item.entityId],
    );
  }

  Future<void> removeQueueItem(String id) async {
    await db.delete(
      'queue_items',
      where: 'entity_id = ?',
      whereArgs: [id],
    );
  }

  Future<List<QueueItem>> fetchPendingItems() async {
    final rows = await db.query(
      'queue_items',
      where: 'done = 0',
    );
    return rows.map((map) {
      return QueueItem(
        entityId: map['entity_id'] as String,
        domain: DomainType.fromString(map['domain'] as String),
        type: QueueTaskType.fromString(map['type'] as String),
        entityPayload: map['entity_payload'] as String,
        attempts: map['attempts'] as int,
        done: (map['done'] as int) == 1,
      );
    }).toList();
  }
}
