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
        'id': item.id,
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
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  Future<void> removeQueueItem(String id) async {
    await db.delete(
      'queue_items',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<QueueItem>> fetchPendingItems() async {
    final rows = await db.query(
      'queue_items',
      where: 'done = 0',
      orderBy: 'id ASC',
    );
    return rows.map((map) {
      return QueueItem(
        id: map['id'] as String,
        domain: _domainFromString(map['domain'] as String),
        type: _typeFromString(map['type'] as String),
        entityPayload: map['entity_payload'] as String,
        attempts: map['attempts'] as int,
        done: (map['done'] as int) == 1,
      );
    }).toList();
  }

  QueueTaskType _typeFromString(String value) {
    return QueueTaskType.values.firstWhere((e) => e.name == value, orElse: () => throw Exception("Invalid queue task type: $value"));
  }

  DomainType _domainFromString(String value) {
    return DomainType.values.firstWhere((e) => e.name == value, orElse: () => throw Exception("Invalid domain type: $value"));
  }
}
