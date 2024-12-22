import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/shared.dart';
import '../../../domain/domain.dart';

class TransactionFilter extends StatelessWidget {
  final List<TransactionType> _transactions = [TransactionType.income, TransactionType.outcome];
  final BudgetBookFilter filter;

  TransactionFilter({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    return FilterChipGroup(
      title: 'Transaction',
      items: _transactions,
      selectedItem: filter.transaction,
      onItemSelected: (value) {
        filter.transaction = value;
      },
      valueToString: (value) => value.label.tr(),
    );
  }
}
