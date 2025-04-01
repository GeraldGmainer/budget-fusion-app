import 'package:budget_fusion_app/features/budget_book/domain/enums/period_mode.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/budget_book_filter.dart';

class BudgetTabTitle extends StatelessWidget {
  final BudgetBookFilter filter;

  const BudgetTabTitle({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Budget Book', style: TextStyle(fontSize: 20)),
        Text(
          _buildSubtitle(filter),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  String _buildSubtitle(BudgetBookFilter filter) {
    final periodString = filter.period.label.tr();
    if (filter.transaction != null && filter.account != null) {
      return '${filter.transaction} for ${filter.account!.name} - $periodString';
    } else if (filter.transaction != null) {
      return 'Outcomes - $periodString';
    } else if (filter.account != null) {
      return 'All Transactions for ${filter.account!.name} - ${filter.period}';
    } else {
      return 'All Transactions - $periodString';
    }
  }
}
