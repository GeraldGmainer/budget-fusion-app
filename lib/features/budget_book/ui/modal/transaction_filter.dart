import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../view_models/budget_book_filter.dart';

class TransactionFilter extends StatefulWidget {
  final BudgetBookFilter filter;

  const TransactionFilter({super.key, required this.filter});

  @override
  State<TransactionFilter> createState() => _TransactionFilterState();
}

class _TransactionFilterState extends State<TransactionFilter> {
  final List<TransactionType?> _transactions = [null, TransactionType.income, TransactionType.outcome];

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
      valueToString: (value) => value == null ? "All" : value.label.tr(),
    );
  }
}
