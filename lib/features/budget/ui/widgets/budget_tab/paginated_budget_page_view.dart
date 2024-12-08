import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/application.dart';

class PaginatedBudgetPageView<T> extends StatefulWidget {
  final Widget Function(BuildContext context, T item) itemBuilder;

  const PaginatedBudgetPageView({super.key, required this.itemBuilder});

  @override
  PaginatedBudgetPageViewState<T> createState() => PaginatedBudgetPageViewState<T>();
}

class PaginatedBudgetPageViewState<T> extends State<PaginatedBudgetPageView<T>> {
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
    final bookingBloc = context.read<BookingPageBloc>();
    if (!bookingBloc.state.canLoadMore || bookingBloc.state.isLoading) return;
    bookingBloc.add(const BookingPageEvent.loadMore());
  }

  List<T> _extractItems(BookingPageState bookingState) {
    return bookingState.summaries as List<T>;
  }

  void _onPageChanged(int pageIndex) {
    setState(() {
      _currentPage = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingPageBloc, BookingPageState>(
      listener: (context, bookingState) {
        if (bookingState.isInitial) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_pageController.hasClients) {
              _pageController.animateToPage(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            }
          });
        } else if (bookingState.isLoaded) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_pageController.hasClients) {
              _pageController.animateToPage(
                _currentPage + 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            }
          });
        }
      },
      builder: (context, bookingState) {
        final List<T> items = _extractItems(bookingState);
        final bool isInitialLoading = bookingState.isLoading && bookingState.isFirstFetch && items.isEmpty;
        final bool isPaginationLoading = bookingState.isLoading && !bookingState.isFirstFetch;

        return Stack(
          children: [
            if (items.isNotEmpty)
              CustomRefreshIndicator(
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
                  itemCount: items.length,
                  onPageChanged: _onPageChanged,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return widget.itemBuilder(context, items.reversed.toList()[index]);
                  },
                ),
              )
            else if (isInitialLoading)
              Center(child: CircularProgressIndicator())
            else
              Center(child: Text("No data available.")),
            if (isPaginationLoading)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: LinearProgressIndicator(),
              ),
          ],
        );
      },
    );
  }
}
