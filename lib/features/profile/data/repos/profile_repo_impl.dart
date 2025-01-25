import 'dart:async';

import 'package:budget_fusion_app/features/profile/data/adapters/profile_adapter.dart';
import 'package:budget_fusion_app/utils/singletons/budget_logger.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../data_sources/profile_local_source.dart';
import '../data_sources/profile_remote_source.dart';

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

  ProfileRepoImpl(this._localSource, this._remoteSource, this._cacheManager, this._queueManager, this._syncManager, this._adapter);

  @override
  Stream<Profile> watchProfile() => _profileController.stream;

  @override
  Future<void> loadProfileById(String profileId) async {
    final cached = _cacheManager.get<Profile>(_cacheKey);
    if (cached != null) {
      BudgetLogger.instance.d("use cached profile $cached");
      _profileController.add(cached);
      unawaited(_syncIfNewerExists(cached));
      return;
    }

    final local = await _localSource.fetchProfileById(profileId);
    if (local != null) {
      final domain = _adapter.fromLocalDto(local);
      _cacheManager.set(_cacheKey, domain);
      BudgetLogger.instance.d("use local profile $domain");
      _profileController.add(domain);
      unawaited(_syncIfNewerExists(domain));
      return;
    }

    final remote = await _remoteSource.fetchProfileById(profileId);
    final domain = _adapter.fromRemoteDto(remote);
    await _localSource.saveProfile(_adapter.toLocalDto(domain));
    _cacheManager.set(_cacheKey, domain);
    _profileController.add(domain);
  }

  Future<void> _syncIfNewerExists(Profile current) async {
    try {
      // TODO add current.updatedAt in supabase request request and sync the response
      final remote = await _remoteSource.fetchProfileById(current.id.toJson());
      final remoteDomain = _adapter.fromRemoteDto(remote);
      if (remoteDomain.updatedAt.isAfter(current.updatedAt)) {
        BudgetLogger.instance.d("Remote updatedAt is after local updatedAt -> update Profile //  ${remoteDomain.updatedAt} - ${current.updatedAt}");
        await _localSource.saveProfile(_adapter.toLocalDto(remoteDomain));
        _cacheManager.set(_cacheKey, remoteDomain);
        _profileController.add(remoteDomain);
      }
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("Profile Background sync failed", e, stackTrace);
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
