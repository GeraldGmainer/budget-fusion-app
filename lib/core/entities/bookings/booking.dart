import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking.freezed.dart';

@freezed
class Booking with _$Booking {
  const Booking._();

  const factory Booking({
    required Uuid id,
    required DateTime bookingDate,
    required String? description,
    required Decimal amount,
    required Category category,
    required Account account,
  }) = _Booking;
}

extension BookingListExtension on Iterable<Booking> {
  Decimal get totalAmount => fold(Decimal.zero, (sum, booking) => sum + booking.amount);

  List<Booking> get outcomeBookings => where((booking) => booking.category.categoryType == CategoryType.outcome).toList();

  List<Booking> get incomeBookings => where((booking) => booking.category.categoryType == CategoryType.income).toList();
}
