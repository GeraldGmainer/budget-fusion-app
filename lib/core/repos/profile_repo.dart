import 'package:budget_fusion_app/core/core.dart';

abstract class ProfileRepo {
  Future<Profile> getProfile(String profileId);

  Future<ProfileSettings> getProfileSettings(String profileId);

  Future<Currency> getCurrency();
}
