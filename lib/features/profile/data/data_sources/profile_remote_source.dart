import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../dtos/profile_remote_dto.dart';

@lazySingleton
class ProfileRemoteSource extends SupabaseClient {
  Future<ProfileRemoteDto> fetchProfileById(String profileId) async {
    return execute("fetchProfileById", () async {
      final response = await supabase.from('profiles').select('id, user_id, name, email, avatar_url, updated_at').eq('id', profileId).single();
      return ProfileRemoteDto.fromJson(response);
    });
  }

  Future<void> saveProfile(ProfileRemoteDto profile) async {
    return execute("saveProfile", () async {
      await supabase.from('profiles').update(profile.toJson()).eq('id', profile.id);
    });
  }
}
