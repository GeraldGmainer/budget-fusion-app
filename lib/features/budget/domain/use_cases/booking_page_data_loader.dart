import 'package:injectable/injectable.dart';

import '../domain.dart';

@lazySingleton
class BookingPageDataLoader {
  final BookingPageConverter _bookingPageConverter;
  final BookingPaginationService _bookingPaginationService;

  BookingPageDataLoader(this._bookingPageConverter, this._bookingPaginationService);

  Future<List<BookingPageData>> load(PeriodMode period, int currentPage, int pageCount) async {
    final bookings = await _bookingPaginationService.getBookings(period, currentPage, pageCount);
    final fromDate = _bookingPaginationService.calculateFromDate(period, currentPage, pageCount);
    final toDate = _bookingPaginationService.calculateToDate(period, fromDate, pageCount);
    return _bookingPageConverter.mapBookings(period, bookings, toDate!);
  }
}
