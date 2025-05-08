import 'dart:convert';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:sqflite/sqflite.dart';

abstract class OfflineFirstLocalDataSource<Dto extends OfflineFirstDto> {
  final Database db;

  OfflineFirstLocalDataSource(this.db);

  Future<List<Dto>> fetchAll({List<QueryFilter>? filters, String? orderBy}) async {
    final effectiveOrderBy = orderBy ?? defaultOrderBy;
    _log("fetchAll ${filters != null ? "with filters: $filters" : ""}");
    final filterClause = _buildWhereClause(filters);
    final rows = await db.query(
      table,
      where: filterClause?.key,
      whereArgs: filterClause?.value,
      orderBy: effectiveOrderBy,
    );
    _log("fetched ${DomainLogger.bold(rows.length)} DTOs", darkColor: true);
    final dtos = rows.map((row) {
      final dto = fromJson(row);
      return dto;
    }).toList();
    return dtos;
  }

  Future<Dto?> fetchById(String id) async {
    _log("fetchById '$id'");
    final rows = await db.query(table, where: 'id = ?', whereArgs: [id], limit: 1);
    if (rows.isEmpty) {
      _log("no row found with id: '$id'", darkColor: true);
      return null;
    }
    final dto = fromJson(rows.first);
    _log("fetched row for id '$id'", darkColor: true);
    return dto;
  }

  Future<void> save(Dto dto) async {
    _log("save for id '${dto.id.value}'");
    final stringifiedFields = _convertMapsToString(dto.toJson());
    await db.insert(table, stringifiedFields, conflictAlgorithm: ConflictAlgorithm.replace);
    _log("save success for id '${dto.id.value}'", darkColor: true);
  }

  Future<void> saveAll(List<Dto> dtos) async {
    _log("saveAll  ${DomainLogger.bold(dtos.length)} DTOs");
    final batch = db.batch();
    for (final dto in dtos) {
      final stringifiedFields = _convertMapsToString(dto.toJson());
      batch.insert(table, stringifiedFields, conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
    _log("saveAll success", darkColor: true);
  }

  Future<void> markAsSynced(String id, DateTime updated) async {
    _log("markAsSynced for id '$id' with updatedAt: $updated");
    await db.update(table, {'updated_at': updated.toIso8601String()}, where: 'id = ?', whereArgs: [id]);
    _log("markAsSynced success for id '$id'", darkColor: true);
  }

  Future<DateTime?> fetchMaxUpdatedAt() async {
    _log("fetchMaxUpdatedAt");
    final result = await db.rawQuery('SELECT MAX(updated_at) AS maxDate FROM $table');
    if (result.isEmpty) {
      _log("fetchMaxUpdatedAt not found", darkColor: true);
      return null;
    }
    final maxDate = DateTime.parse(result.first['maxDate'] as String);
    _log("fetchMaxUpdatedAt success: $maxDate", darkColor: true);
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
    DomainLogger.instance.d("LocalDataSource", table, msg, darkColor: darkColor);
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

  Future<void> deleteById(String id) async {
    _log("deleteById by ID '$id'");
    await db.delete(table, where: 'id = ?', whereArgs: [id]);
    _log("deleteById success by ID '$id'", darkColor: true);
  }

  Future<void> deleteAll() async {
    _log("deleteAll");
    await db.delete(table);
    _log("deleteAll success", darkColor: true);
  }

  String get table;

  String? get defaultOrderBy;

  Dto fromJson(Map<String, dynamic> json);
}
