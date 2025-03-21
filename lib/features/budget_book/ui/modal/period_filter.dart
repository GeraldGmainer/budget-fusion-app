import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/shared.dart';
import '../../domain/entities/budget_book_filter.dart';
import '../../domain/enums/period_mode.dart';

class PeriodFilter extends StatelessWidget {
  final List<PeriodMode> _periods = [PeriodMode.all, PeriodMode.year, PeriodMode.month, PeriodMode.day];
  final BudgetBookFilter filter;

  PeriodFilter({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    return FilterChipGroup(
      title: 'Period',
      items: _periods,
      selectedItem: filter.period,
      onItemSelected: (value) {
        filter.period = value;
      },
      valueToString: (value) => value.label.tr(),
    );
  }
}
