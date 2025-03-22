import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_dto.freezed.dart';
part 'profile_dto.g.dart';

@freezed
class ProfileDto with _$ProfileDto implements OfflineFirstDto {
  const ProfileDto._();

  const factory ProfileDto({
    required Uuid id,
    @JsonKey(name: 'user_id') required String userId,
    String? name,
    required String email,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _ProfileDto;

  factory ProfileDto.fromLocal(Map<String, Object?> row) {
    return ProfileDto(
      id: Uuid(row['id'] as String),
      userId: row['user_id'] as String,
      name: row['name'] as String?,
      email: row['email'] as String,
      avatarUrl: row['avatar_url'] as String?,
      updatedAt: DateTime.parse(row['updated_at'] as String),
    );
  }

  Map<String, Object?> toLocal() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
      'email': email,
      'avatar_url': avatarUrl,
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory ProfileDto.fromJson(Map<String, dynamic> json) => _$ProfileDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$$ProfileDtoImplToJson(this as _$ProfileDtoImpl);
}
