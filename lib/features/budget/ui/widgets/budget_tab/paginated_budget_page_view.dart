import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/application.dart';
import 'check_mark_indicator.dart';

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
        const height = 150.0;

        return Stack(
          children: [
            if (items.isNotEmpty)
              // CustomRefreshIndicator(
              //   builder: (BuildContext context, Widget child, IndicatorController controller) {
              //     return AnimatedBuilder(
              //         animation: controller,
              //         builder: (context, _) {
              //           final dy = controller.value.clamp(0.0, 1.25) * -(height - (height * 0.25));
              //           return Stack(
              //             children: [
              //               child,
              //               PositionedIndicatorContainer(
              //                 controller: controller,
              //                 displacement: 0,
              //                 child: Container(
              //                     padding: const EdgeInsets.all(8.0),
              //                     transform: Matrix4.translationValues(dy, 0, 0.0),
              //                     color: Colors.black,
              //                     child: switch (controller.state) {
              //                       IndicatorState.idle => null,
              //                       IndicatorState.dragging || IndicatorState.canceling || IndicatorState.armed || IndicatorState.settling => const Column(
              //                           children: [
              //                             Text("Pull to fetch more"),
              //                           ],
              //                         ),
              //                       IndicatorState.loading => Column(
              //                           children: [
              //                             Container(
              //                               width: 32,
              //                               height: 32,
              //                               child: const CircularProgressIndicator(
              //                                 strokeWidth: 2,
              //                               ),
              //                             ),
              //                             const Text("Fetching..."),
              //                           ],
              //                         ),
              //                       IndicatorState.complete || IndicatorState.finalizing => null,
              //                     }),
              //               ),
              //             ],
              //           );
              //         });
              //   },
              //   durations: RefreshIndicatorDurations(
              //       cancelDuration: Duration(milliseconds: 1000),
              //       settleDuration: Duration(milliseconds: 1000),
              //       finalizeDuration: Duration(milliseconds: 1000),
              //       completeDuration: Duration(milliseconds: 1000)),
              //   onRefresh: _onLoadMore,
              //   // offsetToArmed: 80.0,
              //   trigger: IndicatorTrigger.trailingEdge,
              //   triggerMode: IndicatorTriggerMode.onEdge,
              //   child: PageView.builder(
              //     controller: _pageController,
              //     itemCount: items.length,
              //     onPageChanged: _onPageChanged,
              //     reverse: true,
              //     physics: const AlwaysScrollableScrollPhysics(),
              //     itemBuilder: (context, index) {
              //       return widget.itemBuilder(context, items.reversed.toList()[index]);
              //     },
              //   ),
              // )
              CheckMarkIndicator(
                  onRefresh: _onLoadMore,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: items.length,
                    onPageChanged: _onPageChanged,
                    reverse: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return widget.itemBuilder(context, items.reversed.toList()[index]);
                    },
                  ))
            else if (isInitialLoading)
              Center(child: CircularProgressIndicator())
            else
              Center(child: Text("No data available.")),
            // if (isPaginationLoading)
            //   Positioned(
            //     bottom: 0,
            //     left: 0,
            //     right: 0,
            //     child: LinearProgressIndicator(),
            //   ),
          ],
        );
      },
    );
  }
}
