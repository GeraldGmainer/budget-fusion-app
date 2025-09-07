import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_setting_dto.freezed.dart';
part 'profile_setting_dto.g.dart';

@freezed
abstract class ProfileSettingDto with _$ProfileSettingDto {
  const ProfileSettingDto._();

  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ProfileSettingDto({
    @UuidSerializer() required Uuid currencyId,
  }) = _ProfileSettingDto;

  factory ProfileSettingDto.fromJson(Map<String, dynamic> json) => _$ProfileSettingDtoFromJson(json);
}
