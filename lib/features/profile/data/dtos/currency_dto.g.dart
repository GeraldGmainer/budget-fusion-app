// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyDtoImpl _$$CurrencyDtoImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyDtoImpl(
      id: const UuidSerializer().fromJson(json['id'] as String),
      name: json['name'] as String,
      decimalPrecision: (json['decimal_precision'] as num).toInt(),
      unitPositionFront: json['unit_position_front'] as bool? ?? true,
      symbol: json['symbol'] as String,
      uiOrder: (json['uiOrder'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CurrencyDtoImplToJson(_$CurrencyDtoImpl instance) =>
    <String, dynamic>{
      'id': const UuidSerializer().toJson(instance.id),
      'name': instance.name,
      'decimal_precision': instance.decimalPrecision,
      'unit_position_front': instance.unitPositionFront,
      'symbol': instance.symbol,
      'uiOrder': instance.uiOrder,
    };
