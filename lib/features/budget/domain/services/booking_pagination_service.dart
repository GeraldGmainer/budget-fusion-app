import 'package:budget_fusion_app/core/extensions/extensions.dart';
import 'package:injectable/injectable.dart';

import '../domain.dart';

@lazySingleton
class BookingPaginationService {
  DateTime? calculateFromDate(PeriodMode period, int currentPage, int pageCount) {
    final now = DateTime.now();
    switch (period) {
      case PeriodMode.day:
        return now.startOfDay;
      case PeriodMode.month:
        return DateTime(now.year, now.month - currentPage - (pageCount - 1)).startOfMonth;
      case PeriodMode.year:
        return now.startOfYear;
      default:
        return null;
    }
  }

  DateTime? calculateToDate(PeriodMode period, DateTime? fromDate, int pageCount) {
    if (fromDate == null) return null;

    switch (period) {
      case PeriodMode.day:
        return fromDate.endOfDay;
      case PeriodMode.month:
        return DateTime(fromDate.year, fromDate.month + pageCount - 1).endOfMonth;
      case PeriodMode.year:
        return fromDate.endOfYear;
      default:
        return null;
    }
  }
}
