import 'dart:convert';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:sqflite/sqflite.dart';

abstract class OfflineFirstLocalDataSource<Dto extends OfflineFirstDto> {
  final Database db;

  OfflineFirstLocalDataSource(this.db);

  Future<List<Dto>> fetchAll({List<QueryFilter>? filters, String? orderBy}) async {
    final effectiveOrderBy = orderBy ?? defaultOrderBy;
    _log("fetchAll from $coloredDomain ${filters != null ? "with filters: $filters" : ""}");
    final filterClause = _buildWhereClause(filters);
    final rows = await db.query(
      table,
      where: filterClause?.key,
      whereArgs: filterClause?.value,
      orderBy: effectiveOrderBy,
    );
    _log("fetched ${rows.length} DTOs from $coloredDomain", darkColor: true);
    final dtos = rows.map((row) {
      final dto = fromJson(row);
      return dto;
    }).toList();
    return dtos;
  }

  Future<Dto?> fetchById(String id) async {
    _log("fetchById '$id' from $coloredDomain");
    final rows = await db.query(table, where: 'id = ?', whereArgs: [id], limit: 1);
    if (rows.isEmpty) {
      _log("no row found with id: '$id' for $coloredDomain", darkColor: true);
      return null;
    }
    final dto = fromJson(rows.first);
    _log("fetched row for id '$id' from $coloredDomain", darkColor: true);
    return dto;
  }

  Future<void> save(Dto dto) async {
    _log("save for id '${dto.id.value}' to $coloredDomain");
    final stringifiedFields = _convertMapsToString(dto.toJson());
    await db.insert(table, stringifiedFields, conflictAlgorithm: ConflictAlgorithm.replace);
    _log("save success for id '${dto.id.value}' to $coloredDomain", darkColor: true);
  }

  Future<void> saveAll(List<Dto> dtos) async {
    _log("saveAll ${dtos.length} DTOs to $coloredDomain");
    final batch = db.batch();
    for (final dto in dtos) {
      final stringifiedFields = _convertMapsToString(dto.toJson());
      batch.insert(table, stringifiedFields, conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
    _log("saveAll success to $coloredDomain", darkColor: true);
  }

  Future<void> markAsSynced(String id, DateTime updated) async {
    _log("markAsSynced for id '$id' in $coloredDomain with updatedAt: $updated");
    await db.update(table, {'updated_at': updated.toIso8601String()}, where: 'id = ?', whereArgs: [id]);
    _log("markAsSynced success for id '$id' in $coloredDomain", darkColor: true);
  }

  Future<DateTime?> fetchMaxUpdatedAt() async {
    _log("fetchMaxUpdatedAt from $coloredDomain");
    final result = await db.rawQuery('SELECT MAX(updated_at) AS maxDate FROM $table');
    if (result.isEmpty) {
      _log("fetchMaxUpdatedAt not found in $coloredDomain", darkColor: true);
      return null;
    }
    final maxDate = DateTime.parse(result.first['maxDate'] as String);
    _log("fetchMaxUpdatedAt success from $coloredDomain: $maxDate", darkColor: true);
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
    DomainLogger.instance.d("LocalDataSource", msg, darkColor: darkColor);
  }

  String get coloredDomain => DomainLogger.applyColor(table);

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

  Future<void> deleteAll() async {
    _log("deleteAll for $coloredDomain");
    await db.delete(table);
    _log("deleteAll success for $coloredDomain", darkColor: true);
  }

  String get table;

  String? get defaultOrderBy;

  Dto fromJson(Map<String, dynamic> json);
}
