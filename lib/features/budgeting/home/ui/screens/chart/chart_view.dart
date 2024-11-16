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
        final balance = chart.income - chart.outcome;

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
                  "Currency: ${chart.currency.name} (${chart.currency.name})",
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
                      "${chart.currency.symbol}${chart.income.toDouble().toStringAsFixed(2)}",
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
                      "${chart.currency.symbol}${chart.outcome.toDouble().toStringAsFixed(2)}",
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

                // Optionally, Display More Information
                // For example, Total Number of Bookings
                // Uncomment if needed
                /*
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Bookings:",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "${chart.categorySummaries.fold(0, (sum, summary) => sum + summary.value.toInt())}",
                      style: TextStyle(fontSize: 16, color: Colors.orange),
                    ),
                  ],
                ),
                */
              ],
            ),
          ),
        );
      },
    );
  }
}
