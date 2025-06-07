import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/core.dart';
import 'base/budget_view_data.dart';
import 'budget_date_range.dart';
import 'category_view_summary_data.dart';
import 'pie_data.dart';

part 'summary_view_data.freezed.dart';

@freezed
class SummaryViewData with _$SummaryViewData implements BudgetViewData {
  const SummaryViewData._();

  const factory SummaryViewData({
    required Currency currency,
    required BudgetDateRange dateRange,
    required List<PieData> pieData,
    required List<CategoryViewSummaryData> summaries,
    required Decimal income,
    required Decimal outcome,
  }) = _SummaryViewData;

  Decimal get balance {
    return income - outcome;
  }
}
