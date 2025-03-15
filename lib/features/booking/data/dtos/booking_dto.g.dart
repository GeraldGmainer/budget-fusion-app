// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingDtoImpl _$$BookingDtoImplFromJson(Map<String, dynamic> json) =>
    _$BookingDtoImpl(
      id: (json['id'] as num).toInt(),
      bookingDate: DateTime.parse(json['booking_date'] as String),
      description: json['description'] as String?,
      amount: const DecimalConverter().fromJson(json['amount']),
      categoryId: (json['category_id'] as num).toInt(),
      accountId: (json['account_id'] as num).toInt(),
      isDeleted: json['is_deleted'] as bool,
    );

Map<String, dynamic> _$$BookingDtoImplToJson(_$BookingDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'booking_date': instance.bookingDate.toIso8601String(),
      'description': instance.description,
      'amount': const DecimalConverter().toJson(instance.amount),
      'category_id': instance.categoryId,
      'account_id': instance.accountId,
      'is_deleted': instance.isDeleted,
    };
