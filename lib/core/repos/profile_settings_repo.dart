import 'package:budget_fusion_app/core/core.dart';

abstract class ProfileSettingsRepo {
  Future<ProfileSettings> getProfileSettings(String profileId);

  Future<Currency> getCurrency();
}
