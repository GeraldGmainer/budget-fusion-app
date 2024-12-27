import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/shared.dart';
import '../../../domain/domain.dart';

class TransactionFilter extends StatefulWidget {
  final BudgetBookFilter filter;

  const TransactionFilter({super.key, required this.filter});

  @override
  State<TransactionFilter> createState() => _TransactionFilterState();
}

class _TransactionFilterState extends State<TransactionFilter> {
  final List<TransactionType> _transactions = [TransactionType.income, TransactionType.outcome];

  @override
  Widget build(BuildContext context) {
    return FilterChipGroup(
      title: 'Transaction',
      items: _transactions,
      selectedItem: widget.filter.transaction,
      onItemSelected: (value) {
        setState(() {
          widget.filter.transaction = value;
        });
      },
      valueToString: (value) => value.label.tr(),
    );
  }
}
