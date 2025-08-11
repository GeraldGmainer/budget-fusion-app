import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core.dart';
import '../../currency/currency.dart';
import '../dtos/profile_dto.dart';
import 'profile_setting.dart';

part 'profile.freezed.dart';

@freezed
class Profile with _$Profile implements Entity {
  const Profile._();

  const factory Profile({
    required Uuid id,
    required String email,
    String? firstName,
    String? lastName,
    String? avatarUrl,
    required ProfileSetting setting,
    required bool isSynced,
    required DateTime? createdAt,
    required DateTime? updatedAt,
    required DateTime? deletedAt,
  }) = _Profile;

  factory Profile.fromDto(ProfileDto dto, {required String email, required Currency currency, required bool isSynced}) {
    return Profile(
      id: dto.id,
      email: email,
      firstName: dto.firstName,
      lastName: dto.lastName,
      avatarUrl: dto.avatarUrl,
      setting: ProfileSetting(currency: currency),
      isSynced: isSynced,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      deletedAt: dto.deletedAt,
    );
  }

  ProfileDto toDto() {
    return ProfileDto(
      id: id,
      firstName: firstName,
      lastName: lastName,
      avatarUrl: avatarUrl,
      settingDto: setting.toDto(),
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }
}
