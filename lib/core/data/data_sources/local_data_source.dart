import 'dart:convert';

import 'package:sqflite/sqflite.dart';

import '../../../../utils/utils.dart';
import '../../core.dart';

abstract class LocalDataSource<E extends Dto> {
  final Database db;

  LocalDataSource(this.db);

  Future<List<E>> fetchAll({List<QueryFilter>? filters, String? orderBy}) async {
    final effectiveOrderBy = orderBy ?? defaultOrderBy;
    final filterClause = _buildWhereClause(filters);
    final rows = await db.query(table, where: filterClause?.key, whereArgs: filterClause?.value, orderBy: effectiveOrderBy);
    return rows.map((m) => fromJson(m)).toList();
  }

  Future<E?> fetchById(String id) async {
    _log("fetchById '$id'");
    final rows = await db.query(table, where: 'id = ?', whereArgs: [id], limit: 1);
    if (rows.isEmpty) {
      _log("no row found with id: '$id'", darkColor: true);
      return null;
    }
    _log("fetched row for id '$id'", darkColor: true);
    return fromJson(rows.first);
  }

  Future<void> save(E dto) async {
    _log("save for id '${dto.id.value}'");
    final data = dto.toJson();
    final stringifiedFields = _convertMapsToString(data);
    await db.insert(table, stringifiedFields, conflictAlgorithm: ConflictAlgorithm.replace);
    _log("save success for id '${dto.id.value}'", darkColor: true);
  }

  Future<void> saveAll(List<E> dtos) async {
    _log("saveAll ${EntityLogger.bold(dtos.length)} DTOs");
    final batch = db.batch();
    for (final dto in dtos) {
      final data = dto.toJson();
      final stringifiedFields = _convertMapsToString(data);
      batch.insert(table, stringifiedFields, conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
    _log("saveAll success", darkColor: true);
  }

  Future<void> saveAllNotSynced(List<E> dtos) async {
    if (dtos.isEmpty) return;
    _log("saveAllNotSynced ${EntityLogger.bold(dtos.length)} DTOs");
    final batch = db.batch();
    for (final dto in dtos) {
      final data = dto.toJson();
      data['sync_status'] = SyncStatus.synced.name;
      batch.insert(table, _convertMapsToString(data), conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
    // _log("saveAllNotSynced success", darkColor: true);
  }

  Future<void> markAsSynced(String id, DateTime created, DateTime updated) async {
    _log("markAsSynced for id '$id' with createdAt: $created, updatedAt: $updated");
    await db.rawUpdate(
      'UPDATE $table '
      'SET sync_status = ?, '
      '    updated_at = ?, '
      '    created_at = COALESCE(created_at, ?) '
      'WHERE id = ?',
      [
        SyncStatus.synced.name,
        updated.toUtc().toIso8601String(),
        created.toUtc().toIso8601String(),
        id,
      ],
    );
    _log("markAsSynced success for id '$id'", darkColor: true);
  }

  Future<void> updateSyncStatus(String id, SyncStatus status) async {
    _log("updateSyncStatus for id '$id' with SyncStatus: $status");
    await db.update(table, {'sync_status': status.name}, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> markPendingDelete(String id) async {
    _log("markPendingDelete for id '$id'");
    await db.update(table, {'sync_status': SyncStatus.pendingDelete.name}, where: 'id = ?', whereArgs: [id]);
    _log("markPendingDelete success for id '$id'", darkColor: true);
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

  void _log(String msg, {bool darkColor = false}) {
    EntityLogger.instance.d("LocalDataSource", table, msg, darkColor: darkColor);
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

  Future<void> deleteByIds(Iterable<String> ids) async {
    final list = ids.toList();
    if (list.isEmpty) return;

    _log("deleteByIds count ${EntityLogger.bold(list.length)}");

    const chunkSize = 900;
    final batch = db.batch();

    for (var i = 0; i < list.length; i += chunkSize) {
      final end = (i + chunkSize < list.length) ? i + chunkSize : list.length;
      final slice = list.sublist(i, end);
      final placeholders = List.filled(slice.length, '?').join(', ');
      batch.delete(table, where: 'id IN ($placeholders)', whereArgs: slice);
    }

    await batch.commit(noResult: true);
    _log("deleteByIds success", darkColor: true);
  }

  Future<void> deleteAll() async {
    _log("deleteAll");
    await db.delete(table);
    _log("deleteAll success", darkColor: true);
  }

  String get table;

  String? get defaultOrderBy;

  E fromJson(Map<String, dynamic> json);
}
