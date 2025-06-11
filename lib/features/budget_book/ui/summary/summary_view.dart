import 'package:budget_fusion_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/budget_book_cubit.dart';
import '../../view_models/summary_view_data.dart';
import '../widgets/budget_book_reloader.dart';
import 'category_summary_list.dart';
import 'summary_graph.dart';

class SummaryView extends StatelessWidget {
  final SummaryViewData data;

  const SummaryView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BudgetBookReloader(
      child: SingleChildScrollView(
        child: Padding(
          padding: AppDimensions.pageCardPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RepaintBoundary(child: SummaryGraph(data: data)),
              const SizedBox(height: 12.0),
              if (data.summaries.isNotEmpty) RepaintBoundary(child: CategorySummaryList(summaries: data.summaries)),
            ],
          ),
        ),
      ),
    );
  }
}
