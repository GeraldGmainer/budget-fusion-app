import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_local_dto.freezed.dart';

@freezed
class BookingLocalDto with _$BookingLocalDto {
  const BookingLocalDto._();

  const factory BookingLocalDto({
    required String id,
    @JsonKey(name: 'booking_date') required DateTime bookingDate,
    String? description,
    @DecimalConverter() required Decimal amount,
    @JsonKey(name: 'category_id') required int categoryId,
    @JsonKey(name: 'account_id') required int accountId,
    required DateTime updatedAt,
  }) = _BookingLocalDto;

  Booking toDomain(Category category, Account account) {
    return Booking(
      id: Uuid(id),
      bookingDate: bookingDate,
      description: description,
      amount: amount,
      category: category,
      account: account,
    );
  }
}
