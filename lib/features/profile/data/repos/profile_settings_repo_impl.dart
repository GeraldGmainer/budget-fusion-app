import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../data_sources/profile_settings_remote_source.dart';

@LazySingleton(as: ProfileSettingsRepo)
class ProfileSettingsRepoImpl implements ProfileSettingsRepo {
  final ProfileSettingsRemoteSource _profileSettingsRemoteSource;

  ProfileSettings? _profileSettings;

  ProfileSettingsRepoImpl(this._profileSettingsRemoteSource);

  @override
  Future<ProfileSettings> getProfileSettings(String profileId) async {
    final profileSettingsDto = await _profileSettingsRemoteSource.fetchProfileSettings(profileId);
    final profileSettings = profileSettingsDto.toDomain();
    _profileSettings = profileSettings;
    return profileSettings;
  }

  @override
  Future<Currency> getCurrency() async {
    return _profileSettings!.currency;
  }
}
