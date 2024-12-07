import 'package:injectable/injectable.dart';

import '../domain.dart';

@lazySingleton
class BookingPageDataLoader {
  final BookingPageConverter _bookingPageConverter;
  final BookingPaginationService _bookingPaginationService;

  BookingPageDataLoader(this._bookingPageConverter, this._bookingPaginationService);

  Future<List<BookingPageData>> load(PeriodMode period, int fromPage, int toPage) async {
    final bookings = await _bookingPaginationService.getBookings(period, fromPage, toPage);
    return _bookingPageConverter.mapBookings(period, bookings);
  }
}
