// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingDtoImpl _$$BookingDtoImplFromJson(Map<String, dynamic> json) =>
    _$BookingDtoImpl(
      id: const UuidSerializer().fromJson(json['id'] as String),
      date: const DateSerializer().fromJson(json['date'] as String),
      description: json['description'] as String?,
      amount: const DecimalConverter().fromJson(json['amount']),
      categoryId: const UuidSerializer().fromJson(
        json['category_id'] as String,
      ),
      accountId: const UuidSerializer().fromJson(json['account_id'] as String),
      syncStatus: _$JsonConverterFromJson<String, SyncStatus>(
        json['sync_status'],
        const SyncStatusSerializer().fromJson,
      ),
      createdAt: const DateTimeSerializer().fromJson(json['created_at']),
      updatedAt: const DateTimeSerializer().fromJson(json['updated_at']),
    );

Map<String, dynamic> _$$BookingDtoImplToJson(_$BookingDtoImpl instance) =>
    <String, dynamic>{
      'id': const UuidSerializer().toJson(instance.id),
      'date': const DateSerializer().toJson(instance.date),
      'description': instance.description,
      'amount': const DecimalConverter().toJson(instance.amount),
      'category_id': const UuidSerializer().toJson(instance.categoryId),
      'account_id': const UuidSerializer().toJson(instance.accountId),
      'sync_status': _$JsonConverterToJson<String, SyncStatus>(
        instance.syncStatus,
        const SyncStatusSerializer().toJson,
      ),
      'created_at': const DateTimeSerializer().toJson(instance.createdAt),
      'updated_at': const DateTimeSerializer().toJson(instance.updatedAt),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
