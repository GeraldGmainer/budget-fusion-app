import 'dart:async';

import 'package:budget_fusion_app/features/budget/ui/actions/actions.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';
import '../../domain/domain.dart';
import '../widgets/widgets.dart';

class BudgetTab extends StatefulWidget {
  @override
  State<BudgetTab> createState() => _BudgetTabState();
}

class _BudgetTabState extends State<BudgetTab> with AutomaticKeepAliveClientMixin {
  final List<String> _viewModes = ['Summary', 'Transactions', 'Balances', 'Calendar'];
  final PageController _pageController = PageController();
  Completer<void>? _loadMoreCompleter;
  int _currentPage = 0;
  late BookingDateRange _currentDateRange;

  BookingViewMode get currentViewMode => context.read<BookingPageBloc>().state.currentViewMode;

  BudgetBookFilter get currentFilter => context.read<BookingPageBloc>().state.currentFilter;

  @override
  void initState() {
    super.initState();
    _currentDateRange = BookingDateRange(period: currentFilter.period, from: DateTime.now(), to: DateTime.now());
    _load();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _load() {
    context.read<BookingPageBloc>().add(BookingPageEvent.loadInitial(currentFilter, currentViewMode));
  }

  void _onInitialLoading() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
        _onPageChanged(0);
      }
    });
  }

  void _onMoreLoading() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      }
    });
    _loadMoreCompleter?.complete();
    _loadMoreCompleter = null;
  }

  void _onError(String message) {
    _loadMoreCompleter?.completeError(message);
    _loadMoreCompleter = null;
    showSnackBar(context, message);
  }

  Future<void> _onLoadMore() async {
    final bookingBloc = context.read<BookingPageBloc>();
    if (bookingBloc.state.isLoading) return;
    if (bookingBloc.state.hasReachedMax) {
      showSnackBar(context, "All bookings have been loaded");
      return;
    }
    _loadMoreCompleter = Completer<void>();
    bookingBloc.add(const BookingPageEvent.loadMore());
    return _loadMoreCompleter!.future;
  }

  void _onPageChanged(int pageIndex) {
    final items = context.read<BookingPageBloc>().state.viewItems;
    final reveredIndex = items.length - 1 - pageIndex;
    setState(() {
      _currentPage = pageIndex;
      if (items.isNotEmpty) {
        _currentDateRange = items[reveredIndex].dateRange;
      }
    });
  }

  void _onViewSelected(int index) {
    final viewMode = BookingViewMode.values[index];
    context.read<BookingPageBloc>().add(BookingPageEvent.updateView(viewMode: viewMode));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: BudgetTabTitle(filter: currentFilter),
        actions: [
          RefreshButton(onTap: () => _load()),
          BookingFilterButton(filter: currentFilter),
        ],
      ),
      body: BlocConsumer<BookingPageBloc, BookingPageState>(
        listener: (context, state) {
          if (state.isInitial) {
            _onInitialLoading();
          } else if (state.isLoaded) {
            _onMoreLoading();
          } else if (state.isError) {
            final error = state.maybeWhen(error: (_, __, message, ___, ____) => message, orElse: () => "unknown error");
            _onError(error);
          }
        },
        builder: (context, state) {
          final List<BookingPageViewData> items = state.viewItems;
          final bool isInitialLoading = state.isLoading && state.isFirstFetch && items.isEmpty;

          return Column(
            children: [
              PeriodSelector(filter: currentFilter, dateRange: _currentDateRange, pageController: _pageController),
              ScrollableNavBar(
                onTabSelect: _onViewSelected,
                items: _viewModes,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Stack(
                  children: [
                    if (items.isNotEmpty)
                      CustomHorizontalIndicator(
                          onRefresh: _onLoadMore,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: items.length,
                            onPageChanged: _onPageChanged,
                            reverse: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final item = items.reversed.toList()[index];
                              return SummaryView(chart: item as SummaryViewData);
                            },
                          ))
                    else if (isInitialLoading)
                      Center(child: CircularProgressIndicator())
                    else
                      Center(child: Text("No data available.".tr())),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
