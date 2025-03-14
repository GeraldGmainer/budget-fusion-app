import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../dtos/profile_local_dto.dart';
import '../dtos/profile_remote_dto.dart';

// TODO rename it to my profile repo or active profile repo? because later, need to load multiple profiles
@LazySingleton(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final OfflineFirstDataManager<Profile, ProfileLocalDto, ProfileRemoteDto> _manager;

  String? _currentProfileId;

  ProfileRepoImpl(DataManagerFactory dataManagerFactory)
      : _manager = dataManagerFactory.createManager<Profile, ProfileLocalDto, ProfileRemoteDto>(
          domainType: DomainType.profile,
        );

  @override
  Stream<Profile> watchProfile() => _manager.stream.map((profiles) => profiles.firstWhere((p) => p.id.toJson() == _currentProfileId));

  @override
  Future<void> loadProfileById(String profileId) async {
    _currentProfileId = profileId;
    await _manager.loadAll();
  }

  @override
  Future<void> save(Profile profile) async {
    await _manager.save(profile);
  }

  @override
  void dispose() {
    _manager.dispose();
  }
}
