import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'booking_period.freezed.dart';

@freezed
class BookingPeriod with _$BookingPeriod {
  const BookingPeriod._();

  const factory BookingPeriod({
    required BookingDateRange dateRange,
    required Decimal income,
    required Decimal outcome,
    required List<CategoryGroup> categoryGroups,
  }) = _BookingPeriod;

  Decimal get balance {
    return income - outcome;
  }
}
