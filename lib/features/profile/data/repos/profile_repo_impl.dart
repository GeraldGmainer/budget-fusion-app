import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:injectable/injectable.dart';

import '../dtos/profile_dto.dart';

// TODO rename it to my profile repo or active profile repo? because later, need to load multiple profiles
// TODO or use List<Profile> and MyProfileDomainService stores current profile id
@LazySingleton(as: ProfileRepo)
class ProfileRepoImpl extends OfflineFirstSingleRepoImpl<Profile, ProfileDto> implements ProfileRepo {
  ProfileRepoImpl(DataManagerFactory dataManagerFactory) : super(dataManagerFactory, DomainType.profile);

  @override
  Future<void> loadById(Uuid profileId) async {
    manager.loadAll(filters: {'profile_id': profileId.value});
  }

  @override
  Profile toDomain(ProfileDto dto) {
    return Profile(
      id: dto.id,
      userId: dto.userId,
      name: dto.name,
      email: dto.email,
      avatarUrl: dto.avatarUrl,
      updatedAt: dto.updatedAt,
    );
  }

  @override
  ProfileDto toDto(Profile entity) {
    return ProfileDto(
      id: entity.id,
      userId: entity.userId,
      name: entity.name,
      email: entity.email,
      avatarUrl: entity.avatarUrl,
      updatedAt: entity.updatedAt,
    );
  }
}
