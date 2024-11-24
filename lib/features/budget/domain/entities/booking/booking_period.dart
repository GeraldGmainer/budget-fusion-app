import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities.dart';

part 'booking_period.freezed.dart';

@freezed
class BookingPeriod with _$BookingPeriod {
  const BookingPeriod._();

  const factory BookingPeriod({
    required BookingViewFilter filter,
    required Decimal income,
    required Decimal outcome,
    required List<CategoryGroup> categoryGroups,
  }) = _BookingPeriod;
}
