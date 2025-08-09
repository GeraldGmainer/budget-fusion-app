import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../serializer/profile_setting_serializer.dart';
import 'profile_setting_dto.dart';

part 'profile_dto.freezed.dart';
part 'profile_dto.g.dart';

@freezed
class ProfileDto with _$ProfileDto implements Dto {
  const ProfileDto._();

  const factory ProfileDto({
    @UuidSerializer() required Uuid id,
    @DateTimeSerializer() @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'settings') @ProfileSettingDtoConverter() required ProfileSettingDto settingDto,
  }) = _ProfileDto;

  factory ProfileDto.fromJson(Map<String, dynamic> json) => _$ProfileDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$$ProfileDtoImplToJson(this as _$ProfileDtoImpl);
}
