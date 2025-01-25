import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../../utils/utils.dart';
import '../dtos/profile_local_dto.dart';
import '../dtos/profile_remote_dto.dart';

@injectable
class ProfileAdapter {
  ProfileLocalDto toLocalDto(Profile domain) {
    return ProfileLocalDto(
      id: domain.id.toJson(),
      userId: domain.userId,
      name: domain.name,
      email: domain.email,
      avatarUrl: domain.avatarUrl,
      updatedAt: domain.updatedAt,
    );
  }

  ProfileRemoteDto toRemoteDto(Profile domain) {
    return ProfileRemoteDto(
      id: domain.id,
      userId: domain.userId,
      name: domain.name,
      email: domain.email,
      avatarUrl: domain.avatarUrl,
      updatedAt: domain.updatedAt,
    );
  }

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
