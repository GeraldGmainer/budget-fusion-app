import 'dart:async';

import 'package:budget_fusion_app/features/profile/data/adapters/profile_adapter.dart';
import 'package:budget_fusion_app/utils/singletons/budget_logger.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../data_sources/profile_local_source.dart';
import '../data_sources/profile_remote_source.dart';
import '../dtos/profile_remote_dto.dart';

@LazySingleton(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  static const String _cacheKey = "myProfileKey";

  final ProfileLocalSource _localSource;
  final ProfileRemoteSource _remoteSource;
  final CacheManager _cacheManager;
  final QueueManager _queueManager;
  final SyncManager _syncManager;
  final ProfileAdapter _adapter;
  final StreamController<Profile> _profileController = StreamController.broadcast();
  StreamSubscription<ProfileRemoteDto>? _realtimeSub;

  ProfileRepoImpl(this._localSource, this._remoteSource, this._cacheManager, this._queueManager, this._syncManager, this._adapter);

  @override
  Stream<Profile> watchProfile() => _profileController.stream;

  @override
  Future<void> loadProfileById(String profileId) async {
    _subscribeToRealtime(profileId);
    final cached = _cacheManager.get<Profile>(_cacheKey);
    if (cached != null) {
      BudgetLogger.instance.d("use cached profile $cached");
      _profileController.add(cached);
      unawaited(_syncIfNewerExists(profileId, cached));
      return;
    }

    final local = await _localSource.fetchProfileById(profileId);
    if (local != null) {
      final domain = _adapter.fromLocalDto(local);
      _cacheManager.set(_cacheKey, domain);
      BudgetLogger.instance.d("use local profile $domain");
      _profileController.add(domain);
      unawaited(_syncIfNewerExists(profileId, domain));
      return;
    }

    final remote = await _remoteSource.fetchProfileById(profileId);
    final domain = _adapter.fromRemoteDto(remote);
    await _localSource.saveProfile(_adapter.toLocalDto(domain));
    _cacheManager.set(_cacheKey, domain);
    _profileController.add(domain);
  }

  void _subscribeToRealtime(String profileId) {
    _realtimeSub ??
        _remoteSource.watchProfileUpdates(profileId).listen(
          (remoteDto) async {
            BudgetLogger.instance.i("received profile realtime update $remoteDto");
            final domain = _adapter.fromRemoteDto(remoteDto);
            await _localSource.saveProfile(_adapter.toLocalDto(domain));
            _cacheManager.set(_cacheKey, domain);
            _profileController.add(domain);
          },
          onError: (e) => BudgetLogger.instance.e("Realtime error", e),
        );
  }

  Future<void> _syncIfNewerExists(String profileId, Profile current) async {
    try {
      final remote = await _remoteSource.fetchProfileIfNewer(profileId, current.updatedAt);

      if (remote != null) {
        final remoteDomain = _adapter.fromRemoteDto(remote);
        await _localSource.saveProfile(_adapter.toLocalDto(remoteDomain));
        _cacheManager.set(_cacheKey, remoteDomain);
        _profileController.add(remoteDomain);
        BudgetLogger.instance.d("Synced newer profile version");
      }
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("Profile sync failed", e, stackTrace);
    }
  }

  @override
  Future<void> save(Profile profile) async {
    final newProfile = profile.copyWith(updatedAt: DateTime.now());

    await _localSource.saveProfile(_adapter.toLocalDto(newProfile));
    _cacheManager.set(_cacheKey, newProfile);
    _profileController.add(newProfile);

    _queueManager.add(() async {
      try {
        await _remoteSource.saveProfile(_adapter.toRemoteDto(newProfile));
      } catch (e, stackTrace) {
        BudgetLogger.instance.e("Profile Remote save failed", e, stackTrace);
      }
    });
  }
}
