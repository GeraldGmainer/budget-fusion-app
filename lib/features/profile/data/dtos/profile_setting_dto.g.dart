// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_setting_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileSettingDtoImpl _$$ProfileSettingDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileSettingDtoImpl(
      id: const UuidSerializer().fromJson(json['id'] as String),
      userId: const UuidSerializer().fromJson(json['user_id'] as String),
      currency: const CurrencyDtoSerializer().fromJson(json['currency']),
      updatedAt:
          const DateTimeSerializer().fromJson(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ProfileSettingDtoImplToJson(
        _$ProfileSettingDtoImpl instance) =>
    <String, dynamic>{
      'id': const UuidSerializer().toJson(instance.id),
      'user_id': const UuidSerializer().toJson(instance.userId),
      'currency': const CurrencyDtoSerializer().toJson(instance.currency),
      'updated_at': const DateTimeSerializer().toJson(instance.updatedAt),
    };
