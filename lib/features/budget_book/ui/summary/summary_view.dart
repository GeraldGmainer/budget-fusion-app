import 'package:budget_fusion_app/shared/shared.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/category_view_summary_data.dart';
import '../../domain/entities/summary_view_data.dart';
import 'category_line_view.dart';

// TODO refactoring
class SummaryView extends StatelessWidget {
  final SummaryViewData data;

  const SummaryView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _buildChartCard(data, Decimal.zero, data.dateRange.from),
    );
  }

  Widget _buildChartCard(SummaryViewData chart, Decimal balance, DateTime date) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${date.year}.${date.month.toString().padLeft(2, '0')}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          _buildRow("Income:", "${chart.currency.symbol}${chart.income.toDouble().toStringAsFixed(2)}", Colors.green),
          const SizedBox(height: 4.0),
          _buildRow("Outcome:", "${chart.currency.symbol}${chart.outcome.toDouble().toStringAsFixed(2)}", Colors.red),
          const SizedBox(height: 4.0),
          _buildRow("Balance:", "${chart.currency.symbol}${balance.toDouble().toStringAsFixed(2)}", balance >= Decimal.zero ? Colors.green : Colors.red),
          const SizedBox(height: 12.0),
          Text("Categories:", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          CardWithAction(child: _buildList(chart.summaries)),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }

  Widget _buildList(List<CategoryViewSummaryData> summaries) {
    List<Widget> tiles = [];
    for (var summary in summaries) {
      if (summary.subSummaries.isNotEmpty) {
        tiles.addAll(summary.subSummaries.map((child) => CategoryLineView(summary: child)).toList());
      } else {
        tiles.add(CategoryLineView(summary: summary));
      }
    }
    return TransactionList(
      itemCount: tiles.length,
      itemBuilder: (BuildContext context, int index) {
        return tiles[index];
      },
    );
  }

  Widget _buildRow(String label, String value, Color valueColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        Text(value, style: TextStyle(fontSize: 16, color: valueColor)),
      ],
    );
  }
}
