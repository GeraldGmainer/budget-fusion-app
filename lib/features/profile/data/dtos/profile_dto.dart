import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_dto.freezed.dart';

part 'profile_dto.g.dart';

@freezed
class ProfileDto with _$ProfileDto {
  const ProfileDto._();

  const factory ProfileDto({
    required int id,
    @JsonKey(name: 'user_id') required String userId,
    String? name,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  }) = _ProfileDto;

  factory ProfileDto.fromJson(Map<String, dynamic> json) => _$ProfileDtoFromJson(json);

  Profile toDomain(String? email, ProfileSettings settings) {
    return Profile(
      id: id,
      userId: userId,
      name: name,
      email: email,
      avatarUrl: avatarUrl,
      settings: settings,
    );
  }
}
