import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/period_mode.dart';

part 'budget_book_filter.freezed.dart';

@unfreezed
class BudgetBookFilter with _$BudgetBookFilter {
  const BudgetBookFilter._();

  factory BudgetBookFilter({
    TransactionType? transaction,
    required PeriodMode period,
    Account? account,
    String? description,
  }) = _BudgetBookFilter;

  factory BudgetBookFilter.initial() {
    return BudgetBookFilter(
      transaction: null,
      period: PeriodMode.month,
      account: null,
      description: null,
    );
  }

  @override
  String toString() {
    return "BudgetBookFilter(${_formatTransaction()}, ${_formatPeriod()}, account: ${account?.name}, description: $description)";
  }

  String _formatTransaction() => transaction == TransactionType.income ? "INCOME" : "OUTCOME";

  String _formatPeriod() {
    switch (period) {
      case PeriodMode.month:
        return "MONTH";

      case PeriodMode.year:
        return "YEAR";

      case PeriodMode.all:
        return "ALL";

      case PeriodMode.day:
        return "DAY";
    }
  }
}
