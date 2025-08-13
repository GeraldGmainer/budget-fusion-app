import 'dart:async';
import 'dart:math';

import 'package:supabase_flutter/supabase_flutter.dart' show PostgrestFilterBuilder, PostgrestList;

import '../../../../utils/utils.dart';
import '../../core.dart';

abstract class RemoteDataSource<E extends Dto> extends SupabaseClient {
  Future<void> _randomDelay() async {
    Random random = Random();
    int randomNumber = random.nextInt(500) + 1000;
    await Future.delayed(Duration(milliseconds: randomNumber));
  }

  Future<List<E>> fetchAll({List<QueryFilter>? filters}) async {
    final stopwatch = Stopwatch()..start();
    _log("fetchAll ${filters != null ? "with filters: $filters" : ""}");
    return execute(table, () async {
      PostgrestFilterBuilder<PostgrestList> query = supabase.from(table).select(columns);
      query = _applyFilters(query, filters);
      final response = await query.order('updated_at', ascending: false);
      await _randomDelay();
      final result = (response as List).map((data) => toDto(data as Map<String, dynamic>)).toList();
      _log("fetchAll ${result.length} DTOs", stopwatch: stopwatch);
      return result;
    });
  }

  Future<E?> fetchById(String id) async {
    final stopwatch = Stopwatch()..start();
    _log("fetchById '$id'");
    return execute(table, () async {
      final response = await supabase.from(table).select(columns).eq('id', id).isFilter('deleted_at', null).single();
      await _randomDelay();
      _log("fetchById success", stopwatch: stopwatch);
      return toDto(response);
    });
  }

  Future<E> upsert(String id, Map<String, dynamic> json) async {
    final stopwatch = Stopwatch()..start();
    _log("upsert by id '$id'");
    return execute(table, () async {
      final payload =
          Map<String, dynamic>.from(json)
            ..remove('created_at')
            ..remove('updated_at')
            ..remove('createdAt')
            ..remove('updatedAt');
      final response = await supabase.from(table).upsert(payload).eq('id', id).select();
      await _randomDelay();
      _log("upsert success", stopwatch: stopwatch);
      await Future.delayed(Duration(milliseconds: 3500));
      return toDto((response[0]));
    });
  }

  Future<void> deleteById(String id) async {
    final stopwatch = Stopwatch()..start();
    _log("soft delete by id '$id'");
    return execute(table, () async {
      await supabase.rpc(deleteRpcName, params: {'p_id': id});
      await _randomDelay();
      await _randomDelay();
      await _randomDelay();
      _log("soft delete success", stopwatch: stopwatch);
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
    query.isFilter('deleted_at', null);
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

  String get deleteRpcName => "RPC function not implemented";

  E toDto(Map<String, dynamic> json);
}
