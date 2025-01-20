// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileDtoImpl _$$ProfileDtoImplFromJson(Map<String, dynamic> json) =>
    _$ProfileDtoImpl(
      id: Uuid.fromJson(json['id'] as String),
      userId: json['user_id'] as String,
      name: json['name'] as String?,
      email: json['email'] as String,
      avatarUrl: json['avatar_url'] as String?,
    );

Map<String, dynamic> _$$ProfileDtoImplToJson(_$ProfileDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'avatar_url': instance.avatarUrl,
    };
