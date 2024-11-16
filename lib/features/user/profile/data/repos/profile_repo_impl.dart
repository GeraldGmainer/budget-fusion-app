import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/data_source.dart';
import '../dtos/dtos.dart';

@LazySingleton(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteSource _profileRemoteSource;

  // TODO better caching
  ProfileSettings? _profileSettings;

  ProfileRepoImpl(this._profileRemoteSource);

  @override
  Future<Profile> getProfile(SupabaseUser user) async {
    final profileId = user.profileId!;
    final responses = await Future.wait([
      _profileRemoteSource.fetchProfile(profileId),
      _profileRemoteSource.fetchProfileSettings(profileId),
    ]);
    final profileDto = responses[0] as ProfileDto;
    final profileSettingsDto = responses[1] as ProfileSettingsDto;

    final profileSettings = profileSettingsDto.toDomain();
    _profileSettings = profileSettings;
    return profileDto.toDomain(user.email, profileSettings);
  }

  @override
  Future<Currency> getCurrency() async {
    return _profileSettings!.currency;
  }
}
