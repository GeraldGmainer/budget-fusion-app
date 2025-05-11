import 'package:budget_fusion_app/core/constants/app_colors.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';

class BudgetOverview extends StatelessWidget {
  BudgetOverview({super.key});

  final List<BalanceData> balanceData = [
    BalanceData(month: 'Jan', balance: 3500),
    BalanceData(month: 'Feb', balance: 4000),
    BalanceData(month: 'Mar', balance: 3800),
    BalanceData(month: 'Apr', balance: 4200),
    BalanceData(month: 'May', balance: 3900),
    BalanceData(month: 'Jun', balance: 4300),
  ];

  final List<CategoryData> topCategories = [
    CategoryData(category: 'Groceries', amount: 150),
    CategoryData(category: 'Entertainment', amount: 120),
    CategoryData(category: 'Utilities', amount: 100),
  ];

  final double currentIncome = 5000;
  final double currentOutcome = 3500;

  @override
  Widget build(BuildContext context) {
    return CustomCardWithAction(
      title: "Monthly Balance",
      titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
      backgroundColor: AppColors.primaryColor,
      onOptionTap: () {
        context.showComingSoon();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Row(
            children: [
              // INCOME tile
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '\$${currentIncome.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'INCOME',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '\$${currentOutcome.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'EXPENSE',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Top Expenses This Month', style: TextStyle(fontSize: 14)),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: topCategories.map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        radius: 12,
                        child: Icon(
                          _getCategoryIcon(category.category),
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          category.category,
                          style: const TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      Text(
                        '\$${category.amount.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          const Text('6 Month Balances', style: TextStyle(fontSize: 14)),
          const SizedBox(height: 16),
          Container(
            height: 50,
            padding: EdgeInsets.all(8.0),
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                      reservedSize: 22,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
                        if (value.toInt() >= 0 && value.toInt() < months.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              months[value.toInt()],
                              style: const TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                lineTouchData: LineTouchData(
                  enabled: true,
                  touchSpotThreshold: 20,
                  handleBuiltInTouches: true,
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipItems: (List<LineBarSpot> touchedSpots) {
                      return touchedSpots.map((spot) {
                        final month = balanceData[spot.x.toInt()].month;
                        final balance = balanceData[spot.x.toInt()].balance;
                        return LineTooltipItem(
                          '$month\n\$${balance.toStringAsFixed(2)}',
                          const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    spots: balanceData
                        .map((data) => FlSpot(
                              balanceData.indexOf(data).toDouble(),
                              data.balance,
                            ))
                        .toList(),
                    isCurved: true,
                    color: AppColors.accentColor,
                    dotData: FlDotData(
                      show: true,
                      checkToShowDot: (spot, _) => true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 4,
                          color: AppColors.accentColor,
                          strokeWidth: 1,
                          strokeColor: AppColors.accentBackgroundColor,
                        );
                      },
                    ),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Groceries':
        return Icons.shopping_cart;
      case 'Entertainment':
        return Icons.movie;
      case 'Utilities':
        return Icons.lightbulb;
      default:
        return Icons.category;
    }
  }
}

class OptionsPage extends StatelessWidget {
  const OptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Options'),
      ),
      body: const Center(
        child: Text('Options Page'),
      ),
    );
  }
}

class BalanceData {
  final String month;
  final double balance;

  BalanceData({required this.month, required this.balance});
}

class CategoryData {
  final String category;
  final double amount;

  CategoryData({required this.category, required this.amount});
}
