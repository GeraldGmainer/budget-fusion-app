import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/entity.dart';
import '../../../models/uuid.dart';
import '../dtos/profile_dto.dart';

part 'profile.freezed.dart';

@freezed
class Profile with _$Profile implements Entity {
  const Profile._();

  const factory Profile({required Uuid id, required String email, String? firstName, String? lastName, String? avatarUrl, required DateTime updatedAt}) = _Profile;

  factory Profile.fromDto(ProfileDto dto, String email) {
    return Profile(id: dto.id, email: email, firstName: dto.firstName, lastName: dto.lastName, avatarUrl: dto.avatarUrl, updatedAt: dto.updatedAt);
  }

  ProfileDto toDto() {
    return ProfileDto(id: id, firstName: firstName, lastName: lastName, avatarUrl: avatarUrl, updatedAt: updatedAt);
  }
}
