import 'package:budget_fusion_app/utils/utils.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
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
  int _previousItemCount = 0;

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

  Future<void> _onLoadMore() async {
    final filter = BudgetBookFilter(transaction: TransactionType.outcome, period: PeriodMode.month);
    context.read<BookingPageBloc>().add(BookingPageEvent.loadMore(filter));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingPageBloc, BookingPageState>(
      listener: (context, bookingState) {
        bookingState.whenOrNull(
          loaded: (items, isInitial) {
            context.read<SummaryBloc>().add(SummaryEvent.refresh(items));
            if (isInitial) {
              _pageController.animateToPage(0, duration: Duration(milliseconds: 300), curve: Curves.linear);
            } else {
              int newItemsCount = items.length - _previousItemCount;
              if (newItemsCount > 0) {
                _pageController.animateToPage(_currentPage + 1, duration: Duration(milliseconds: 300), curve: Curves.linear);
              }
            }
            _previousItemCount = items.length;
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
    return CustomRefreshIndicator(
      builder: (BuildContext context, Widget child, IndicatorController controller) {
        return Stack(
          alignment: Alignment.centerRight,
          children: [
            child,
            if (controller.isArmed || controller.isLoading)
              Positioned(
                left: 16,
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        );
      },
      onRefresh: _onLoadMore,
      offsetToArmed: 80.0,
      trigger: IndicatorTrigger.trailingEdge,
      triggerMode: IndicatorTriggerMode.onEdge,
      child: PageView.builder(
        controller: _pageController,
        itemCount: charts.length,
        onPageChanged: _onPageChanged,
        reverse: true,
        itemBuilder: (context, index) {
          return SummaryView(chart: charts[charts.length - 1 - index]);
        },
      ),
    );
  }

  void _onPageChanged(int pageIndex) {
    setState(() {
      _currentPage = pageIndex;
    });
  }
}
