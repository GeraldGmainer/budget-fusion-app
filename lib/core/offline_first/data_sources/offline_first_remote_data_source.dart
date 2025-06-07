import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:postgrest/src/postgrest_builder.dart';
import 'package:postgrest/src/types.dart';

abstract class OfflineFirstRemoteDataSource<Dto extends OfflineFirstDto> extends SupabaseClient {
  Future<List<Dto>> fetchAll({List<QueryFilter>? filters}) async {
    final stopwatch = Stopwatch()..start();
    _log("fetchAll ${filters != null ? "with filters: $filters" : ""}");
    return execute(table, () async {
      PostgrestFilterBuilder<PostgrestList> query = supabase.from(table).select(columns);
      query = _applyFilters(query, filters);
      final response = await query.order('updated_at', ascending: false);
      // Random random = Random();
      // int randomNumber = random.nextInt(2000) + 3000;
      // await Future.delayed(Duration(milliseconds: randomNumber));
      final result = (response as List).map((data) => toDto(data as Map<String, dynamic>)).toList();
      _log("fetchAll ${result.length} Dtos", stopwatch: stopwatch);
      return result;
    });
  }

  Future<List<Dto>> fetchAllNewer(DateTime? updatedAt, {List<QueryFilter>? filters}) async {
    final stopwatch = Stopwatch()..start();
    _log("fetchAllNewer than $updatedAt${filters != null ? "with filters: $filters" : ""}");
    return execute(table, () async {
      var query = supabase.from(table).select(columns);
      if (updatedAt != null) {
        query = query.gt('updated_at', updatedAt.toIso8601String());
      }
      query = _applyFilters(query, filters);
      final response = await query;
      final result = (response as List).map((data) => toDto(data as Map<String, dynamic>)).toList();
      _log("fetchAllNewer ${EntityLogger.bold(result.length)} Dtos", stopwatch: stopwatch);
      return result;
    });
  }

  Future<Dto?> fetchById(String id) async {
    final stopwatch = Stopwatch()..start();
    _log("fetchById '$id'");
    return execute(table, () async {
      final response = await supabase.from(table).select(columns).eq('id', id).single();
      _log("fetchById success", stopwatch: stopwatch);
      return toDto(response);
    });
  }

  Future<Dto> upsert(String id, Map<String, dynamic> json) async {
    final stopwatch = Stopwatch()..start();
    _log("upsert by id '$id'");
    return execute(table, () async {
      final response = await supabase.from(table).upsert(json).eq('id', id).select();
      _log("upsert success", stopwatch: stopwatch);
      return toDto((response[0]));
    });
  }

  Future<void> upsertAll(List<Dto> dtos) async {
    final stopwatch = Stopwatch()..start();
    _log("upsertAll ${dtos.length} DTOs");
    return execute(table, () async {
      final data = dtos.map((dto) => dto.toJson()).toList();
      await supabase.from(table).upsert(data);
      _log("upsertAll success", stopwatch: stopwatch);
    });
  }

  Future<void> deleteById(String id) async {
    final stopwatch = Stopwatch()..start();
    _log("delete by id '$id'");
    return execute(table, () async {
      await supabase.from(table).delete().eq('id', id);
      _log("delete success", stopwatch: stopwatch);
    });
  }

  dynamic _applyFilters(dynamic query, List<QueryFilter>? filters) {
    if (filters != null && filters.isNotEmpty) {
      for (final filter in filters) {
        switch (filter.operator) {
          case QueryOperator.equal:
            query = query.eq(filter.column, filter.value);
            break;
          case QueryOperator.notEqual:
            query = query.neq(filter.column, filter.value);
            break;
          case QueryOperator.greaterThan:
            query = query.gt(filter.column, filter.value);
            break;
          case QueryOperator.lessThan:
            query = query.lt(filter.column, filter.value);
            break;
        }
      }
    }
    return query;
  }

  _log(String msg, {Stopwatch? stopwatch}) {
    if (stopwatch != null) {
      EntityLogger.instance.d("RemoteDataSource", table, "$msg took ${stopwatch.elapsed.inMilliseconds} ms", darkColor: true);
    } else {
      EntityLogger.instance.d("RemoteDataSource", table, msg, darkColor: true);
    }
  }

  String get table;

  String get columns;

  Dto toDto(Map<String, dynamic> json);
}
