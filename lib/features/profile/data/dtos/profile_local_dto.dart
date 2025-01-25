import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../utils/utils.dart';

part 'profile_local_dto.freezed.dart';

@freezed
class ProfileLocalDto with _$ProfileLocalDto {
  const ProfileLocalDto._();

  const factory ProfileLocalDto({
    required String id,
    required String userId,
    String? name,
    required String email,
    String? avatarUrl,
  }) = _ProfileLocalDto;

  factory ProfileLocalDto.fromMap(Map<String, Object?> row) {
    return ProfileLocalDto(
      id: row['id'] as String,
      userId: row['userId'] as String,
      name: row['name'] as String?,
      email: row['email'] as String,
      avatarUrl: row['avatarUrl'] as String?,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'email': email,
      'avatarUrl': avatarUrl,
    };
  }
}
