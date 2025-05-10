import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/pie_data.dart';
import '../../domain/entities/summary_view_data.dart';
import 'income_outcome_balance_text.dart';

class SummaryGraph extends StatelessWidget {
  final SummaryViewData data;

  const SummaryGraph({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final pieData = data.pieData.isEmpty ? [PieData(xData: " ", yData: 100, text: " ", iconName: "", iconColor: "#7F7F7F", hideIcon: true)] : data.pieData;

    return CustomCardWithAction(
      child: Center(
        child: SizedBox(
          height: 220,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                  swapAnimationDuration: Duration(milliseconds: 300),
                  swapAnimationCurve: Curves.linear,
                  PieChartData(
                    sections: _buildSections(pieData),
                    centerSpaceRadius: 70,
                    sectionsSpace: 3,
                    startDegreeOffset: 270,
                  )),
              IncomeOutcomeBalanceText(
                income: data.income,
                outcome: data.outcome,
                currency: data.currency,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> _buildSections(List<PieData> data) {
    return data.map((pieData) {
      final sliceColor = ColorConverter.stringToColor(pieData.iconColor);
      final darkerColor = ColorConverter.darken(sliceColor, 0.08);
      return PieChartSectionData(
        value: pieData.yData.toDouble(),
        gradient: LinearGradient(colors: [sliceColor, darkerColor], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        showTitle: false,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
        badgeWidget: (!pieData.hideIcon && pieData.iconName.isNotEmpty) ? BudgetIcon(name: pieData.iconName, color: '#FFFFFF', size: 24) : null,
        badgePositionPercentageOffset: 0.5,
        radius: 40,
      );
    }).toList();
  }
}
