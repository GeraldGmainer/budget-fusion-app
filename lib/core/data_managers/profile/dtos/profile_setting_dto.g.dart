// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_setting_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileSettingDtoImpl _$$ProfileSettingDtoImplFromJson(
  Map<String, dynamic> json,
) => _$ProfileSettingDtoImpl(
  currencyId: const UuidSerializer().fromJson(json['currency_id'] as String),
);

Map<String, dynamic> _$$ProfileSettingDtoImplToJson(
  _$ProfileSettingDtoImpl instance,
) => <String, dynamic>{
  'currency_id': const UuidSerializer().toJson(instance.currencyId),
};
