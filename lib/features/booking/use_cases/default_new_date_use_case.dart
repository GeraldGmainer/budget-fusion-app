import 'package:budget_fusion_app/utils/utils.dart';
import 'package:injectable/injectable.dart';

import '../../budget_book/enums/period_mode.dart';
import '../../budget_book/view_models/budget_date_range.dart';

@lazySingleton
class DefaultNewDateUseCase {
  DateTime get(BudgetDateRange dateRange, PeriodMode period) {
    // TODO use period mode
    final now = DateTime.now();
    if (dateRange.contains(now)) {
      return now.startOfDay;
    }
    if (dateRange.to.isAfter(now)) {
      return dateRange.to.startOfMonth;
    }
    return dateRange.from.endOfMonth.startOfDay;
  }
}
