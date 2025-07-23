import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../serializer/currency_serializer.dart';
import 'currency_dto.dart';

part 'profile_setting_dto.freezed.dart';
part 'profile_setting_dto.g.dart';

@freezed
class ProfileSettingDto with _$ProfileSettingDto implements OfflineFirstDto {
  const ProfileSettingDto._();

  const factory ProfileSettingDto({
    @UuidSerializer() required Uuid id,
    @DateTimeSerializer() @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'currency') @CurrencyDtoSerializer() required CurrencyDto currency,
  }) = _ProfileSettingDto;

  factory ProfileSettingDto.fromJson(Map<String, dynamic> json) => _$ProfileSettingDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$$ProfileSettingDtoImplToJson(this as _$ProfileSettingDtoImpl);
}
