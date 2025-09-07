import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../serializer/profile_setting_serializer.dart';
import 'profile_setting_dto.dart';

part 'profile_dto.freezed.dart';
part 'profile_dto.g.dart';

@freezed
abstract class ProfileDto with _$ProfileDto implements Dto {
  const ProfileDto._();

  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ProfileDto({
    @UuidSerializer() required Uuid id,
    String? firstName,
    String? lastName,
    String? avatarUrl,
    @ProfileSettingDtoConverter() required ProfileSettingDto settings,
    @SyncStatusSerializer() required SyncStatus? syncStatus,
    @DateTimeSerializer() DateTime? createdAt,
    @DateTimeSerializer() DateTime? updatedAt,
    @DateTimeSerializer() DateTime? deletedAt,
  }) = _ProfileDto;

  factory ProfileDto.fromJson(Map<String, dynamic> json) => _$ProfileDtoFromJson(json);
}
