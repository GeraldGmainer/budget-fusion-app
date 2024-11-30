import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';
import '../../domain/domain.dart';
import '../widgets/widgets.dart';

class SummaryTab extends StatefulWidget {
  @override
  State<SummaryTab> createState() => _SummaryTabState();
}

class _SummaryTabState extends State<SummaryTab> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _reload() {
    // TODO use filter
    final filter = BudgetBookFilter(transaction: TransactionType.outcome, period: PeriodMode.month);
    context.read<SummaryBloc>().add(PeriodPaginationEvent.refresh(filter));
  }

  void _onPageChanged(int pageIndex) {
    setState(() {
      _currentPage = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryBloc, PeriodPaginationState>(
      builder: (context, state) {
        return state.when(
          initial: () => LoadingIndicator(),
          loading: (items, isFirstFetch) => LoadingIndicator(),
          loaded: (items, hasReachedMax) => _buildView(items as List<ChartViewData>),
          empty: () => Center(child: Text("Empty")),
          error: (error, items) => ErrorText(message: error, onReload: _reload),
        );
      },
    );
  }

  Widget _buildView(List<ChartViewData> charts) {
    return PageView.builder(
      controller: _pageController,
      itemCount: charts.length,
      onPageChanged: _onPageChanged,
      reverse: true,
      itemBuilder: (context, index) {
        return SummaryView(chart: charts[charts.length - 1 - index]);
      },
    );
  }
}
