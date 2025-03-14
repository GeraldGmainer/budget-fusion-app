import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../../utils/utils.dart';
import '../dtos/profile_local_dto.dart';
import '../dtos/profile_remote_dto.dart';

@lazySingleton
class ProfileAdapter extends OfflineFirstAdapter<Profile, ProfileLocalDto, ProfileRemoteDto> {
  @override
  ProfileLocalDto toLocalDto(Profile entity) {
    return ProfileLocalDto(
      id: entity.id.toJson(),
      userId: entity.userId,
      name: entity.name,
      email: entity.email,
      avatarUrl: entity.avatarUrl,
      updatedAt: entity.updatedAt,
    );
  }

  @override
  ProfileRemoteDto toRemoteDto(Profile entity) {
    return ProfileRemoteDto(
      id: entity.id,
      userId: entity.userId,
      name: entity.name,
      email: entity.email,
      avatarUrl: entity.avatarUrl,
      updatedAt: entity.updatedAt,
    );
  }

  @override
  Profile fromLocalDto(ProfileLocalDto dto) {
    return Profile(
      id: Uuid(dto.id),
      userId: dto.userId,
      name: dto.name,
      email: dto.email,
      avatarUrl: dto.avatarUrl,
      updatedAt: dto.updatedAt,
    );
  }

  @override
  Profile fromRemoteDto(ProfileRemoteDto dto) {
    return Profile(
      id: dto.id,
      userId: dto.userId,
      name: dto.name,
      email: dto.email,
      avatarUrl: dto.avatarUrl,
      updatedAt: dto.updatedAt,
    );
  }
}
