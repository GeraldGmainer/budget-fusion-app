import 'package:budget_fusion_app/core/core.dart';
import 'package:sqflite/sqflite.dart';

abstract class OfflineFirstLocalDataSource<Dto extends OfflineFirstDto> {
  final Database db;

  OfflineFirstLocalDataSource(this.db);

  Future<List<Dto>> fetchAll({List<QueryFilter>? filters}) async {
    final filterClause = _buildWhereClause(filters);
    final rows = await db.query(
      table,
      where: filterClause?.key,
      whereArgs: filterClause?.value,
    );
    return rows.map((row) => fromJson(row)).toList();
  }

  Future<Dto?> fetchById(String id) async {
    final rows = await db.query(table, where: 'id = ?', whereArgs: [id], limit: 1);
    if (rows.isEmpty) return null;
    return fromJson(rows.first);
  }

  Future<void> save(Dto dto) async {
    await db.insert(table, dto.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> saveAll(List<Dto> dtos) async {
    final batch = db.batch();
    for (final dto in dtos) {
      batch.insert(table, dto.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
  }

  Future<void> markAsSynced(String id, DateTime updated) async {
    await db.update(
      table,
      {'updated_at': updated.toIso8601String()},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<DateTime?> fetchMaxUpdatedAt() async {
    final result = await db.rawQuery('SELECT MAX(updated_at) AS maxDate FROM $table');
    if (result.isEmpty || result.first['maxDate'] == null) {
      return null;
    }
    return DateTime.parse(result.first['maxDate'] as String);
  }

  MapEntry<String, List<dynamic>>? _buildWhereClause(List<QueryFilter>? filters) {
    if (filters == null || filters.isEmpty) return null;
    final clauses = <String>[];
    final whereArgs = <dynamic>[];
    for (final filter in filters) {
      switch (filter.operator) {
        case QueryOperator.equal:
          clauses.add("${filter.column} = ?");
          break;
        case QueryOperator.notEqual:
          clauses.add("${filter.column} != ?");
          break;
        case QueryOperator.greaterThan:
          clauses.add("${filter.column} > ?");
          break;
        case QueryOperator.lessThan:
          clauses.add("${filter.column} < ?");
          break;
      }
      whereArgs.add(filter.value);
    }
    return MapEntry(clauses.join(" AND "), whereArgs);
  }

  String get table;

  Dto fromJson(Map<String, dynamic> json);
}
