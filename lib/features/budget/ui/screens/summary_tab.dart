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
    context.read<BookingPeriodBloc>().add(BookingPeriodEvent.load(PeriodMode.month));
  }

  void _onPageChanged(int pageIndex) {
    setState(() {
      _currentPage = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryBloc, SummaryState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (charts) => _buildView(charts),
          empty: () => Center(child: Text("Empty")),
          error: (error) => ErrorText(message: error, onReload: _reload),
          orElse: () => LoadingIndicator(),
        );
      },
    );
  }

  Widget _buildView(List<ChartViewData> charts) {
    for (var chart in charts) {
      print(chart.period.filter);
    }
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
