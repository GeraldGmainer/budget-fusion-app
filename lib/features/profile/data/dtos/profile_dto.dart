import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/core.dart';
import '../../../../utils/utils.dart';

part 'profile_dto.freezed.dart';
part 'profile_dto.g.dart';

@freezed
class ProfileDto with _$ProfileDto {
  const ProfileDto._();

  const factory ProfileDto({
    required Uuid id,
    @JsonKey(name: 'user_id') required String userId,
    String? name,
    required String email,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  }) = _ProfileDto;

  factory ProfileDto.fromJson(Map<String, dynamic> json) => _$ProfileDtoFromJson(json);

  Profile toDomain() {
    return Profile(
      id: id,
      userId: userId,
      name: name,
      email: email,
      avatarUrl: avatarUrl,
    );
  }
}
