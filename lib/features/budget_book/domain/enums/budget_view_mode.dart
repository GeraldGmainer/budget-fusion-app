enum BudgetViewMode { summary, transaction, calendar }

extension BudgetViewModeX on BudgetViewMode {
  String get label {
    switch (this) {
      case BudgetViewMode.summary:
        return "budgetBook.enums.budgetViewMode.summary";
      case BudgetViewMode.transaction:
        return "budgetBook.enums.budgetViewMode.transaction";
      case BudgetViewMode.calendar:
        return "budgetBook.enums.budgetViewMode.calendar";
    }
  }
}
