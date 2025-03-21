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
        const Text(
          'Budget Book',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          '${filter.transaction} for ${filter.account} - ${filter.period}',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
