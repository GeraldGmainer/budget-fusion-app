import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../dtos/profile_settings_dto.dart';

@lazySingleton
class ProfileSettingsRemoteSource extends SupabaseClient {
  Future<ProfileSettingsDto> fetchProfileSettings(String profileId) async {
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
