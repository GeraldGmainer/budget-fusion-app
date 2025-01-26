import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

import '../../../../core/core.dart';
import '../dtos/profile_remote_dto.dart';

@lazySingleton
class ProfileRemoteSource extends SupabaseClient {
  static const columns = 'id, user_id, name, email, avatar_url, updated_at';

  Future<ProfileRemoteDto> fetchProfileById(String profileId) async {
    return execute("fetchProfileById", () async {
      final response = await supabase.from('profiles').select(columns).eq('id', profileId).single();
      return ProfileRemoteDto.fromJson(response);
    });
  }

  Future<void> saveProfile(ProfileRemoteDto profile) async {
    return execute("saveProfile", () async {
      await supabase.from('profiles').update(profile.toJson()).eq('id', profile.id);
    });
  }

  Future<ProfileRemoteDto?> fetchProfileIfNewer(String profileId, DateTime updatedAt) async {
    return execute("fetchProfileIfNewer", () async {
      final response = await supabase.from('profiles').select(columns).eq('id', profileId).gt('updated_at', updatedAt.toIso8601String()).maybeSingle();
      return response == null ? null : ProfileRemoteDto.fromJson(response);
    });
  }

  Stream<ProfileRemoteDto> watchProfileUpdates(String profileId) {
    // watches updates and also receives initial data... maybe also useful to replace fetchProfileById
    // return supabase.from('profiles').stream(primaryKey: ['id']).eq("id", profileId).map((maps) => ProfileRemoteDto.fromJson(maps.first));
    final controller = StreamController<ProfileRemoteDto>();

    supabase
        .channel('public:profiles')
        .onPostgresChanges(
            event: sb.PostgresChangeEvent.all,
            schema: 'public',
            table: 'profiles',
            callback: (payload) {
              final newData = payload.newRecord as Map<String, dynamic>?;
              if (newData != null) {
                final profile = ProfileRemoteDto.fromJson(newData);
                controller.add(profile);
              }
            })
        .subscribe();
    return controller.stream;
  }
}
