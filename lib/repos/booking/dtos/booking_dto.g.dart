// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingDtoImpl _$$BookingDtoImplFromJson(Map<String, dynamic> json) =>
    _$BookingDtoImpl(
      id: const UuidSerializer().fromJson(json['id'] as String),
      updatedAt: const DateTimeSerializer().fromJson(json['updated_at']),
      date: const DateSerializer().fromJson(json['date'] as String),
      description: json['description'] as String?,
      amount: const DecimalConverter().fromJson(json['amount']),
      categoryId: const UuidSerializer().fromJson(
        json['category_id'] as String,
      ),
      accountId: const UuidSerializer().fromJson(json['account_id'] as String),
    );

Map<String, dynamic> _$$BookingDtoImplToJson(_$BookingDtoImpl instance) =>
    <String, dynamic>{
      'id': const UuidSerializer().toJson(instance.id),
      'updated_at': const DateTimeSerializer().toJson(instance.updatedAt),
      'date': const DateSerializer().toJson(instance.date),
      'description': instance.description,
      'amount': const DecimalConverter().toJson(instance.amount),
      'category_id': const UuidSerializer().toJson(instance.categoryId),
      'account_id': const UuidSerializer().toJson(instance.accountId),
    };
