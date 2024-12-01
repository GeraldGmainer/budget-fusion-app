import 'package:budget_fusion_app/core/core.dart';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities.dart';

part 'chart_view_data.freezed.dart';

@freezed
class ChartViewData with _$ChartViewData {
  const ChartViewData._();

  const factory ChartViewData({
    required Currency currency,
    required BookingDateRange dateRange,
    required List<PieData> pieData,
    required List<CategorySummary> categorySummaries,
    required Decimal income,
    required Decimal outcome,
  }) = _ChartViewData;

  Decimal get balance {
    return income - outcome;
  }
}
