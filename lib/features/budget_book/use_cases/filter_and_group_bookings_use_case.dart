import 'package:injectable/injectable.dart';

import '../../../repos/booking/booking.dart';
import '../view_models/budget_book_filter.dart';
import '../view_models/budget_page_data.dart';
import 'service/budget_page_data_service.dart';

@lazySingleton
class FilterAndGroupBookingsUseCase {
  final BudgetPageDataService _budgetPageDataService;

  FilterAndGroupBookingsUseCase(this._budgetPageDataService);

  Future<List<BudgetPageData>> load(List<Booking> bookings, BudgetBookFilter filter) async {
    return await _budgetPageDataService.load(bookings, filter);
  }
}
