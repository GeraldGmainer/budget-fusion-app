import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../domain.dart';

@lazySingleton
class BookingPageDataLoader {
  final BookingPageConverter _bookingPageConverter;
  final BookingPaginationService _bookingPaginationService;
  final BookingRepo _bookingRepo;

  BookingPageDataLoader(this._bookingPageConverter, this._bookingPaginationService, this._bookingRepo);

  Future<LoadResult> load(PeriodMode period, int currentPage, int pageCount) async {
    final fromDate = _bookingPaginationService.calculateFromDate(period, currentPage, pageCount);
    final toDate = _bookingPaginationService.calculateToDate(period, fromDate, pageCount);
    if (period == PeriodMode.all) {
      final bookings = await _bookingRepo.getBookings(from: fromDate, to: toDate);
      final items = _bookingPageConverter.mapBookings(period, bookings, fromDate, toDate);
      return LoadResult(items, false);
    } else {
      final results = await Future.wait([_bookingRepo.getBookings(from: fromDate, to: toDate), _bookingRepo.hasBookingsBefore(fromDate)]);
      final items = _bookingPageConverter.mapBookings(period, results[0] as List<Booking>, fromDate, toDate);
      return LoadResult(items, results[1] as bool);
    }
  }
}

class LoadResult {
  final List<BookingPageData> items;
  final bool hasMore;

  LoadResult(this.items, this.hasMore);
}
