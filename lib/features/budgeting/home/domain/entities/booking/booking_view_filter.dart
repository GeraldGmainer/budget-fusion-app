import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../home.dart';

part 'booking_view_filter.freezed.dart';

@freezed
class BookingViewFilter with _$BookingViewFilter {
  const BookingViewFilter._();

  const factory BookingViewFilter({
    required PeriodMode period,
    DateTime? dateTime,
    DateTime? dateTimeFrom,
    DateTime? dateTimeTo,
  }) = _BookingViewFilter;
}
