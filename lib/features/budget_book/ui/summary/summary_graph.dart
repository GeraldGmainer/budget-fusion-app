import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/pie_data.dart';
import '../../domain/entities/summary_view_data.dart';

class SummaryGraph extends StatelessWidget {
  final SummaryViewData data;

  const SummaryGraph({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final pieData = data.pieData.isEmpty ? [PieData(xData: " ", yData: 100, text: " ", iconName: "", iconColor: "#FFFFFF", hideIcon: true)] : data.pieData;

    return Center(
      child: SizedBox(
        height: 220,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PieChart(
              PieChartData(
                sections: _buildSections(pieData),
                centerSpaceRadius: 70,
                sectionsSpace: 3,
                startDegreeOffset: 270,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CurrencyText(value: data.income, currency: data.currency, color: AppColors.incomeColor, fontSize: 16),
                CurrencyText(value: data.outcome, currency: data.currency, color: AppColors.outcomeColor, fontSize: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> _buildSections(List<PieData> data) {
    return data.map((pieData) {
      final sliceColor = ColorConverter.stringToColor(pieData.iconColor);
      return PieChartSectionData(
        value: pieData.yData.toDouble(),
        color: sliceColor,
        showTitle: false,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
        badgeWidget: (!pieData.hideIcon && pieData.iconName.isNotEmpty) ? BudgetIcon(name: pieData.iconName, color: '#FFFFFF', size: 24) : null,
        badgePositionPercentageOffset: 0.5,
        radius: 40,
      );
    }).toList();
  }
}
