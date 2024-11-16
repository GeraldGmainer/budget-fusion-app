import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'entities.dart';

part 'booking.freezed.dart';

@freezed
class Booking with _$Booking {
  const Booking._();

  const factory Booking({
    required int id,
    required DateTime bookingDate,
    required String? description,
    required Decimal amount,
    required Category category,
    required Account account,
    required bool isDeleted,
  }) = _Booking;
}

extension BookingListExtension on Iterable<Booking> {
  Decimal get totalAmount => fold(Decimal.zero, (sum, booking) => sum + booking.amount);
}
