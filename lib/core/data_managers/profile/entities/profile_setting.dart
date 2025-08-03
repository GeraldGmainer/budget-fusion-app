import 'package:freezed_annotation/freezed_annotation.dart';

import '../../currency/entities/currency.dart';
import '../dtos/profile_setting_dto.dart';

part 'profile_setting.freezed.dart';

@freezed
class ProfileSetting with _$ProfileSetting {
  const ProfileSetting._();

  const factory ProfileSetting({required Currency currency}) = _ProfileSetting;

  ProfileSettingDto toDto() {
    return ProfileSettingDto(currencyId: currency.id);
  }
}
