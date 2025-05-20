enum PeriodMode { day, month, year, all }

extension PeriodModeExtension on PeriodMode {
  String get label {
    switch (this) {
      case PeriodMode.day:
        return "budgetBook.enums.periodMode.day";
      case PeriodMode.month:
        return "budgetBook.enums.periodMode.month";
      case PeriodMode.year:
        return "budgetBook.enums.periodMode.year";
      case PeriodMode.all:
        return "budgetBook.enums.periodMode.all";
    }
  }
}
