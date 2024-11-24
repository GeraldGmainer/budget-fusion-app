import 'package:budget_fusion_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class PeriodSelector extends StatelessWidget {
  void _onPrevious(BuildContext context) {}

  void _onNext(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: AppBorders.secondaryBorder)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              _onPrevious(context);
            },
          ),
          _buildPeriod(),
          IconButton(
            icon: Icon(Icons.chevron_right),
            onPressed: () {
              _onNext(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPeriod() {
    return Text(
      "May",
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }
}
