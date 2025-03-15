import 'package:budget_fusion_app/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/budget_book/cubits/budget_book_cubit.dart';
import '../../domain/entities/budget_book_filter.dart';
import '../../domain/entities/budget_date_range.dart';
import '../../domain/enums/budget_view_mode.dart';

class BudgetBookTab extends StatefulWidget {
  @override
  State<BudgetBookTab> createState() => _BudgetBookTabState();
}

class _BudgetBookTabState extends State<BudgetBookTab> with AutomaticKeepAliveClientMixin {
  final List<String> _viewModes = ['Summary', 'Transactions', 'Calendar'];
  final PageController _pageController = PageController();
  late BudgetDateRange _currentDateRange;

  BudgetViewMode get currentViewMode => context.read<BudgetBookCubit>().state.currentViewMode;

  BudgetBookFilter get currentFilter => context.read<BudgetBookCubit>().state.currentFilter;

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
    _currentDateRange = BudgetDateRange(period: currentFilter.period, from: DateTime.now(), to: DateTime.now());
  }

  void _load() {
    context.read<BudgetBookCubit>().load(currentFilter, currentViewMode);
  }

  void _onLoad() {
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

  void _onError(String message) {
    showSnackBar(context, message);
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
          _onLoad();
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
            PageView.builder(
              controller: _pageController,
              itemCount: items.length,
              onPageChanged: _onPageChanged,
              reverse: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = items.reversed.toList()[index];
                return _buildView(item);
              },
            )
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
