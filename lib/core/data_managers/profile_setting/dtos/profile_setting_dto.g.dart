// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_setting_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileSettingDtoImpl _$$ProfileSettingDtoImplFromJson(
  Map<String, dynamic> json,
) => _$ProfileSettingDtoImpl(
  id: const UuidSerializer().fromJson(json['id'] as String),
  syncMeta: const SyncMetaSerializer().fromJson(json['syncMeta']),
  currency: const CurrencyDtoSerializer().fromJson(json['currency']),
);

Map<String, dynamic> _$$ProfileSettingDtoImplToJson(
  _$ProfileSettingDtoImpl instance,
) => <String, dynamic>{
  'id': const UuidSerializer().toJson(instance.id),
  'syncMeta': const SyncMetaSerializer().toJson(instance.syncMeta),
  'currency': const CurrencyDtoSerializer().toJson(instance.currency),
};
