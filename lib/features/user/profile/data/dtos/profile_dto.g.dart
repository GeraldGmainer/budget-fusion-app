// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileDtoImpl _$$ProfileDtoImplFromJson(Map<String, dynamic> json) =>
    _$ProfileDtoImpl(
      id: (json['id'] as num).toInt(),
      userId: json['user_id'] as String,
      name: json['name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
    );

Map<String, dynamic> _$$ProfileDtoImplToJson(_$ProfileDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'avatar_url': instance.avatarUrl,
    };
