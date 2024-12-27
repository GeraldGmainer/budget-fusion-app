import 'package:injectable/injectable.dart';

import '../domain.dart';

@lazySingleton
class FilterBookingsUseCase {
  final BookingFilterService _bookingFilterService;

  FilterBookingsUseCase(this._bookingFilterService);

  List<BookingPageData> execute(List<BookingPageData> bookings, BudgetBookFilter filter) {
    return _bookingFilterService.filterBookings(bookings, filter);
  }
}
