// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileSettingsDtoImpl _$$ProfileSettingsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileSettingsDtoImpl(
      id: (json['id'] as num).toInt(),
      profileId: (json['profile_id'] as num).toInt(),
      currencyId: (json['currency_id'] as num).toInt(),
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
