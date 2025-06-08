import 'package:budget_fusion_app/core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';

class IncomeOutcomeBalanceText extends StatefulWidget {
  final Money income;
  final Money outcome;

  const IncomeOutcomeBalanceText({super.key, required this.income, required this.outcome});

  @override
  State<IncomeOutcomeBalanceText> createState() => _IncomeOutcomeBalanceTextState();
}

class _IncomeOutcomeBalanceTextState extends State<IncomeOutcomeBalanceText> {
  bool _showBalance = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showBalance = !_showBalance;
        });
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: (_showBalance ? _buildBalance() : _buildIncomeOutcome()),
      ),
    );
  }

  Widget _buildBalance() {
    final balance = widget.income - widget.outcome;
    return Padding(
      key: const ValueKey<String>('balance'),
      padding: EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("budgetBook.tabs.summary.balance".tr(), style: TextStyle(fontSize: 14)),
          MoneyText(money: balance, color: balance.isPositive() ? AppColors.incomeColor : AppColors.outcomeColor, fontSize: 16),
        ],
      ),
    );
  }

  Widget _buildIncomeOutcome() {
    return Padding(
      key: const ValueKey<String>('incomeOutcome'),
      padding: EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [MoneyText(money: widget.income, color: AppColors.incomeColor, fontSize: 16), MoneyText(money: widget.outcome, color: AppColors.outcomeColor, fontSize: 16)],
      ),
    );
  }
}
