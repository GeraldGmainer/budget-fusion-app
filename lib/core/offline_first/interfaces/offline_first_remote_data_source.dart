import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';

// TODO use SupabaseClient.execute?
abstract class OfflineFirstRemoteDataSource<Dto extends OfflineFirstDto> {
  String get table;

  String get columns;

  Dto toDto(Map<String, dynamic> json);

  Future<List<Dto>> fetchAll({Map<String, dynamic>? filters}) async {
    var query = supabase.from(table).select(columns);
    if (filters != null) {
      filters.forEach((key, value) {
        query = query.eq(key, value);
      });
    }
    final response = await query;
    return (response as List).map((data) => toDto(data as Map<String, dynamic>)).toList();
  }

  Future<List<Dto>> fetchAllNewer(DateTime? updatedAt, {Map<String, dynamic>? filters}) async {
    var query = supabase.from(table).select(columns);
    if (updatedAt != null) {
      query = query.gt('updated_at', updatedAt.toIso8601String());
    }
    if (filters != null) {
      filters.forEach((key, value) {
        query = query.eq(key, value);
      });
    }
    final response = await query;
    return (response as List).map((data) => toDto(data as Map<String, dynamic>)).toList();
  }

  Future<Dto> fetchById(String id) async {
    final response = await supabase.from(table).select(columns).eq('id', id).single();
    return toDto(response);
  }

  Future<Dto> upsert(String id, Map<String, dynamic> json) async {
    final response = await supabase.from(table).upsert(json).eq('id', id);
    return toDto(response as Map<String, dynamic>);
  }

  Future<void> upsertAll(List<Dto> dtos) async {
    final data = dtos.map((dto) => dto.toJson()).toList();
    await supabase.from(table).upsert(data);
  }

  Future<void> delete(String id) async {
    await supabase.from(table).delete().eq('id', id);
  }
}
