import 'package:budget_fusion_app/core/constants/app_colors.dart';
import 'package:budget_fusion_app/core/exceptions/app_error.dart';
import 'package:budget_fusion_app/features/budget_book/view_models/base/budget_view_data.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/budget_book_cubit.dart';
import '../../enums/budget_view_mode.dart';
import '../../view_models/summary_view_data.dart';
import '../../view_models/transaction_view_data.dart';
import '../summary/summary_view.dart';
import '../transaction/transaction_view.dart';
import '../widgets/budget_book_app_bar.dart';
import '../widgets/period_selector.dart';

class BudgetBookTab extends StatefulWidget {
  @override
  State<BudgetBookTab> createState() => _BudgetBookTabState();
}

class _BudgetBookTabState extends State<BudgetBookTab> with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late final TabController _budgetViewTabController;
  late final PageController _contentPageController;

  @override
  void initState() {
    super.initState();
    _contentPageController = PageController();
    _budgetViewTabController = TabController(length: BudgetViewMode.values.length, vsync: this, initialIndex: context.read<BudgetBookCubit>().state.viewMode.index)
      ..addListener(() {
        if (_budgetViewTabController.indexIsChanging) {
          final viewMode = BudgetViewMode.values[_budgetViewTabController.index];
          context.read<BudgetBookCubit>().updateView(viewMode: viewMode);
        }
      });

    _handleSelectedRangeChange(context.read<BudgetBookCubit>().state);
  }

  @override
  void dispose() {
    _budgetViewTabController.dispose();
    _contentPageController.dispose();
    super.dispose();
  }

  void _handleError(AppError error) => context.showErrorSnackBar(error);

  void _handleSelectedRangeChange(BudgetBookState state) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final idx = state.items.indexWhere((e) => e.dateRange == state.dateRange);
      if (idx == -1) {
        BudgetLogger.instance.d("index -1 ${state.dateRange}");
        return;
      }
      final targetPage = state.items.length - 1 - idx;
      if (!_contentPageController.hasClients) {
        BudgetLogger.instance.d("_contentPageController no clients");
        return;
      }
      final current = _contentPageController.page ?? _contentPageController.initialPage.toDouble();
      if (current.round() == targetPage) return;
      _contentPageController.jumpToPage(targetPage);
    });
  }

  void _onContentPageChanged(int pageIndex) {
    final items = context.read<BudgetBookCubit>().state.items;
    if (items.isEmpty) return;
    final reversedIndex = items.length - 1 - pageIndex;
    context.read<BudgetBookCubit>().setDateRange(items[reversedIndex].dateRange);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        BudgetBookAppBar(),
        Expanded(
          child: BlocConsumer<BudgetBookCubit, BudgetBookState>(
            listener: (context, state) {
              state.whenOrNull(error: (_, _, _, _, error) => _handleError(error));
              state.whenOrNull(
                loaded: (_, _, _, _, isInitial) {
                  if (isInitial) {
                    _handleSelectedRangeChange(state);
                  }
                },
              );
            },
            builder: (context, state) {
              final isInitial = state.maybeWhen(initial: (_, _, _, _) => true, orElse: () => false);
              if (isInitial) return Center(child: CircularProgressIndicator());
              return Column(
                children: [
                  PeriodSelector(pageController: _contentPageController),
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
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BudgetBookState state) {
    if (state.items.isEmpty) return Center(child: Text('budgetBook.tabs.empty'.tr()));
    final items = state.items.reversed.toList();
    return PageView.builder(
      controller: _contentPageController,
      itemCount: items.length,
      onPageChanged: _onContentPageChanged,
      reverse: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (ctx, i) => RepaintBoundary(child: _buildContent(state.viewMode, items[i])),
    );
  }

  Widget _buildContent(BudgetViewMode viewMode, BudgetViewData item) {
    return switch (viewMode) {
      BudgetViewMode.summary => SummaryView(data: item as SummaryViewData),
      BudgetViewMode.transaction => TransactionView(data: item as TransactionViewData),
      // BudgetViewMode.calendar => CalendarView(),
    };
  }

  @override
  bool get wantKeepAlive => true;
}
