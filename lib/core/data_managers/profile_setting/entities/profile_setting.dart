import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core.dart';
import '../dtos/profile_setting_dto.dart';

part 'profile_setting.freezed.dart';

@freezed
class ProfileSetting with _$ProfileSetting implements Entity {
  const ProfileSetting._();

  const factory ProfileSetting({required Uuid id, required Currency currency, required bool isSynced}) = _ProfileSetting;

  factory ProfileSetting.fromDto(ProfileSettingDto dto, {required bool isSynced}) {
    return ProfileSetting(id: dto.id, currency: Currency.fromDto(dto.currency), isSynced: isSynced);
  }

  ProfileSettingDto toDto() {
    return ProfileSettingDto(id: id, currency: currency.toDto(), updatedAt: DateTime.now());
  }
}
