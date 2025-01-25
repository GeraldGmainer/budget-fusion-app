// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_remote_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileRemoteDtoImpl _$$ProfileRemoteDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileRemoteDtoImpl(
      id: Uuid.fromJson(json['id'] as String),
      userId: json['user_id'] as String,
      name: json['name'] as String?,
      email: json['email'] as String,
      avatarUrl: json['avatar_url'] as String?,
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ProfileRemoteDtoImplToJson(
        _$ProfileRemoteDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'avatar_url': instance.avatarUrl,
      'updated_at': instance.updatedAt.toIso8601String(),
    };
