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
      unitPositionFront: const BoolIntSerializer().fromJson(
        json['unit_position_front'],
      ),
      symbol: json['symbol'] as String,
      uiOrder: (json['ui_order'] as num?)?.toInt(),
      createdAt: const DateTimeSerializer().fromJson(json['created_at']),
      updatedAt: const DateTimeSerializer().fromJson(json['updated_at']),
      deletedAt: const DateTimeSerializer().fromJson(json['deleted_at']),
    );

Map<String, dynamic> _$$CurrencyDtoImplToJson(_$CurrencyDtoImpl instance) =>
    <String, dynamic>{
      'id': const UuidSerializer().toJson(instance.id),
      'name': instance.name,
      'decimal_precision': instance.decimalPrecision,
      'unit_position_front': const BoolIntSerializer().toJson(
        instance.unitPositionFront,
      ),
      'symbol': instance.symbol,
      'ui_order': instance.uiOrder,
      'created_at': const DateTimeSerializer().toJson(instance.createdAt),
      'updated_at': const DateTimeSerializer().toJson(instance.updatedAt),
      'deleted_at': const DateTimeSerializer().toJson(instance.deletedAt),
    };
