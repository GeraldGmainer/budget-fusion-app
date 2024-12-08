import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'budget_book_filter.freezed.dart';

@freezed
class BudgetBookFilter with _$BudgetBookFilter {
  const BudgetBookFilter._();

  const factory BudgetBookFilter({
    Account? account,
    required TransactionType transaction,
    required PeriodMode period,
  }) = _BudgetBookFilter;

  factory BudgetBookFilter.initial() => const BudgetBookFilter(
        account: null,
        transaction: TransactionType.outcome,
        period: PeriodMode.month,
      );
}
