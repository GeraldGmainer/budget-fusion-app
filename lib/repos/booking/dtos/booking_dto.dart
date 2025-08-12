import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_dto.freezed.dart';
part 'booking_dto.g.dart';

@freezed
class BookingDto with _$BookingDto implements Dto {
  const BookingDto._();

  const factory BookingDto({
    @UuidSerializer() required Uuid id,
    @JsonKey(name: 'date') @DateSerializer() required DateTime date,
    String? description,
    @DecimalConverter() required Decimal amount,
    @JsonKey(name: 'category_id') @UuidSerializer() required Uuid categoryId,
    @JsonKey(name: 'account_id') @UuidSerializer() required Uuid accountId,
    @DateTimeSerializer() @JsonKey(name: 'created_at') required DateTime? createdAt,
    @DateTimeSerializer() @JsonKey(name: 'updated_at') required DateTime? updatedAt,
    @DateTimeSerializer() @JsonKey(name: 'deleted_at') required DateTime? deletedAt,
  }) = _BookingDto;

  factory BookingDto.fromJson(Map<String, dynamic> json) => _$BookingDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$$BookingDtoImplToJson(this as _$BookingDtoImpl);
}
