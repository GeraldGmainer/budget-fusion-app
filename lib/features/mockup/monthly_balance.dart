// monthly_balance.dart
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class MonthlyBalance extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'MONTHLY BALANCE',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '\$41,379.00',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'TOP EXPENSES THIS MONTH',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Column(
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
                        '\$${category.amount}',
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            const Text(
              '6 MONTH BALANCES',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
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
                            return Text(
                              months[value.toInt()],
                              style: const TextStyle(fontSize: 10, color: Colors.white),
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
                      spots: balanceData.map((data) => FlSpot(balanceData.indexOf(data).toDouble(), data.balance)).toList(),
                      isCurved: true,
                      color: AppColors.accentColor,
                      // barWidth: 3,
                      // dotData: FlDotData(
                      //   show: true,
                      //   // dotSize: 4,
                      //   // dotColor: Colors.deepPurpleAccent,
                      // ),
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
                          }),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
