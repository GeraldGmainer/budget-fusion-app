import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

class IncomeOutcomeBalanceText extends StatefulWidget {
  final Decimal income;
  final Decimal outcome;
  final Currency currency;

  const IncomeOutcomeBalanceText({super.key, required this.income, required this.outcome, required this.currency});

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
        child: _showBalance ? _buildBalance() : _buildIncomeOutcome(),
      ),
    );
  }

  Widget _buildBalance() {
    final balance = widget.income - widget.outcome;
    return Column(
      key: const ValueKey<String>('balance'),
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Balance", style: TextStyle(fontSize: 14)),
        CurrencyText(
          value: balance,
          currency: widget.currency,
          color: balance >= Decimal.zero ? AppColors.incomeColor : AppColors.outcomeColor,
          fontSize: 16,
        ),
      ],
    );
  }

  Widget _buildIncomeOutcome() {
    return Column(
      key: const ValueKey<String>('incomeOutcome'),
      mainAxisSize: MainAxisSize.min,
      children: [
        CurrencyText(
          value: widget.income,
          currency: widget.currency,
          color: AppColors.incomeColor,
          fontSize: 16,
        ),
        CurrencyText(
          value: widget.outcome,
          currency: widget.currency,
          color: AppColors.outcomeColor,
          fontSize: 16,
        ),
      ],
    );
  }
}
