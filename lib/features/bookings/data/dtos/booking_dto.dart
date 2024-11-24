import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_dto.freezed.dart';
part 'booking_dto.g.dart';

@freezed
class BookingDto with _$BookingDto {
  const BookingDto._();

  const factory BookingDto({
    required int id,
    @JsonKey(name: 'booking_date') required DateTime bookingDate,
    String? description,
    @DecimalConverter() required Decimal amount,
    @JsonKey(name: 'category_id') required int categoryId,
    @JsonKey(name: 'account_id') required int accountId,
    @JsonKey(name: 'is_deleted') required bool isDeleted,
  }) = _BookingDto;

  factory BookingDto.fromJson(Map<String, dynamic> json) => _$BookingDtoFromJson(json);

  Booking toDomain(Category category, Account account) {
    return Booking(
      id: id,
      bookingDate: bookingDate,
      description: description,
      amount: amount,
      category: category,
      account: account,
      isDeleted: isDeleted,
    );
  }
}
