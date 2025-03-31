import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/summary_view_data.dart';
import 'category_summary_list.dart';
import 'summary_graph.dart';

class SummaryView extends StatelessWidget {
  final SummaryViewData data;

  const SummaryView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _buildChartCard(data, Decimal.zero, data.dateRange.from),
    );
  }

  Widget _buildChartCard(SummaryViewData summaryData, Decimal balance, DateTime date) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SummaryGraph(data: summaryData),
          const SizedBox(height: 12.0),
          CategorySummaryList(summaries: summaryData.summaries),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
