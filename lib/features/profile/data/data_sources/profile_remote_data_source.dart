import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/profile_dto.dart';

// TODO use SupabaseClient.execute?

@lazySingleton
class ProfileRemoteDataSource implements OfflineFirstRemoteDataSource<ProfileDto> {
  @override
  String get table => 'profiles';

  @override
  String get columns => 'id, user_id, name, email, avatar_url, updated_at';

  @override
  Future<List<ProfileDto>> fetchAll({Map<String, dynamic>? filters}) async {
    final response = await supabase.from(table).select(columns);
    return (response as List).map((data) => ProfileDto.fromJson(data)).toList();
  }

  @override
  Future<List<ProfileDto>> fetchAllNewer(DateTime? updatedAt, {Map<String, dynamic>? filters}) async {
    var query = supabase.from(table).select(columns);
    if (updatedAt != null) {
      query = query.gt('updated_at', updatedAt.toIso8601String());
    }
    final response = await query;
    return (response as List).map((data) => ProfileDto.fromJson(data)).toList();
  }

  @override
  Future<ProfileDto> fetchById(String id) async {
    final response = await supabase.from(table).select(columns).eq('id', id).single();
    return ProfileDto.fromJson(response);
  }

  @override
  Future<ProfileDto> upsert(ProfileDto dto) async {
    final response = await supabase.from(table).upsert(dto.toJson()).eq('id', dto.id);
    return ProfileDto.fromJson(response);
  }

  @override
  Future<void> upsertAll(List<ProfileDto> dtos) async {
    final data = dtos.map((dto) => dto.toJson()).toList();
    await supabase.from(table).upsert(data);
  }

  @override
  Future<void> delete(String id) async {
    await supabase.from(table).delete().eq('id', id);
  }
}
