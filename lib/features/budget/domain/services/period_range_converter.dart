import 'package:budget_fusion_app/core/extensions/date_time_extension.dart';
import 'package:injectable/injectable.dart';

import '../domain.dart';

@lazySingleton
class PeriodRangeConverter {
  BookingDateRange convert(PeriodMode period, DateTime dateTime) {
    switch (period) {
      case PeriodMode.day:
        return BookingDateRange(from: dateTime.startOfDay, to: dateTime.endOfDay, period: period);
      case PeriodMode.month:
        return BookingDateRange(from: dateTime.startOfMonth, to: dateTime.endOfMonth, period: period);
      case PeriodMode.year:
        return BookingDateRange(from: dateTime.startOfYear, to: dateTime.endOfYear, period: period);
      case PeriodMode.all:
        return BookingDateRange.all();
    }
  }
}
