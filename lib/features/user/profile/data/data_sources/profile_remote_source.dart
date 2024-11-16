import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/profile_dto.dart';
import '../dtos/profile_settings_dto.dart';

@lazySingleton
class ProfileRemoteSource extends SupabaseClient {
  Future<ProfileDto> fetchProfile(int profileId) async {
    return execute("fetchProfile", () async {
      final response = await supabase.from('profiles').select('id, user_id, name, avatar_url').eq('id', profileId).single();
      return ProfileDto.fromJson(response);
    });
  }

  Future<ProfileSettingsDto> fetchProfileSettings(int profileId) async {
    return execute("fetchProfileSettings", () async {
      final response = await supabase
          .from('profile_settings')
          .select('id, profile_id, currency_id, currencies (id, name, decimal_precision, symbol, unit_position_front)')
          .eq('profile_id', profileId)
          .single();
      return ProfileSettingsDto.fromJson(response);
    });
  }
}
