import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
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

  void _onPageChanged(int pageIndex) {
    setState(() {
      _currentPage = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingPageBloc, BookingPageState>(
      listener: (context, bookingState) {
        bookingState.whenOrNull(
          loaded: (items) {
            context.read<SummaryBloc>().add(SummaryEvent.refresh(items));
          },
          error: (items, error) {
            showErrorSnackBar(context, error);
          },
        );
      },
      child: BlocBuilder<SummaryBloc, SummaryState>(
        builder: (context, summaryState) {
          return summaryState.maybeWhen(
            loaded: (items) => _buildView(items),
            empty: () => Center(child: Text("No data available.")),
            error: (items, error) => _buildView(items),
            orElse: () => SizedBox.shrink(),
          );
        },
      ),
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
