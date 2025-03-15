import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/period_mode.dart';

part 'budget_date_range.freezed.dart';

@freezed
class BudgetDateRange with _$BudgetDateRange {
  const BudgetDateRange._();

  @Assert('period == PeriodMode.all || (from != null && to != null)')
  const factory BudgetDateRange({
    required PeriodMode period,
    required DateTime from,
    required DateTime to,
  }) = _BudgetDateRange;

  factory BudgetDateRange.all() => BudgetDateRange(
        period: PeriodMode.all,
        from: DateTime.fromMillisecondsSinceEpoch(0),
        to: DateTime.fromMillisecondsSinceEpoch(9999999999999),
      );
}
