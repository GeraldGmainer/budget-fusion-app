import 'package:budget_fusion_app/core/constants/app_colors.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/budget_book_cubit.dart';
import '../../domain/entities/budget_date_range.dart';
import '../../domain/entities/summary_view_data.dart';
import '../../domain/entities/transaction_view_data.dart';
import '../../domain/enums/budget_view_mode.dart';
import '../calendar/calendar_view.dart';
import '../summary/summary_view.dart';
import '../transaction/transaction_view.dart';
import '../widgets/period_selector.dart';

class BudgetBookTab extends StatefulWidget {
  @override
  State<BudgetBookTab> createState() => _BudgetBookTabState();
}

class _BudgetBookTabState extends State<BudgetBookTab> with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final PageController _pageController = PageController();
  late BudgetDateRange _currentDateRange;

  @override
  void initState() {
    super.initState();
    _initPagination();
    _tabController = TabController(
      length: BudgetViewMode.values.length,
      vsync: this,
      initialIndex: context.read<BudgetBookCubit>().state.viewMode.index,
    )..addListener(() {
        if (_tabController.indexIsChanging) {
          final vm = BudgetViewMode.values[_tabController.index];
          context.read<BudgetBookCubit>().updateView(viewMode: vm, initialLoad: false);
        }
      });
  }

  void _initPagination() {
    final now = DateTime.now();
    final period = context.read<BudgetBookCubit>().state.filter.period;
    _currentDateRange = BudgetDateRange(period: period, from: now, to: now);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onLoaded(bool initialLoaded) {
    if (!initialLoaded) return;
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
    final items = context.read<BudgetBookCubit>().state.items;
    if (items.isNotEmpty) {
      final reversedIndex = items.length - 1 - pageIndex;
      setState(() {
        _currentDateRange = items[reversedIndex].dateRange;
      });
    } else {
      BudgetLogger.instance.w('items are empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<BudgetBookCubit, BudgetBookState>(
      listenWhen: (prev, curr) => prev.items != curr.items,
      listener: (context, state) {
        state.whenOrNull(
          loaded: (_, __, ___, ____, initialLoaded) => _onLoaded(initialLoaded),
          error: (_, __, ___, ____, message) => _onError(message),
        );
      },
      builder: (context, state) {
        if (state.maybeWhen(initial: (_, __, ___, ____) => true, orElse: () => false)) {
          return Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            PeriodSelector(
              filter: state.filter,
              dateRange: _currentDateRange,
              pageController: _pageController,
            ),
            Material(
              color: AppColors.primaryColor,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                tabs: BudgetViewMode.values.map((vm) {
                  // TODO translation
                  return Tab(text: vm.label);
                }).toList(),
              ),
            ),
            Expanded(
              child: _buildBody(state),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBody(BudgetBookState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.items.isEmpty) {
      return Center(child: Text('No data available.'.tr()));
    }

    return TabBarView(
      controller: _tabController,
      children: [
        if (state.viewMode == BudgetViewMode.summary) _buildSummary(state.items.cast<SummaryViewData>()) else const SizedBox.shrink(),
        if (state.viewMode == BudgetViewMode.transaction) _buildTransaction(state.items.cast<TransactionViewData>()) else const SizedBox.shrink(),
        if (state.viewMode == BudgetViewMode.calendar) CalendarView() else const SizedBox.shrink(),
      ],
    );
  }

  Widget _buildSummary(List<SummaryViewData> items) {
    final reversed = items.reversed.toList();
    return PageView.builder(
      controller: _pageController,
      itemCount: reversed.length,
      onPageChanged: _onPageChanged,
      reverse: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return RepaintBoundary(
          child: SummaryView(data: reversed[index]),
        );
      },
    );
  }

  Widget _buildTransaction(List<TransactionViewData> items) {
    final reversed = items.reversed.toList();
    return PageView.builder(
      controller: _pageController,
      itemCount: reversed.length,
      onPageChanged: _onPageChanged,
      reverse: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return RepaintBoundary(
          child: TransactionView(data: reversed[index]),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
