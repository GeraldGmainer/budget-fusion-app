enum PeriodMode {
  day,
  month,
  year,
  all,
}

extension PeriodModeExtension on PeriodMode {
  int get initialDuration {
    switch (this) {
      case PeriodMode.day:
        return 31;
      case PeriodMode.month:
        return 2;
      case PeriodMode.year:
        return 1;
      case PeriodMode.all:
        return 0;
    }
  }

  int get moreDuration {
    switch (this) {
      case PeriodMode.day:
        return 31;
      case PeriodMode.month:
        // return 3;
        return 6;
      case PeriodMode.year:
        return 1;
      case PeriodMode.all:
        return 0;
    }
  }
}
