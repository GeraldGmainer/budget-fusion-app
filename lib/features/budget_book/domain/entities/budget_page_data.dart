import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'budget_date_range.dart';
import 'category_group.dart';

part 'budget_page_data.freezed.dart';

@freezed
class BudgetPageData with _$BudgetPageData {
  const BudgetPageData._();

  const factory BudgetPageData({
    required BudgetDateRange dateRange,
    required Decimal income,
    required Decimal outcome,
    @Default([]) List<CategoryGroup> categoryGroups,
  }) = _BudgetPageData;

  factory BudgetPageData.empty(BudgetDateRange dateRange) => BudgetPageData(
        dateRange: dateRange,
        income: Decimal.zero,
        outcome: Decimal.zero,
      );

  Decimal get balance {
    return income - outcome;
  }
}
