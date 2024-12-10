import 'package:budget_fusion_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class PeriodSelector extends StatelessWidget {
  void _onPrevious(BuildContext context) {}

  void _onNext(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.chevron_left, color: AppColors.secondaryTextColor),
          onPressed: () {
            _onPrevious(context);
          },
        ),
        _buildPeriod(),
        IconButton(
          icon: Icon(Icons.chevron_right, color: AppColors.secondaryTextColor),
          onPressed: () {
            _onNext(context);
          },
        ),
      ],
    );
  }

  Widget _buildPeriod() {
    return Text(
      "May",
      style: const TextStyle(
        fontSize: 18,
        color: AppColors.primaryTextColor,
      ),
    );
  }
}
