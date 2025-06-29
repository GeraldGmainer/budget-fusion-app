import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core.dart';
import '../dtos/profile_dto.dart';

part 'profile.freezed.dart';

@freezed
class Profile with _$Profile implements SyncEntity {
  const Profile._();

  const factory Profile({required Uuid id, required String email, String? firstName, String? lastName, String? avatarUrl, required SyncMeta syncMeta}) = _Profile;

  factory Profile.fromDto(ProfileDto dto, String email) {
    return Profile(id: dto.id, email: email, firstName: dto.firstName, lastName: dto.lastName, avatarUrl: dto.avatarUrl, syncMeta: dto.syncMeta);
  }

  ProfileDto toDto() {
    return ProfileDto(id: id, firstName: firstName, lastName: lastName, avatarUrl: avatarUrl, syncMeta: syncMeta);
  }
}
