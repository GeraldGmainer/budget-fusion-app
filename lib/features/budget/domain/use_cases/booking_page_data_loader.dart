import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../domain.dart';

@lazySingleton
class BookingPageDataLoader {
  final BookingPageConverter _bookingPageConverter;
  final BookingPaginationService _bookingPaginationService;
  final BookingRepo _bookingRepo;

  BookingPageDataLoader(this._bookingPageConverter, this._bookingPaginationService, this._bookingRepo);

  Future<List<BookingPageData>> load(PeriodMode period, int currentPage, int pageCount) async {
    final fromDate = _bookingPaginationService.calculateFromDate(period, currentPage, pageCount);
    final toDate = _bookingPaginationService.calculateToDate(period, fromDate, pageCount);
    final bookings = await _bookingRepo.getBookings(from: fromDate, to: toDate);
    return _bookingPageConverter.mapBookings(period, bookings, toDate);
  }
}
