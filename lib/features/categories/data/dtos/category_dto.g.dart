// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryDtoImpl _$$CategoryDtoImplFromJson(Map<String, dynamic> json) =>
    _$CategoryDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      iconName: json['icon_name'] as String,
      iconColor: json['icon_color'] as String,
      categoryType: json['category_type'] as String,
    );

Map<String, dynamic> _$$CategoryDtoImplToJson(_$CategoryDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon_name': instance.iconName,
      'icon_color': instance.iconColor,
      'category_type': instance.categoryType,
    };
