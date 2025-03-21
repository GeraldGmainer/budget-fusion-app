import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:injectable/injectable.dart';

import '../dtos/profile_remote_dto.dart';

@lazySingleton
class ProfileAdapter extends OfflineFirstAdapter<ProfileLocalDto, ProfileRemoteDto> {
  @override
  ProfileLocalDto toLocalDto(ProfileRemoteDto remote) {
    return ProfileLocalDto(
      id: remote.id.toJson(),
      userId: remote.userId,
      name: remote.name,
      email: remote.email,
      avatarUrl: remote.avatarUrl,
      updatedAt: remote.updatedAt,
    );
  }

  @override
  ProfileRemoteDto toRemoteDto(ProfileLocalDto local) {
    return ProfileRemoteDto(
      id: Uuid(local.id),
      userId: local.userId,
      name: local.name,
      email: local.email,
      avatarUrl: local.avatarUrl,
      updatedAt: local.updatedAt,
    );
  }
}
