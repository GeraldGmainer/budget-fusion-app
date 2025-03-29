import 'package:budget_fusion_app/features/budget_book/domain/entities/category_view_summary.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/summary_view_data.dart';

class SummaryView extends StatelessWidget {
  final SummaryViewData data;

  const SummaryView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return _buildChartCard(data, Decimal.zero, data.dateRange.from);
  }

  Widget _buildChartCard(SummaryViewData chart, Decimal balance, DateTime date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${date.year}.${date.month.toString().padLeft(2, '0')}",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        _buildRow("Income:", "${chart.currency.symbol}${chart.income.toDouble().toStringAsFixed(2)}", Colors.green),
        const SizedBox(height: 4.0),
        _buildRow("Outcome:", "${chart.currency.symbol}${chart.outcome.toDouble().toStringAsFixed(2)}", Colors.red),
        const SizedBox(height: 4.0),
        _buildRow("Balance:", "${chart.currency.symbol}${balance.toDouble().toStringAsFixed(2)}", balance >= Decimal.zero ? Colors.green : Colors.red),
        const SizedBox(height: 12.0),
        Text("Categories:", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8.0),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: chart.summaries.length,
            itemBuilder: (context, index) {
              final summary = chart.summaries[index];
              return Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: _buildCategorySummary(summary),
              );
            },
          ),
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }

  Widget _buildCategorySummary(CategoryViewSummary summary) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                summary.categoryName,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "${summary.percentage}%",
                style: const TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                summary.value.toStringAsFixed(2),
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        if (summary.subSummaries.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              children: summary.subSummaries
                  .map((subSummary) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: _buildCategorySummary(subSummary),
                      ))
                  .toList(),
            ),
          ),
      ],
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
