import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/core/extensions/extensions.dart';
import 'package:budget_fusion_app/utils/logging/logger.dart';
import 'package:injectable/injectable.dart';

import '../domain.dart';

@lazySingleton
class BookingPaginationService {
  final BookingRepo _bookingRepo;

  BookingPaginationService(this._bookingRepo);

  Future<List<Booking>> getBookings(PeriodMode period, int currentPage, int pageCount) async {
    final fromDate = calculateFromDate(period, currentPage, pageCount);
    final toDate = calculateToDate(period, fromDate, pageCount);
    return await _bookingRepo.getBookings(from: fromDate, to: toDate);
  }

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
