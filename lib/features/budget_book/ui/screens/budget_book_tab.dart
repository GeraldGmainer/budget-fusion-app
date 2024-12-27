import 'dart:async';

import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';
import '../../domain/domain.dart';
import '../widgets/widgets.dart';

class BudgetBookTab extends StatefulWidget {
  @override
  State<BudgetBookTab> createState() => _BudgetBookTabState();
}

class _BudgetBookTabState extends State<BudgetBookTab> with AutomaticKeepAliveClientMixin {
  final List<String> _viewModes = ['Summary', 'Transactions', 'Calendar'];
  final PageController _pageController = PageController();
  final _indicatorKey = GlobalKey<CustomRefreshIndicatorState>();
  Completer<void>? _loadMoreCompleter;
  int _currentPage = 0;
  late BookingDateRange _currentDateRange;

  BookingViewMode get currentViewMode => context.read<BookingPageBloc>().state.currentViewMode;

  BudgetBookFilter get currentFilter => context.read<BookingPageBloc>().state.currentFilter;

  @override
  void initState() {
    super.initState();
    _initializeDateRange();
    _load();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _initializeDateRange() {
    _currentDateRange = BookingDateRange(period: currentFilter.period, from: DateTime.now(), to: DateTime.now());
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
    BudgetLogger.instance.i("_onMoreLoading");
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
      } else {
        BudgetLogger.instance.w("items are empty");
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
    return BlocConsumer<BookingPageBloc, BookingPageState>(
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
        return Column(
          children: [
            _buildPeriodSelector(),
            const SizedBox(height: 8),
            _buildNavbar(),
            const SizedBox(height: 8),
            _buildContent(state),
          ],
        );
      },
    );
  }

  Widget _buildPeriodSelector() {
    return PeriodSelector(
      filter: currentFilter,
      dateRange: _currentDateRange,
      pageController: _pageController,
      indicatorKey: _indicatorKey,
    );
  }

  Widget _buildNavbar() {
    return ScrollableNavBar(
      onTabSelect: _onViewSelected,
      items: _viewModes,
    );
  }

  Widget _buildContent(BookingPageState state) {
    final List<BookingPageViewData> items = state.viewItems;
    final bool isInitialLoading = state.isLoading && state.isFirstFetch && items.isEmpty;

    return Expanded(
      child: Stack(
        children: [
          if (items.isNotEmpty)
            CustomHorizontalIndicator(
                indicatorKey: _indicatorKey,
                onRefresh: _onLoadMore,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: items.length,
                  onPageChanged: _onPageChanged,
                  reverse: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = items.reversed.toList()[index];
                    return _buildView(item);
                  },
                ))
          else if (isInitialLoading)
            Center(child: CircularProgressIndicator())
          else
            Center(child: Text("No data available.".tr())),
        ],
      ),
    );
  }

  Widget _buildView(BookingPageViewData item) {
    switch (currentViewMode) {
      case BookingViewMode.summary:
        return SummaryView(data: item as SummaryViewData);
      case BookingViewMode.transaction:
        return TransactionView();
      case BookingViewMode.calendar:
        return CalendarView();
    }
  }

  @override
  bool get wantKeepAlive => true;
}
