import 'package:budget_fusion_app/core/core.dart';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities.dart';

part 'summary_view_data.freezed.dart';

@freezed
class SummaryViewData with _$SummaryViewData implements BookingPageViewData {
  const SummaryViewData._();

  const factory SummaryViewData({
    required Currency currency,
    required BookingDateRange dateRange,
    required List<PieData> pieData,
    required List<CategorySummary> categorySummaries,
    required Decimal income,
    required Decimal outcome,
  }) = _SummaryViewData;

  Decimal get balance {
    return income - outcome;
  }
}
