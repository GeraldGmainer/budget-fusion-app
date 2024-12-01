import 'package:budget_fusion_app/features/budget/ui/actions/actions.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';
import '../../domain/domain.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

class BudgetTab extends StatefulWidget {
  @override
  State<BudgetTab> createState() => _BudgetTabState();
}

class _BudgetTabState extends State<BudgetTab> with AutomaticKeepAliveClientMixin {
  final Map<int, Widget Function()> _navigationViews = {
    0: () => SummaryTab(),
    1: () => TransactionsTab(),
    2: () => BalancesTab(),
    3: () => CalendarTab(),
  };
  final List<String> _navItems = ['Summary', 'Transactions', 'Balances', 'Calendar'];
  late PageController _pageController;
  String _selectedAccount = 'All Accounts';
  String _selectedTransaction = 'Outcome';
  String _selectedPeriod = 'Month';
  int _selectedNavIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedNavIndex);
    _load();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _load() {
    // TODO use filter
    final filter = BudgetBookFilter(transaction: TransactionType.outcome, period: PeriodMode.month);
    context.read<BookingPageBloc>().add(BookingPageEvent.loadInitial(filter));
  }

  void _onTabSelected(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
    _onPageChanged(index);
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: BudgetTabTitle(transaction: _selectedTransaction, account: _selectedAccount, period: _selectedPeriod),
        actions: [BookingFilterButton()],
      ),
      body: Column(
        children: [
          PeriodSelector(),
          ScrollableNavBar(
            onTabSelect: _onTabSelected,
            items: _navItems,
            selectedIndex: _selectedNavIndex,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _navigationViews.length,
                  itemBuilder: (context, index) {
                    return _navigationViews[index]?.call() ?? const Center(child: Text('Unknown View'));
                  },
                ),
                BlocBuilder<BookingPageBloc, BookingPageState>(
                  builder: (context, bookingState) {
                    final isInitialLoading = bookingState.maybeWhen(
                      loading: (_, isFirstFetch) => isFirstFetch,
                      orElse: () => false,
                    );

                    final isPaginationLoading = bookingState.maybeWhen(
                      loading: (_, isFirstFetch) => !isFirstFetch,
                      orElse: () => false,
                    );

                    return Stack(
                      children: [
                        if (isInitialLoading)
                          Positioned.fill(
                            child: Container(
                              color: Colors.black.withOpacity(0.1),
                              child: Center(child: CircularProgressIndicator()),
                            ),
                          ),
                        // Pagination Loading Indicator
                        if (isPaginationLoading)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 4.0,
                              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.grey.shade300,
                                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
