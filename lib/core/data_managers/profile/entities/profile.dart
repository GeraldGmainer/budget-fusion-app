import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core.dart';
import '../dtos/profile_dto.dart';

part 'profile.freezed.dart';

@freezed
class Profile with _$Profile implements Entity {
  const Profile._();

  const factory Profile({required Uuid id, required String email, String? firstName, String? lastName, String? avatarUrl, required bool isSynced}) = _Profile;

  factory Profile.fromDto(ProfileDto dto, {required String email, required bool isSynced}) {
    return Profile(id: dto.id, email: email, firstName: dto.firstName, lastName: dto.lastName, avatarUrl: dto.avatarUrl, isSynced: isSynced);
  }

  ProfileDto toDto() {
    return ProfileDto(id: id, firstName: firstName, lastName: lastName, avatarUrl: avatarUrl, updatedAt: DateTime.now());
  }
}
