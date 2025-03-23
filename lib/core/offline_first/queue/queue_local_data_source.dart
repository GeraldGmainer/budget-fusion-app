import 'package:budget_fusion_app/utils/utils.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

import '../../core.dart';

@lazySingleton
class QueueLocalDataSource {
  final Database db;

  QueueLocalDataSource(this.db);

  Future<void> addQueueItem(QueueItem item) async {
    _log("Adding queue item with entityId '${item.entityId}'");
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
    _log("Updating queue item with entityId '${item.entityId}'");
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
    _log("Removing queue item with entityId '$id'");
    await db.delete(
      'queue_items',
      where: 'entity_id = ?',
      whereArgs: [id],
    );
  }

  Future<List<QueueItem>> fetchPendingItems() async {
    _log("Fetching pending queue items");
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

  _log(String msg) {
    final color = AppLogColors.queueLocalDataSource;
    BudgetLogger.instance.d("${color("QLS: ")} $msg", short: true);
  }
}
