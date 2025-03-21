import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_local_dto.freezed.dart';

@freezed
class ProfileLocalDto with _$ProfileLocalDto implements OfflineFirstLocalDto {
  const ProfileLocalDto._();

  const factory ProfileLocalDto({
    required String id,
    required String userId,
    String? name,
    required String email,
    String? avatarUrl,
    required DateTime updatedAt,
  }) = _ProfileLocalDto;

  factory ProfileLocalDto.fromMap(Map<String, Object?> row) {
    return ProfileLocalDto(
      id: row['id'] as String,
      userId: row['user_id'] as String,
      name: row['name'] as String?,
      email: row['email'] as String,
      avatarUrl: row['avatar_url'] as String?,
      updatedAt: DateTime.parse(row['updated_at'] as String),
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
      'email': email,
      'avatar_url': avatarUrl,
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  Profile toDomain() {
    return Profile(
      id: Uuid(id),
      userId: userId,
      name: name,
      email: email,
      avatarUrl: avatarUrl,
      updatedAt: updatedAt,
    );
  }
}
