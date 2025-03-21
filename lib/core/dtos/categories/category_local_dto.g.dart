// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_local_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryLocalDtoImpl _$$CategoryLocalDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryLocalDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      categoryType: json['categoryType'] as String,
      iconName: json['iconName'] as String,
      iconColor: json['iconColor'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CategoryLocalDtoImplToJson(
        _$CategoryLocalDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'categoryType': instance.categoryType,
      'iconName': instance.iconName,
      'iconColor': instance.iconColor,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
