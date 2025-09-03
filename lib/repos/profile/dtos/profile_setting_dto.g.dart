// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_setting_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileSettingDto _$ProfileSettingDtoFromJson(Map<String, dynamic> json) =>
    _ProfileSettingDto(
      currencyId: const UuidSerializer().fromJson(
        json['currency_id'] as String,
      ),
    );

Map<String, dynamic> _$ProfileSettingDtoToJson(_ProfileSettingDto instance) =>
    <String, dynamic>{
      'currency_id': const UuidSerializer().toJson(instance.currencyId),
    };
