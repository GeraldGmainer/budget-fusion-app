enum PeriodMode {
  day,
  month,
  year,
  all,
}

extension PeriodModeExtension on PeriodMode {
  String get label {
    switch (this) {
      case PeriodMode.day:
        return "period.day";
      case PeriodMode.month:
        return "period.month";
      case PeriodMode.year:
        return "period.year";
      case PeriodMode.all:
        return "period.all";
    }
  }
}
