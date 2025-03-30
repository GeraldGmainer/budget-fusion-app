import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/budget_book/domain/entities/pie_data.dart';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'budget_date_range.dart';
import 'category_view_summary.dart';

part 'summary_view_data.freezed.dart';

@freezed
class SummaryViewData with _$SummaryViewData {
  const SummaryViewData._();

  const factory SummaryViewData({
    required Currency currency,
    required CategoryType categoryType,
    required BudgetDateRange dateRange,
    required List<PieData> pieData,
    required List<CategoryViewSummary> summaries,
    required Decimal income,
    required Decimal outcome,
  }) = _SummaryViewData;

  Decimal get balance {
    return income - outcome;
  }
}
