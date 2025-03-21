import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProfileSettingsRemoteDataSource extends SupabaseClient {
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
