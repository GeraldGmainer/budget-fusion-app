import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../data_sources/profile_remote_source.dart';

@LazySingleton(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteSource _profileRemoteSource;

  ProfileSettings? _profileSettings;

  ProfileRepoImpl(this._profileRemoteSource);

  @override
  Future<Profile> getProfile(String profileId) async {
    final profileDto = await _profileRemoteSource.fetchProfile(profileId);
    return profileDto.toDomain();
  }

  @override
  Future<ProfileSettings> getProfileSettings(String profileId) async {
    final profileSettingsDto = await _profileRemoteSource.fetchProfileSettings(profileId);
    final profileSettings = profileSettingsDto.toDomain();
    _profileSettings = profileSettings;
    return profileSettings;
  }

  @override
  Future<Currency> getCurrency() async {
    return _profileSettings!.currency;
  }
}
