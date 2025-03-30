import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/category_view_summary.dart';
import '../../domain/entities/summary_view_data.dart';

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

  Widget _buildList(List<CategoryViewSummary> summaries) {
    List<Widget> tiles = [];
    for (var summary in summaries) {
      if (summary.subSummaries.isNotEmpty) {
        tiles.addAll(summary.subSummaries.map((child) => _buildCategoryTile(child)).toList());
      } else {
        tiles.add(_buildCategoryTile(summary));
      }
    }
    return TransactionList(
      itemCount: tiles.length,
      itemBuilder: (BuildContext context, int index) {
        return tiles[index];
      },
    );
  }

  Widget _buildCategoryTile(CategoryViewSummary summary) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: Icon(Icons.category, color: Colors.blue, size: 26),
      title: Text(summary.categoryName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: summary.parentCategoryName == null
          ? null
          : Text(summary.parentCategoryName!, style: const TextStyle(fontSize: 14, color: AppColors.secondaryTextColor)),
      // subtitle: Text(summary.parentCategoryName ?? "", style: const TextStyle(fontSize: 14, color: AppColors.secondaryTextColor)),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("${summary.value.toStringAsFixed(2)} €", textAlign: TextAlign.end, style: TextStyle(fontSize: 13)),
          Text("${summary.percentage} %", textAlign: TextAlign.end, style: TextStyle(fontSize: 13)),
        ],
      ),
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
