// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileSettingsDtoImpl _$$ProfileSettingsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileSettingsDtoImpl(
      id: Uuid.fromJson(json['id'] as String),
      profileId: Uuid.fromJson(json['profile_id'] as String),
      currencyId: Uuid.fromJson(json['currency_id'] as String),
      currency:
          CurrencyDto.fromJson(json['currencies'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfileSettingsDtoImplToJson(
        _$ProfileSettingsDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile_id': instance.profileId,
      'currency_id': instance.currencyId,
      'currencies': instance.currency,
    };
