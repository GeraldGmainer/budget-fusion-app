import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_dto.freezed.dart';
part 'profile_dto.g.dart';

@freezed
class ProfileDto with _$ProfileDto implements OfflineFirstDto {
  const ProfileDto._();

  const factory ProfileDto({
    @UuidSerializer() required Uuid id,
    @JsonKey(name: 'user_id') @UuidSerializer() required Uuid userId,
    String? name,
    required String email,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'updated_at') @DateTimeSerializer() required DateTime updatedAt,
  }) = _ProfileDto;

  factory ProfileDto.fromJson(Map<String, dynamic> json) => _$ProfileDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$$ProfileDtoImplToJson(this as _$ProfileDtoImpl);
}
