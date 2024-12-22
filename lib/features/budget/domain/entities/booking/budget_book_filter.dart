import 'package:budget_fusion_app/core/core.dart';

import '../../domain.dart';

class BudgetBookFilter {
  Account? account;
  TransactionType transaction;
  PeriodMode period;
  String? description;

  BudgetBookFilter({
    this.account,
    required this.transaction,
    required this.period,
    this.description,
  });

  factory BudgetBookFilter.initial() {
    return BudgetBookFilter(
      account: null,
      transaction: TransactionType.outcome,
      period: PeriodMode.month,
      description: null,
    );
  }

  @override
  String toString() {
    return 'BudgetBookFilter(account: $account, transaction: $transaction, period: $period, description: $description)';
  }
}
