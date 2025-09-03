// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountDto _$AccountDtoFromJson(Map<String, dynamic> json) => _AccountDto(
  id: const UuidSerializer().fromJson(json['id'] as String),
  name: json['name'] as String,
  iconName: json['icon_name'] as String,
  iconColor: json['icon_color'] as String,
  syncStatus: _$JsonConverterFromJson<String, SyncStatus>(
    json['sync_status'],
    const SyncStatusSerializer().fromJson,
  ),
  createdAt: const DateTimeSerializer().fromJson(json['created_at']),
  updatedAt: const DateTimeSerializer().fromJson(json['updated_at']),
  deletedAt: const DateTimeSerializer().fromJson(json['deleted_at']),
);

Map<String, dynamic> _$AccountDtoToJson(_AccountDto instance) =>
    <String, dynamic>{
      'id': const UuidSerializer().toJson(instance.id),
      'name': instance.name,
      'icon_name': instance.iconName,
      'icon_color': instance.iconColor,
      'sync_status': _$JsonConverterToJson<String, SyncStatus>(
        instance.syncStatus,
        const SyncStatusSerializer().toJson,
      ),
      'created_at': const DateTimeSerializer().toJson(instance.createdAt),
      'updated_at': const DateTimeSerializer().toJson(instance.updatedAt),
      'deleted_at': const DateTimeSerializer().toJson(instance.deletedAt),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
