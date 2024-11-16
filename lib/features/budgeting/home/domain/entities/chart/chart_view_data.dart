import 'package:budget_fusion_app/shared/domain/entities/currency.dart';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'category_summary.dart';
import 'pie_data.dart';

part 'chart_view_data.freezed.dart';

@freezed
class ChartViewData with _$ChartViewData {
  const ChartViewData._();

  const factory ChartViewData({
    required Currency currency,
    required Decimal income,
    required Decimal outcome,
    required List<PieData> pieData,
    required List<CategorySummary> categorySummaries,
  }) = _ChartViewData;
}
