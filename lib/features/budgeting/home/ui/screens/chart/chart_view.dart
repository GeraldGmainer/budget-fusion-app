import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../../home.dart';

class ChartView extends StatelessWidget {
  final List<ChartViewData> charts;

  const ChartView({super.key, required this.charts});

  @override
  Widget build(BuildContext context) {
    if (charts.isEmpty) {
      return Center(
        child: Text(
          "No chart data available.",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: charts.length,
      itemBuilder: (context, index) {
        final chart = charts[index];
        final balance = chart.period.income - chart.period.outcome;
        final date = chart.period.filter.dateTime ?? DateTime.now();

        return Card(
          margin: EdgeInsets.all(12.0),
          elevation: 4.0,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Currency Display
                Text(
                  "${date.year}.${date.month}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),

                // Income Display
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Income:",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "${chart.currency.symbol}${chart.period.income.toDouble().toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),

                // Outcome Display
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Outcome:",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "${chart.currency.symbol}${chart.period.outcome.toDouble().toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),

                // Balance Display
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Balance:",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "${chart.currency.symbol}${balance.toDouble().toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 16,
                        color: balance >= Decimal.zero ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.0),

                // Category Summaries Count
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Number of Categories:",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "${chart.categorySummaries.length}",
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
