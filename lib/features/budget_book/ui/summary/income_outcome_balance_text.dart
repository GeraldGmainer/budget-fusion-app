import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

class IncomeOutcomeBalanceText extends StatefulWidget {
  final Decimal income;
  final Decimal outcome;
  final Currency currency;

  const IncomeOutcomeBalanceText({
    Key? key,
    required this.income,
    required this.outcome,
    required this.currency,
  }) : super(key: key);

  @override
  State<IncomeOutcomeBalanceText> createState() => _IncomeOutcomeBalanceTextState();
}

class _IncomeOutcomeBalanceTextState extends State<IncomeOutcomeBalanceText> {
  bool _showBalance = false;

  @override
  Widget build(BuildContext context) {
    final balance = widget.income - widget.outcome;

    return GestureDetector(
      onTap: () {
        setState(() {
          _showBalance = !_showBalance;
        });
      },
      child: _showBalance
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Balance:"),
                CurrencyText(
                  value: balance,
                  currency: widget.currency,
                  color: balance >= Decimal.zero ? AppColors.incomeColor : AppColors.outcomeColor,
                  fontSize: 16,
                ),
              ],
            )
          : Column(
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
            ),
    );
  }
}
