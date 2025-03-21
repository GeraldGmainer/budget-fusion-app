import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/core.dart';
import '../../../../../utils/utils.dart';
import 'currency_dto.dart';

part 'profile_settings_dto.freezed.dart';
part 'profile_settings_dto.g.dart';

@freezed
class ProfileSettingsDto with _$ProfileSettingsDto {
  const ProfileSettingsDto._();

  const factory ProfileSettingsDto({
    required Uuid id,
    @JsonKey(name: 'profile_id') required Uuid profileId,
    @JsonKey(name: 'currency_id') required Uuid currencyId,
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
