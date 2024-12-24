import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'booking_date_range.freezed.dart';

@freezed
class BookingDateRange with _$BookingDateRange {
  const BookingDateRange._();

  @Assert('period == PeriodMode.all || (from != null && to != null)')
  const factory BookingDateRange({
    required PeriodMode period,
    required DateTime from,
    required DateTime to,
  }) = _BookingDateRange;

  factory BookingDateRange.all() => BookingDateRange(
        period: PeriodMode.all,
        from: DateTime.fromMillisecondsSinceEpoch(0),
        to: DateTime.fromMillisecondsSinceEpoch(9999999999999),
      );
}
