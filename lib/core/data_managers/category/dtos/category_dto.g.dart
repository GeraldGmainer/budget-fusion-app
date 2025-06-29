// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryDtoImpl _$$CategoryDtoImplFromJson(Map<String, dynamic> json) =>
    _$CategoryDtoImpl(
      id: const UuidSerializer().fromJson(json['id'] as String),
      syncMeta: const SyncMetaSerializer().fromJson(json['syncMeta']),
      name: json['name'] as String,
      categoryType: const CategoryTypeSerializer().fromJson(
        json['category_type'] as String,
      ),
      iconName: json['icon_name'] as String,
      iconColor: json['icon_color'] as String,
      parentId: _$JsonConverterFromJson<String, Uuid>(
        json['parent_id'],
        const UuidSerializer().fromJson,
      ),
    );

Map<String, dynamic> _$$CategoryDtoImplToJson(
  _$CategoryDtoImpl instance,
) => <String, dynamic>{
  'id': const UuidSerializer().toJson(instance.id),
  'syncMeta': const SyncMetaSerializer().toJson(instance.syncMeta),
  'name': instance.name,
  'category_type': const CategoryTypeSerializer().toJson(instance.categoryType),
  'icon_name': instance.iconName,
  'icon_color': instance.iconColor,
  'parent_id': _$JsonConverterToJson<String, Uuid>(
    instance.parentId,
    const UuidSerializer().toJson,
  ),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
