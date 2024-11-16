import 'package:budget_fusion_app/shared/shared.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'currency_dto.dart';

part 'profile_settings_dto.freezed.dart';

part 'profile_settings_dto.g.dart';

@freezed
class ProfileSettingsDto with _$ProfileSettingsDto {
  const ProfileSettingsDto._();

  const factory ProfileSettingsDto({
    required int id,
    @JsonKey(name: 'profile_id') required int profileId,
    @JsonKey(name: 'currency_id') required int currencyId,
    @JsonKey(name: 'currencies') required CurrencyDto currency,
  }) = _ProfileSettingsDto;

  factory ProfileSettingsDto.fromJson(Map<String, dynamic> json) => _$ProfileSettingsDtoFromJson(json);

  ProfileSettings toDomain() {
    return ProfileSettings(
      id: id,
      profileId: profileId,
      currency: currency.toDomain(),
    );
  }
}
