import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/core.dart';
import '../../../../utils/utils.dart';

part 'profile_remote_dto.freezed.dart';

part 'profile_remote_dto.g.dart';

@freezed
class ProfileRemoteDto with _$ProfileRemoteDto {
  const ProfileRemoteDto._();

  const factory ProfileRemoteDto({
    required Uuid id,
    @JsonKey(name: 'user_id') required String userId,
    String? name,
    required String email,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  }) = _ProfileRemoteDto;

  factory ProfileRemoteDto.fromJson(Map<String, dynamic> json) => _$ProfileRemoteDtoFromJson(json);
}
