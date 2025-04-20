enum BudgetViewMode {
  summary,
  transaction,
  calendar,
}

extension BudgetViewModeX on BudgetViewMode {
  String get label {
    switch (this) {
      case BudgetViewMode.summary:
        return "Summary";
      case BudgetViewMode.transaction:
        return "Transaction";
      case BudgetViewMode.calendar:
        return "Calendar";
    }
  }
}
