import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_setting_dto.freezed.dart';
part 'profile_setting_dto.g.dart';

@freezed
class ProfileSettingDto with _$ProfileSettingDto {
  const ProfileSettingDto._();

  const factory ProfileSettingDto({
    @UuidSerializer() @JsonKey(name: 'currency_id') required Uuid currencyId,
  }) = _ProfileSettingDto;

  factory ProfileSettingDto.fromJson(Map<String, dynamic> json) => _$ProfileSettingDtoFromJson(json);
}
