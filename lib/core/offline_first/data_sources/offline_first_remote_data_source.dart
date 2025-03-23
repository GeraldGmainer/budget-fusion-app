import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:logger/logger.dart';

abstract class OfflineFirstRemoteDataSource<Dto extends OfflineFirstDto> extends SupabaseClient {
  static final tableColor = AnsiColor.fg(180);

  Future<List<Dto>> fetchAll({List<QueryFilter>? filters}) async {
    return execute("fetchAll from ${tableColor(table)}${filters != null ? "with filters: $filters" : ""}", () async {
      var query = supabase.from(table).select(columns);
      query = _applyFilters(query, filters);
      final response = await query;
      return (response as List).map((data) => toDto(data as Map<String, dynamic>)).toList();
    });
  }

  Future<List<Dto>> fetchAllNewer(DateTime? updatedAt, {List<QueryFilter>? filters}) async {
    return execute("fetchAllNewer from ${tableColor(table)}${filters != null ? "with filters: $filters" : ""}", () async {
      var query = supabase.from(table).select(columns);
      if (updatedAt != null) {
        query = query.gt('updated_at', updatedAt.toIso8601String());
      }
      query = _applyFilters(query, filters);
      final response = await query;
      return (response as List).map((data) => toDto(data as Map<String, dynamic>)).toList();
    });
  }

  Future<Dto> fetchById(String id) async {
    return execute("fetchById from ${tableColor(table)}", () async {
      final response = await supabase.from(table).select(columns).eq('id', id).single();
      return toDto(response);
    });
  }

  Future<Dto> upsert(String id, Map<String, dynamic> json) async {
    final response = await supabase.from(table).upsert(json).eq('id', id);
    return toDto(response as Map<String, dynamic>);
  }

  Future<void> upsertAll(List<Dto> dtos) async {
    return execute("upsertAll from ${tableColor(table)}", () async {
      final data = dtos.map((dto) => dto.toJson()).toList();
      await supabase.from(table).upsert(data);
    });
  }

  Future<void> delete(String id) async {
    return execute("delete from ${tableColor(table)}", () async {
      await supabase.from(table).delete().eq('id', id);
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

  String get table;

  String get columns;

  Dto toDto(Map<String, dynamic> json);
}
