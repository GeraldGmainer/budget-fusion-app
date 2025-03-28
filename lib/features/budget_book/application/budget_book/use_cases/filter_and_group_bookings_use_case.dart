import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/budget_book_filter.dart';
import '../../../domain/entities/budget_page_data.dart';
import '../../../domain/service/budget_page_data_service.dart';

@lazySingleton
class FilterAndGroupBookingsUseCase {
  final BudgetPageDataService _budgetPageDataService;

  FilterAndGroupBookingsUseCase(this._budgetPageDataService);

  Future<List<BudgetPageData>> call(List<Booking> bookings, BudgetBookFilter filter) async {
    return await _budgetPageDataService.load(bookings, filter);
  }
}
