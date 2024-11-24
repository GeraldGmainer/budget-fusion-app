import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities.dart';

part 'chart_view_data.freezed.dart';

@freezed
class ChartViewData with _$ChartViewData {
  const ChartViewData._();

  const factory ChartViewData({
    required Currency currency,
    required BookingPeriod period,
    required List<PieData> pieData,
    required List<CategorySummary> categorySummaries,
  }) = _ChartViewData;
}
