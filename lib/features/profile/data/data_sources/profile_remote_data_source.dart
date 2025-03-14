import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../dtos/profile_remote_dto.dart';

// TODO use SupabaseClient.execute?

@lazySingleton
class ProfileRemoteDataSource implements OfflineFirstRemoteDataSource<Profile, ProfileRemoteDto> {
  @override
  String get table => 'profiles';

  @override
  String get columns => 'id, user_id, name, email, avatar_url, updated_at';

  @override
  Future<List<ProfileRemoteDto>> fetchAll() async {
    final response = await supabase.from(table).select(columns);
    return (response as List).map((data) => ProfileRemoteDto.fromJson(data)).toList();
  }

  @override
  Future<List<ProfileRemoteDto>> fetchAllNewer(DateTime? updatedAt) async {
    var query = supabase.from(table).select(columns);
    if (updatedAt != null) {
      query = query.gt('updated_at', updatedAt.toIso8601String());
    }
    final response = await query;
    return (response as List).map((data) => ProfileRemoteDto.fromJson(data)).toList();
  }

  @override
  Future<ProfileRemoteDto> fetchById(String id) async {
    final response = await supabase.from(table).select(columns).eq('id', id).single();
    return ProfileRemoteDto.fromJson(response);
  }

  @override
  Future<ProfileRemoteDto> upsert(ProfileRemoteDto dto) async {
    final response = await supabase.from(table).upsert(dto.toJson()).eq('id', dto.id);
    return ProfileRemoteDto.fromJson(response);
  }

  @override
  Future<void> upsertAll(List<ProfileRemoteDto> dtos) async {
    final data = dtos.map((dto) => dto.toJson()).toList();
    await supabase.from(table).upsert(data);
  }

  @override
  Future<void> delete(String id) async {
    await supabase.from(table).delete().eq('id', id);
  }
}
