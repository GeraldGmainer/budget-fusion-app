import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/profile_remote_dto.dart';

// TODO rename it to my profile repo or active profile repo? because later, need to load multiple profiles
@LazySingleton(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final OfflineFirstDataManager<ProfileLocalDto, ProfileRemoteDto> _manager;

  String? _currentProfileId;

  ProfileRepoImpl(DataManagerFactory dataManagerFactory)
      : _manager = dataManagerFactory.createManager<ProfileLocalDto, ProfileRemoteDto>(
          domainType: DomainType.profile,
        );

  @override
  Stream<ProfileLocalDto> watch() => _manager.stream.map((profiles) => profiles.firstWhere((p) => p.id == _currentProfileId));

  @override
  Future<void> loadById(String profileId) async {
    _currentProfileId = profileId;
    await _manager.loadAll();
  }

  @override
  Future<void> save(ProfileLocalDto profile) async {
    await _manager.save(profile);
  }

  @override
  void dispose() {
    _manager.dispose();
  }
}
