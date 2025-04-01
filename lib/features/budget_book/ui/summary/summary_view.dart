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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SummaryGraph(data: data),
            const SizedBox(height: 12.0),
            if (data.summaries.isNotEmpty) CategorySummaryList(summaries: data.summaries),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
