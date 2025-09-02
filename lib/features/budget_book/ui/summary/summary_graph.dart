import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../view_models/pie_data.dart';
import '../../view_models/summary_view_data.dart';
import 'income_outcome_balance_text.dart';

class SummaryGraph extends StatelessWidget {
  static const List<PieData> emptyPie = [PieData(xData: " ", yData: 100, text: " ", iconName: "", iconColor: "#7F7F7F", hideIcon: true)];

  final SummaryViewData data;

  const SummaryGraph({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final pieData = data.pieData.isEmpty ? emptyPie : data.pieData;

    return CustomCardWithAction(
      floatingOption: true,
      onOptionTap: () {
        context.showComingSoon();
      },
      child: Center(
        child: SizedBox(
          height: 220,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                duration: Duration(milliseconds: 300),
                curve: Curves.linear,
                PieChartData(
                  sections: _buildSections(pieData),
                  centerSpaceRadius: 70,
                  sectionsSpace: 3,
                  startDegreeOffset: 270,
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      if (event is FlTapUpEvent && pieTouchResponse != null && pieTouchResponse.touchedSection != null) {
                        final tappedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                        BudgetLogger.instance.d("tappedIndex $tappedIndex");
                        context.showComingSoon();
                      }
                    },
                  ),
                ),
              ),
              IncomeOutcomeBalanceText(income: data.income, outcome: data.outcome),
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
        badgeWidget: (!pieData.hideIcon && pieData.iconName.isNotEmpty && !pieData.iconName.isNotEmpty) ? BudgetIcon(name: pieData.iconName, color: '#FFFFFF', size: 24) : null,
        badgePositionPercentageOffset: 0.5,
        radius: 40,
      );
    }).toList();
  }
}
