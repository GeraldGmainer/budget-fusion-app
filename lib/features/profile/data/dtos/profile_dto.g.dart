// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileDtoImpl _$$ProfileDtoImplFromJson(Map<String, dynamic> json) =>
    _$ProfileDtoImpl(
      id: const UuidSerializer().fromJson(json['id'] as String),
      userId: const UuidSerializer().fromJson(json['user_id'] as String),
      name: json['name'] as String?,
      email: json['email'] as String,
      avatarUrl: json['avatar_url'] as String?,
      updatedAt: const DateTimeSerializer().fromJson(
        json['updated_at'] as String,
      ),
    );

Map<String, dynamic> _$$ProfileDtoImplToJson(_$ProfileDtoImpl instance) =>
    <String, dynamic>{
      'id': const UuidSerializer().toJson(instance.id),
      'user_id': const UuidSerializer().toJson(instance.userId),
      'name': instance.name,
      'email': instance.email,
      'avatar_url': instance.avatarUrl,
      'updated_at': const DateTimeSerializer().toJson(instance.updatedAt),
    };
