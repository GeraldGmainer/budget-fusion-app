import 'package:budget_fusion_app/features/profile/data/adapters/profile_adapter.dart';
import 'package:budget_fusion_app/utils/singletons/budget_logger.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../data_sources/profile_local_source.dart';
import '../data_sources/profile_remote_source.dart';

@LazySingleton(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  static const String myProfileKey = "myProfileKey";

  final ProfileLocalSource _localSource;
  final ProfileRemoteSource _remoteSource;
  final CacheManager _cacheManager;
  final QueueManager _queueManager;
  final SyncManager _syncManager;
  final ProfileAdapter _adapter;

  ProfileRepoImpl(this._localSource, this._remoteSource, this._cacheManager, this._queueManager, this._syncManager, this._adapter);

  @override
  Future<Profile> getProfileById(String profileId) async {
    BudgetLogger.instance.d("getProfileById $profileId");
    final cachedProfile = _cacheManager.get<Profile>(myProfileKey);
    if (cachedProfile != null) {
      BudgetLogger.instance.d("use cache profile $cachedProfile", short: true);
      return cachedProfile;
    }

    final localProfile = await _localSource.fetchProfileById(profileId);
    if (localProfile != null) {
      final profile = _adapter.fromLocalDto(localProfile);
      _cacheManager.set(myProfileKey, profile);
      BudgetLogger.instance.d("use local profile $localProfile", short: true);
      return profile;
    }

    final remoteProfile = await _remoteSource.fetchProfileById(profileId);
    final domainProfile = _adapter.fromRemoteDto(remoteProfile);
    BudgetLogger.instance.d("use remote profile $remoteProfile", short: true);

    await _localSource.saveProfile(_adapter.toLocalDto(domainProfile));
    _cacheManager.set(myProfileKey, domainProfile);
    return domainProfile;
  }

  @override
  Future<void> save(Profile profile) async {
    final localDto = _adapter.toLocalDto(profile);
    await _localSource.saveProfile(localDto);

    final remoteDto = _adapter.toRemoteDto(profile);
    await _remoteSource.saveProfile(remoteDto);

    _cacheManager.set(myProfileKey, profile);
  }
}
