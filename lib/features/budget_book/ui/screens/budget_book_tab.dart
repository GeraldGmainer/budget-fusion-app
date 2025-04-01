import 'package:budget_fusion_app/features/budget_book/domain/entities/budget_date_range.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/budget_book/cubits/budget_book_cubit.dart';
import '../../domain/entities/budget_book_filter.dart';
import '../../domain/entities/summary_view_data.dart';
import '../../domain/enums/budget_view_mode.dart';
import '../calendar/calendar_view.dart';
import '../summary/summary_view.dart';
import '../transaction/transaction_view.dart';
import '../widgets/period_selector.dart';

class BudgetBookTab extends StatefulWidget {
  @override
  State<BudgetBookTab> createState() => _BudgetBookTabState();
}

class _BudgetBookTabState extends State<BudgetBookTab> with AutomaticKeepAliveClientMixin {
  final List<String> _viewModes = ['Summary', 'Transactions', 'Calendar'];
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _load() {
    context.read<BudgetBookCubit>().load();
  }

  void _onLoaded() {
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
    // TODO dont use List<SummaryViewData> to get current date range
    final items = context.read<BudgetBookCubit>().state.items;
    if (items.isNotEmpty) {
      final reveredIndex = items.length - 1 - pageIndex;
      final newDateRange = items[reveredIndex].dateRange;
      context.read<BudgetBookCubit>().updateDateRange(newDateRange);
    } else {
      BudgetLogger.instance.w("items are empty");
    }
  }

  void _onViewSelected(int index) {
    final viewMode = BudgetViewMode.values[index];
    context.read<BudgetBookCubit>().updateView(viewMode: viewMode);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<BudgetBookCubit, BudgetBookState>(
      listenWhen: (previous, current) {
        return previous.items != current.items;
      },
      listener: (context, state) {
        state.whenOrNull(
          loaded: (_, __, ___, ____) => _onLoaded(),
          error: (_, __, ___, ____, message) => _onError(message),
        );
      },
      builder: (context, state) {
        return Column(
          children: [
            _buildPeriodSelector(state.filter, state.dateRange),
            const SizedBox(height: 8),
            _buildNavbar(),
            const SizedBox(height: 8),
            _buildContent(state, state.viewMode),
          ],
        );
      },
    );
  }

  Widget _buildPeriodSelector(BudgetBookFilter filter, BudgetDateRange dateRange) {
    return PeriodSelector(
      filter: filter,
      dateRange: dateRange,
      pageController: _pageController,
    );
  }

  Widget _buildNavbar() {
    return ScrollableNavBar(
      onTabSelect: _onViewSelected,
      items: _viewModes,
    );
  }

  Widget _buildContent(BudgetBookState state, BudgetViewMode viewMode) {
    Widget content;

    // TODO display loading bar while loading list
    if (state.items.isNotEmpty) {
      switch (viewMode) {
        case BudgetViewMode.summary:
          content = _buildSummary(state.items);
          break;
        case BudgetViewMode.transaction:
          content = TransactionView();
          break;
        case BudgetViewMode.calendar:
          content = CalendarView();
          break;
      }
    } else {
      content = Center(child: Text("No data available.".tr()));
    }

    return Expanded(
      child: Stack(
        children: [content],
      ),
    );
  }

  Widget _buildSummary(List<SummaryViewData> summaries) {
    return PageView.builder(
      controller: _pageController,
      itemCount: summaries.length,
      onPageChanged: _onPageChanged,
      reverse: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = summaries.reversed.toList()[index];
        return SummaryView(data: item);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
