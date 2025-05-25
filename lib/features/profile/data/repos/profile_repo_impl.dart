import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/profile_local_data_source.dart';
import '../data_sources/profile_remote_data_source.dart';
import '../dtos/profile_dto.dart';

// TODO rename it to my profile repo or active profile repo? because later, need to load multiple profiles
// TODO or use List<Profile> and MyProfileDomainService stores current profile id
@Singleton(as: ProfileRepo)
class ProfileRepoImpl extends OfflineFirstSingleRepo<Profile, ProfileDto> implements ProfileRepo {
  ProfileRepoImpl(DataManagerFactory dmf, ProfileLocalDataSource lds, ProfileRemoteDataSource rds) : super(DomainType.profile, dmf, lds, rds);

  @override
  Future<void> loadByUserId({Map<String, dynamic>? filters}) async {
    await manager.loadAll(filters: filters);
  }

  @override
  Stream<Profile> watch() {
    return manager.stream.map((dtos) => _toDomain(dtos.single));
  }

  Profile _toDomain(ProfileDto dto) {
    final email = supabase.auth.currentUser?.email ?? "Unknown Email";
    return Profile(id: dto.id, email: email, firstName: dto.firstName, lastName: dto.lastName, avatarUrl: dto.avatarUrl, updatedAt: dto.updatedAt);
  }

  @override
  ProfileDto toDto(Profile entity) {
    return ProfileDto(id: entity.id, firstName: entity.firstName, lastName: entity.lastName, avatarUrl: entity.avatarUrl, updatedAt: entity.updatedAt);
  }
}
