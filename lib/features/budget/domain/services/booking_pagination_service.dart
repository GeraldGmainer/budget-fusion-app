import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/core/extensions/extensions.dart';
import 'package:budget_fusion_app/utils/logging/logger.dart';
import 'package:injectable/injectable.dart';

import '../domain.dart';

@lazySingleton
class BookingPaginationService {
  final BookingRepo _bookingRepo;

  BookingPaginationService(this._bookingRepo);

  Future<List<Booking>> getBookings(PeriodMode period, int fromPage, int toPage) async {
    BudgetLogger.instance.i("from $fromPage / to: $toPage");
    final fromDate = _calculateFromDate(period, fromPage);
    final toDate = _calculateToDate(period, fromDate, toPage);
    return await _bookingRepo.getBookings(from: fromDate, to: toDate);
  }

  DateTime? _calculateFromDate(PeriodMode period, int fromPage) {
    final now = DateTime.now();
    switch (period) {
      case PeriodMode.day:
        return now.subtract(Duration(days: fromPage)).startOfDay;
      case PeriodMode.month:
        return DateTime(now.year, now.month - fromPage).startOfMonth;
      case PeriodMode.year:
        return DateTime(now.year - fromPage, 1, 1).startOfYear;
      default:
        return null;
    }
  }

  DateTime? _calculateToDate(PeriodMode period, DateTime? fromDate, int toPage) {
    if (fromDate == null) return null;

    switch (period) {
      case PeriodMode.day:
        return fromDate.subtract(Duration(days: toPage - 1)).endOfDay;
      case PeriodMode.month:
        return DateTime(fromDate.year, fromDate.month + toPage - 1).endOfMonth;
      case PeriodMode.year:
        return DateTime(fromDate.year - toPage - 1, 1, 1).endOfYear;
      default:
        return null;
    }
  }
}
