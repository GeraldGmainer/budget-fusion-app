import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';
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

  Future<void> _onLoadMore() async {
    context.read<BookingPageBloc>().add(const BookingPageEvent.loadMore());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingPageBloc, BookingPageState>(
      builder: (context, bookingState) {
        final isFirstFetch = bookingState.maybeWhen(loading: (_, __, isFirstFetch, ___, ____) => isFirstFetch, orElse: () => false);
        return Stack(
          children: [
            _buildContent(bookingState),
            if (bookingState.isLoading && isFirstFetch) Center(child: CircularProgressIndicator()),
            if (bookingState.isLoading && !isFirstFetch)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: LinearProgressIndicator(),
              ),
            // Error Handling (Optional: Could use a separate widget or Snackbar)
            if (bookingState.isError)
              Positioned(
                top: 16,
                left: 16,
                right: 16,
                child: Material(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      bookingState.whenOrNull(error: (_, __, message, ___, ____) => message) ?? "unknown error",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  /// Builds the main content of the SummaryTab based on the current state.
  Widget _buildContent(BookingPageState bookingState) {
    // Extract SummaryViewData from viewItems
    final summaries = bookingState.summaries;

    if (summaries.isEmpty) {
      if (bookingState.isLoading) {
        // Show a placeholder while loading
        return SizedBox.shrink();
      }
      return Center(child: Text("No summary data available."));
    }

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
        itemCount: summaries.length,
        onPageChanged: _onPageChanged,
        reverse: true,
        itemBuilder: (context, index) {
          return SummaryView(chart: summaries.reversed.toList()[index]);
        },
      ),
    );
  }

  /// Updates the current page index when the user navigates between pages.
  void _onPageChanged(int pageIndex) {
    setState(() {
      _currentPage = pageIndex;
    });
  }
}
