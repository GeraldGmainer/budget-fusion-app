import 'dart:convert';

import 'package:sqflite/sqflite.dart';

import '../../../../utils/utils.dart';
import '../enums/sync_status.dart';
import '../filters/query_filter.dart';
import '../filters/query_operator.dart';
import '../models/offline_first_dto.dart';
import '../models/sync_meta.dart';
import '../models/synced_dto.dart';

abstract class OfflineFirstLocalDataSource<Dto extends OfflineFirstDto> {
  final Database db;

  OfflineFirstLocalDataSource(this.db);

  SyncedDto<Dto> _mapRowToSyncedDto(Map<String, dynamic> row) {
    final m = Map<String, dynamic>.from(row);
    final statusString = m.remove('sync_status') as String;
    final lastSyncedAtString = m.remove('last_synced_at') as String?;
    final modifiedLocallyAtString = m.remove('modified_locally_at') as String?;
    final meta = SyncMeta(
      status: SyncStatus.values.firstWhere((e) => e.toString().split('.').last == statusString),
      lastSyncedAt: lastSyncedAtString == null ? null : DateTime.parse(lastSyncedAtString).toLocal(),
      modifiedLocallyAt: modifiedLocallyAtString == null ? null : DateTime.parse(modifiedLocallyAtString).toLocal(),
    );
    final dto = fromJson(m);
    return SyncedDto(dto: dto, syncMeta: meta);
  }

  Future<List<SyncedDto<Dto>>> fetchAll({List<QueryFilter>? filters, String? orderBy}) async {
    final effectiveOrderBy = orderBy ?? defaultOrderBy;
    _log("fetchAll ${filters != null ? "with filters: $filters" : ""}");
    final filterClause = _buildWhereClause(filters);
    final rows = await db.query(table, where: filterClause?.key, whereArgs: filterClause?.value, orderBy: effectiveOrderBy);
    _log("fetched ${EntityLogger.bold(rows.length)} DTOs", darkColor: true);
    return rows.map(_mapRowToSyncedDto).toList();
  }

  Future<SyncedDto<Dto>?> fetchById(String id) async {
    _log("fetchById '$id'");
    final rows = await db.query(table, where: 'id = ?', whereArgs: [id], limit: 1);
    if (rows.isEmpty) {
      _log("no row found with id: '$id'", darkColor: true);
      return null;
    }
    _log("fetched row for id '$id'", darkColor: true);
    return _mapRowToSyncedDto(rows.first);
  }

  Future<void> save(SyncedDto<Dto> syncedDto) async {
    _log("save for id '${syncedDto.dto.id.value}'");
    final data = syncedDto.dto.toJson();
    data['sync_status'] = syncedDto.syncMeta.status.toString().split('.').last;
    data['last_synced_at'] = syncedDto.syncMeta.lastSyncedAt?.toUtc().toIso8601String();
    data['modified_locally_at'] = syncedDto.syncMeta.modifiedLocallyAt?.toUtc().toIso8601String();
    final stringifiedFields = _convertMapsToString(data);
    await db.insert(table, stringifiedFields, conflictAlgorithm: ConflictAlgorithm.replace);
    _log("save success for id '${syncedDto.dto.id.value}'", darkColor: true);
  }

  Future<void> saveAll(List<SyncedDto<Dto>> syncedDtos) async {
    _log("saveAll ${EntityLogger.bold(syncedDtos.length)} DTOs");
    final batch = db.batch();
    for (final dto in syncedDtos) {
      final data = dto.dto.toJson();
      data['sync_status'] = dto.syncMeta.status.toString().split('.').last;
      data['last_synced_at'] = dto.syncMeta.lastSyncedAt?.toUtc().toIso8601String();
      data['modified_locally_at'] = dto.syncMeta.modifiedLocallyAt?.toUtc().toIso8601String();
      final stringifiedFields = _convertMapsToString(data);
      batch.insert(table, stringifiedFields, conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
    _log("saveAll success", darkColor: true);
  }

  Future<void> saveAllNotSynced(List<Dto> dtos) async {
    _log("saveAllNotSynced ${dtos.length} DTOs");
    final batch = db.batch();
    for (final dto in dtos) {
      final data = dto.toJson();
      data['sync_status'] = SyncStatus.synced.name;
      data['last_synced_at'] = (dto.updatedAt ?? DateTime.now()).toUtc().toIso8601String();
      data['modified_locally_at'] = null;
      batch.insert(table, _convertMapsToString(data), conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
    _log("saveAllNotSynced success", darkColor: true);
  }

  Future<void> saveNotSynced(Dto dto) async {
    _log("saveNotSynced for id '${dto.id.value}'");
    final data = dto.toJson();
    data['sync_status'] = SyncStatus.synced.name;
    data['last_synced_at'] = (dto.updatedAt ?? DateTime.now()).toUtc().toIso8601String();
    data['modified_locally_at'] = null;
    await db.insert(table, _convertMapsToString(data), conflictAlgorithm: ConflictAlgorithm.replace);
    _log("saveNotSynced success for id '${dto.id.value}'", darkColor: true);
  }

  Future<void> markAsSynced(String id, DateTime updated) async {
    _log("markAsSynced for id '$id' with updatedAt: $updated");
    final data = {'sync_status': SyncStatus.synced.name, 'last_synced_at': updated.toUtc().toIso8601String(), 'updated_at': updated.toUtc().toIso8601String()};
    await db.update(table, data, where: 'id = ?', whereArgs: [id]);
    _log("markAsSynced success for id '$id'", darkColor: true);
  }

  Future<void> updateSyncStatus(String id, SyncStatus status) async {
    _log("updateSyncStatus for id '$id' with SyncStatus: $status");
    await db.update(table, {'sync_status': status.name}, where: 'id = ?', whereArgs: [id]);
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
    EntityLogger.instance.d("LocalDataSource", table, msg, darkColor: darkColor);
  }

  Map<String, dynamic> _convertMapsToString(Map<String, dynamic> input) {
    final output = <String, dynamic>{};

    input.forEach((key, value) {
      if (value is Map) {
        output[key] = jsonEncode(value);
      } else if (value is List) {
        output[key] =
            value.map((element) {
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
