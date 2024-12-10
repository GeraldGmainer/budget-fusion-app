import 'package:flutter/material.dart';

class BudgetTabTitle extends StatelessWidget {
  final String transaction;
  final String account;
  final String period;

  const BudgetTabTitle({
    super.key,
    required this.transaction,
    required this.account,
    required this.period,
  });

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
          '$transaction for $account - $period',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
