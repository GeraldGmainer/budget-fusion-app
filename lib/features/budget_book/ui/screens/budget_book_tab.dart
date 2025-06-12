import 'package:budget_fusion_app/core/constants/app_colors.dart';
import 'package:budget_fusion_app/core/exceptions/app_error.dart';
import 'package:budget_fusion_app/features/budget_book/view_models/base/budget_view_data.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/budget_book_cubit.dart';
import '../../enums/budget_view_mode.dart';
import '../../view_models/budget_date_range.dart';
import '../../view_models/summary_view_data.dart';
import '../../view_models/transaction_view_data.dart';
import '../calendar/calendar_view.dart';
import '../summary/summary_view.dart';
import '../transaction/transaction_view.dart';
import '../widgets/period_selector.dart';

class BudgetBookTab extends StatefulWidget {
  @override
  State<BudgetBookTab> createState() => _BudgetBookTabState();
}

class _BudgetBookTabState extends State<BudgetBookTab> with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late final TabController _budgetViewTabController;
  final PageController _contentPageController = PageController();
  late BudgetDateRange _currentDateRange;

  @override
  void initState() {
    super.initState();
    _initPagination();
    _budgetViewTabController = TabController(length: BudgetViewMode.values.length, vsync: this, initialIndex: context.read<BudgetBookCubit>().state.viewMode.index)
      ..addListener(() {
        if (_budgetViewTabController.indexIsChanging) {
          final vm = BudgetViewMode.values[_budgetViewTabController.index];
          context.read<BudgetBookCubit>().updateView(viewMode: vm, loadTabWithIndex: _contentPageController.page?.toInt());
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
    _budgetViewTabController.dispose();
    _contentPageController.dispose();
    super.dispose();
  }

  void _onLoaded(int? loadTabWithIndex) {
    if (loadTabWithIndex == null) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_contentPageController.hasClients) {
        _contentPageController.animateToPage(loadTabWithIndex, duration: const Duration(milliseconds: 300), curve: Curves.linear);
        _onContentPageChanged(loadTabWithIndex);
      }
    });
  }

  void _onError(AppError error) => context.showErrorSnackBar(error);

  void _onContentPageChanged(int pageIndex) {
    final items = context.read<BudgetBookCubit>().state.items;
    if (items.isNotEmpty) {
      final reversedIndex = items.length - 1 - pageIndex;
      setState(() {
        _currentDateRange = items[reversedIndex].dateRange;
      });
    } else {
      BudgetLogger.instance.w('budget book items are empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<BudgetBookCubit, BudgetBookState>(
      listenWhen: (prev, curr) => prev.items != curr.items,
      listener: (context, state) {
        state.whenOrNull(loaded: (_, __, ___, ____, loadTabWithIndex) => _onLoaded(loadTabWithIndex), error: (_, __, ___, ____, error) => _onError(error));
      },
      builder: (context, state) {
        if (state.maybeWhen(initial: (_, __, ___, ____) => true, orElse: () => false)) {
          return Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            PeriodSelector(filter: state.filter, dateRange: _currentDateRange, pageController: _contentPageController),
            Material(
              color: AppColors.primaryColor,
              child: TabBar(
                controller: _budgetViewTabController,
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                tabs: BudgetViewMode.values.map((vm) => Tab(text: vm.label.tr())).toList(),
              ),
            ),
            Expanded(child: _buildBody(state)),
          ],
        );
      },
    );
  }

  Widget _buildBody(BudgetBookState state) {
    if (state.isLoading) return Center(child: CircularProgressIndicator());
    if (state.items.isEmpty) return Center(child: Text('budgetBook.tabs.empty'.tr()));

    final List<BudgetViewData> items = state.items.reversed.toList();

    return PageView.builder(
      controller: _contentPageController,
      itemCount: items.length,
      onPageChanged: _onContentPageChanged,
      reverse: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (ctx, i) {
        return RepaintBoundary(child: _buildContent(state.viewMode, items[i]));
      },
    );
  }

  Widget _buildContent(BudgetViewMode viewMode, BudgetViewData item) {
    return switch (viewMode) {
      BudgetViewMode.summary => SummaryView(data: item as SummaryViewData),
      BudgetViewMode.transaction => TransactionView(data: item as TransactionViewData),
      BudgetViewMode.calendar => CalendarView(),
    };
  }

  @override
  bool get wantKeepAlive => true;
}
