import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core.dart';
import '../dtos/profile_setting_dto.dart';

part 'profile_setting.freezed.dart';

@freezed
class ProfileSetting with _$ProfileSetting implements Entity {
  const ProfileSetting._();

  const factory ProfileSetting({required Uuid id, required Currency currency, required DateTime updatedAt}) = _ProfileSetting;

  factory ProfileSetting.fromDto(ProfileSettingDto dto) {
    return ProfileSetting(id: dto.id, currency: Currency.fromDto(dto.currency), updatedAt: dto.updatedAt);
  }

  ProfileSettingDto toDto() {
    return ProfileSettingDto(id: id, currency: currency.toDto(), updatedAt: updatedAt);
  }
}
