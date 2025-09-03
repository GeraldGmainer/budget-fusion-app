// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileDto _$ProfileDtoFromJson(Map<String, dynamic> json) => _ProfileDto(
  id: const UuidSerializer().fromJson(json['id'] as String),
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  settingDto: const ProfileSettingDtoConverter().fromJson(json['settings']),
  syncStatus: _$JsonConverterFromJson<String, SyncStatus>(
    json['sync_status'],
    const SyncStatusSerializer().fromJson,
  ),
  createdAt: const DateTimeSerializer().fromJson(json['created_at']),
  updatedAt: const DateTimeSerializer().fromJson(json['updated_at']),
  deletedAt: const DateTimeSerializer().fromJson(json['deleted_at']),
);

Map<String, dynamic> _$ProfileDtoToJson(
  _ProfileDto instance,
) => <String, dynamic>{
  'id': const UuidSerializer().toJson(instance.id),
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'avatar_url': instance.avatarUrl,
  'settings': const ProfileSettingDtoConverter().toJson(instance.settingDto),
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
