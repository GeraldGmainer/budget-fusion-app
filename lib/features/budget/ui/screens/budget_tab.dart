import 'dart:async';

import 'package:budget_fusion_app/features/budget/ui/actions/actions.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/logging/logger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/application.dart';
import '../../domain/domain.dart';
import '../controllers/page_controllers.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

class BudgetTab extends StatefulWidget {
  @override
  State<BudgetTab> createState() => _BudgetTabState();
}

// TODO how to calculate date label in period selector
class _BudgetTabState extends State<BudgetTab> with AutomaticKeepAliveClientMixin {
  final Map<int, Widget Function()> _navigationViews = {
    0: () => SummaryTab(),
    1: () => TransactionsTab(),
    2: () => BalancesTab(),
    3: () => CalendarTab(),
  };
  final List<String> _navItems = ['Summary', 'Transactions', 'Balances', 'Calendar'];
  late final PageControllers _pageControllers;
  final BudgetBookFilter _filter = BudgetBookFilter.initial();
  late BookingDateRange _currentDateRange;
  int _selectedNavIndex = 0;
  StreamSubscription<BookingPageViewData>? _subscription;

  @override
  void initState() {
    super.initState();
    _currentDateRange = BookingDateRange(period: _filter.period, from: DateTime.now(), to: DateTime.now());
    _pageControllers = PageControllers(
      viewModeController: PageController(initialPage: _selectedNavIndex),
      periodController: PageController(),
    );
    _load();
    _subscription = _pageControllers.stream.listen((data) {
      _updateDateRange(data);
    });
  }

  @override
  void dispose() {
    _pageControllers.dispose();
    _subscription?.cancel();
    super.dispose();
  }

  void _load() {
    final viewMode = BookingViewMode.values[_selectedNavIndex];
    context.read<BookingPageBloc>().add(BookingPageEvent.loadInitial(_filter, viewMode));
  }

  void _onTabSelected(int index) {
    _pageControllers.viewModeController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
    _onViewPageChanged(index);
  }

  void _onViewPageChanged(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  void _updateDateRange(BookingPageViewData data) {
    setState(() {
      _currentDateRange = data.dateRange;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Provider<PageControllers>(
      create: (_) => _pageControllers,
      dispose: (_, controllers) => controllers.dispose(),
      child: Scaffold(
        appBar: AppBar(
          title: BudgetTabTitle(filter: _filter),
          actions: [
            RefreshButton(onTap: () => _load()),
            BookingFilterButton(filter: _filter),
          ],
        ),
        body: Column(
          children: [
            PeriodSelector(filter: _filter, dateRange: _currentDateRange, paginatedController: _pageControllers.periodController),
            ScrollableNavBar(
              onTabSelect: _onTabSelected,
              items: _navItems,
              selectedIndex: _selectedNavIndex,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: PageView.builder(
                controller: _pageControllers.viewModeController,
                onPageChanged: _onViewPageChanged,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _navigationViews.length,
                itemBuilder: (context, index) {
                  return _navigationViews[index]?.call() ?? const Center(child: Text('Unknown View'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
