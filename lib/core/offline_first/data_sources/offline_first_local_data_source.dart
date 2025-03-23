import 'dart:convert';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

abstract class OfflineFirstLocalDataSource<Dto extends OfflineFirstDto> {
  final Database db;

  OfflineFirstLocalDataSource(this.db);

  String get table;

  Dto fromJson(Map<String, dynamic> json);

  Future<List<Dto>> fetchAll({List<QueryFilter>? filters}) async {
    _log("fetchAll from ${AppLogColors.applyColor(table)} ${filters != null ? "with filters: $filters" : ""}");
    final filterClause = _buildWhereClause(filters);
    final rows = await db.query(
      table,
      where: filterClause?.key,
      whereArgs: filterClause?.value,
    );
    _log("fetched ${rows.length} DTOs from ${AppLogColors.applyColor(table)}", darkColor: true);
    final dtos = rows.map((row) {
      final dto = fromJson(row);
      return dto;
    }).toList();
    return dtos;
  }

  Future<Dto?> fetchById(String id) async {
    _log("fetchById '$id' from ${AppLogColors.applyColor(table)}");
    final rows = await db.query(table, where: 'id = ?', whereArgs: [id], limit: 1);
    if (rows.isEmpty) {
      _log("no row found with id: '$id' for ${AppLogColors.applyColor(table)}", darkColor: true);
      return null;
    }
    final dto = fromJson(rows.first);
    _log("fetched row for id '$id' from ${AppLogColors.applyColor(table)}", darkColor: true);
    return dto;
  }

  Future<void> save(Dto dto) async {
    _log("save for id '${dto.id.value}' to ${AppLogColors.applyColor(table)}");
    final stringifiedFields = _convertMapsToString(dto.toJson());
    await db.insert(table, stringifiedFields, conflictAlgorithm: ConflictAlgorithm.replace);
    _log("save success for id '${dto.id.value}' to ${AppLogColors.applyColor(table)}", darkColor: true);
  }

  Future<void> saveAll(List<Dto> dtos) async {
    _log("saveAll ${dtos.length} DTOs to ${AppLogColors.applyColor(table)}");
    final batch = db.batch();
    for (final dto in dtos) {
      final stringifiedFields = _convertMapsToString(dto.toJson());
      batch.insert(table, stringifiedFields, conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
    _log("saveAll success to ${AppLogColors.applyColor(table)}", darkColor: true);
  }

  Future<void> markAsSynced(String id, DateTime updated) async {
    _log("markAsSynced for id '$id' in ${AppLogColors.applyColor(table)} with updatedAt: $updated");
    await db.update(
      table,
      {'updated_at': updated.toIso8601String()},
      where: 'id = ?',
      whereArgs: [id],
    );
    _log("markAsSynced successfully for id '$id' in ${AppLogColors.applyColor(table)}", darkColor: true);
  }

  Future<DateTime?> fetchMaxUpdatedAt() async {
    _log("fetchMaxUpdatedAt from ${AppLogColors.applyColor(table)}");
    final result = await db.rawQuery('SELECT MAX(updated_at) AS maxDate FROM $table');
    if (result.isEmpty || result.first['maxDate'] == null) {
      _log("fetchMaxUpdatedAt not found in ${AppLogColors.applyColor(table)}", darkColor: true);
      return null;
    }
    final maxDate = DateTime.parse(result.first['maxDate'] as String);
    _log("fetchMaxUpdatedAt from ${AppLogColors.applyColor(table)}: $maxDate", darkColor: true);
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
    final color = darkColor ? AppLogColors.localDataSourceEnd : AppLogColors.localDataSourceStart;
    BudgetLogger.instance.d("${color("LocalDataSource:  ")} $msg", short: true);
  }

  Map<String, dynamic> _convertMapsToString(Map<String, dynamic> input) {
    final output = <String, dynamic>{};

    input.forEach((key, value) {
      if (value is Map) {
        output[key] = jsonEncode(value);
      } else if (value is List) {
        output[key] = value.map((element) {
          if (element is Map) {
            return jsonEncode(element);
          } else if (element is List) {
            return element.map((e) => e is Map ? jsonEncode(e) : e).toList();
          }
          return element;
        }).toList();
      } else {
        output[key] = value;
      }
    });

    return output;
  }
}
