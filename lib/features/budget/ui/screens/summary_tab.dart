import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import '../widgets/widgets.dart';

class SummaryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaginatedBudgetPageView<SummaryViewData>(
      itemBuilder: (context, summary) => SummaryView(chart: summary),
    );
  }
}
