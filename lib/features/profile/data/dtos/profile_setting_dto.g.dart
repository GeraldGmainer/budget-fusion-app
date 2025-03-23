// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_setting_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileSettingDtoImpl _$$ProfileSettingDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileSettingDtoImpl(
      id: const UuidSerializer().fromJson(json['id'] as String),
      profileId: const UuidSerializer().fromJson(json['profile_id'] as String),
      currencyId:
          const UuidSerializer().fromJson(json['currency_id'] as String),
      currency: const CurrencyDtoSerializer()
          .fromJson(json['currencies'] as Map<String, dynamic>),
      updatedAt:
          const DateTimeSerializer().fromJson(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ProfileSettingDtoImplToJson(
        _$ProfileSettingDtoImpl instance) =>
    <String, dynamic>{
      'id': const UuidSerializer().toJson(instance.id),
      'profile_id': const UuidSerializer().toJson(instance.profileId),
      'currency_id': const UuidSerializer().toJson(instance.currencyId),
      'currencies': const CurrencyDtoSerializer().toJson(instance.currency),
      'updated_at': const DateTimeSerializer().toJson(instance.updatedAt),
    };
