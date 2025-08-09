import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../repos/booking/booking.dart';

part 'transaction_group.freezed.dart';

@freezed
class TransactionGroup with _$TransactionGroup {
  const TransactionGroup._();

  const factory TransactionGroup({required DateTime date, required List<Booking> bookings}) = _TransactionGroup;
}
