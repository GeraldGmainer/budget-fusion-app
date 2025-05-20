// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountDtoImpl _$$AccountDtoImplFromJson(Map<String, dynamic> json) =>
    _$AccountDtoImpl(
      id: const UuidSerializer().fromJson(json['id'] as String),
      name: json['name'] as String,
      iconName: json['icon_name'] as String,
      iconColor: json['icon_color'] as String,
      updatedAt: const DateTimeSerializer().fromJson(
        json['updated_at'] as String,
      ),
    );

Map<String, dynamic> _$$AccountDtoImplToJson(_$AccountDtoImpl instance) =>
    <String, dynamic>{
      'id': const UuidSerializer().toJson(instance.id),
      'name': instance.name,
      'icon_name': instance.iconName,
      'icon_color': instance.iconColor,
      'updated_at': const DateTimeSerializer().toJson(instance.updatedAt),
    };
