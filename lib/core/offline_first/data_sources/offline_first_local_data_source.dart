import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

abstract class OfflineFirstLocalDataSource<Dto extends OfflineFirstDto> {
  static final tableColor = AnsiColor.fg(180);
  final Database db;

  OfflineFirstLocalDataSource(this.db);

  String get table;

  Dto fromJson(Map<String, dynamic> json);

  Future<List<Dto>> fetchAll({List<QueryFilter>? filters}) async {
    _log("fetchAll from ${tableColor(table)} ${filters != null ? "with filters: $filters" : ""}");
    final filterClause = _buildWhereClause(filters);
    final rows = await db.query(
      table,
      where: filterClause?.key,
      whereArgs: filterClause?.value,
    );
    _log("fetched ${rows.length} rows from ${tableColor(table)}", darkColor: true);
    final dtos = rows.map((row) {
      final dto = fromJson(row);
      return dto;
    }).toList();
    return dtos;
  }

  Future<Dto?> fetchById(String id) async {
    _log("fetchById '$id' from ${tableColor(table)}");
    final rows = await db.query(table, where: 'id = ?', whereArgs: [id], limit: 1);
    if (rows.isEmpty) {
      _log("no row found with id: '$id' for ${tableColor(table)}", darkColor: true);
      return null;
    }
    final dto = fromJson(rows.first);
    _log("fetched row for id '$id' from ${tableColor(table)}", darkColor: true);
    return dto;
  }

  Future<void> save(Dto dto) async {
    _log("save for id '${dto.id.value}' to ${tableColor(table)}");
    await db.insert(table, dto.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    _log("saved successfully for id '${dto.id.value}' to ${tableColor(table)}", darkColor: true);
  }

  Future<void> saveAll(List<Dto> dtos) async {
    _log("saveAll ${dtos.length} DTOs to ${tableColor(table)}");
    final batch = db.batch();
    for (final dto in dtos) {
      batch.insert(table, dto.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
    _log("saveAll completed successfully", darkColor: true);
  }

  Future<void> markAsSynced(String id, DateTime updated) async {
    _log("markAsSynced for id '$id' in ${tableColor(table)} with updatedAt: $updated");
    await db.update(
      table,
      {'updated_at': updated.toIso8601String()},
      where: 'id = ?',
      whereArgs: [id],
    );
    _log("markAsSynced successfully for id '$id' in ${tableColor(table)}", darkColor: true);
  }

  Future<DateTime?> fetchMaxUpdatedAt() async {
    _log("fetchMaxUpdatedAt from ${tableColor(table)}");
    final result = await db.rawQuery('SELECT MAX(updated_at) AS maxDate FROM $table');
    if (result.isEmpty || result.first['maxDate'] == null) {
      _log("fetchMaxUpdatedAt not found in ${tableColor(table)}", darkColor: true);
      return null;
    }
    final maxDate = DateTime.parse(result.first['maxDate'] as String);
    _log("fetchMaxUpdatedAt from ${tableColor(table)}: $maxDate", darkColor: true);
    return maxDate;
  }

  MapEntry<String, List<dynamic>>? _buildWhereClause(List<QueryFilter>? filters) {
    if (filters == null || filters.isEmpty) {
      return null;
    }
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
    final clause = clauses.join(" AND ");
    return MapEntry(clause, whereArgs);
  }

  _log(String msg, {bool darkColor = false}) {
    final color = darkColor ? AnsiColor.fg(39) : AnsiColor.fg(111);
    BudgetLogger.instance.d("${color("LocalDataSource:  ")} $msg", short: true);
  }
}
