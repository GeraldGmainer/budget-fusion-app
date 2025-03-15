import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/period_mode.dart';

part 'budget_book_filter.freezed.dart';

@freezed
class BudgetBookFilter with _$BudgetBookFilter {
  const BudgetBookFilter._();

  const factory BudgetBookFilter({
    required TransactionType transaction,
    required PeriodMode period,
    Account? account,
    String? description,
  }) = _BudgetBookFilter;

  factory BudgetBookFilter.initial() {
    return const BudgetBookFilter(
      transaction: TransactionType.outcome,
      period: PeriodMode.month,
      account: null,
      description: null,
    );
  }
}
