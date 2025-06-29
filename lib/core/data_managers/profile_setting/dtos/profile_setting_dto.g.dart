// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_setting_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileSettingDtoImpl _$$ProfileSettingDtoImplFromJson(
  Map<String, dynamic> json,
) => _$ProfileSettingDtoImpl(
  id: const UuidSerializer().fromJson(json['id'] as String),
  updatedAt: const DateTimeSerializer().fromJson(json['updated_at']),
  currency: const CurrencyDtoSerializer().fromJson(json['currency']),
);

Map<String, dynamic> _$$ProfileSettingDtoImplToJson(
  _$ProfileSettingDtoImpl instance,
) => <String, dynamic>{
  'id': const UuidSerializer().toJson(instance.id),
  'updated_at': const DateTimeSerializer().toJson(instance.updatedAt),
  'currency': const CurrencyDtoSerializer().toJson(instance.currency),
};
