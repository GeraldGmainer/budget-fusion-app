import 'package:budget_fusion_app/features/budget/ui/actions/actions.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';
import '../../domain/domain.dart';
import '../modal/modal.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

class BudgetTab extends StatefulWidget {
  @override
  State<BudgetTab> createState() => _BudgetTabState();
}

class _BudgetTabState extends State<BudgetTab> {
  final Map<int, Widget Function()> _navigationViews = {
    0: () => SummaryTab(),
    1: () => TransactionsTab(),
    2: () => BalancesTab(),
    3: () => CalendarTab(),
  };
  final List<String> _periods = ['Today', 'Week', 'Month', 'All'];
  final List<String> _navItems = ['Summary', 'Transactions', 'Balances', 'Calendar'];
  final List<String> _transactions = ['Income', 'Outcome'];
  final List<String> _accounts = ['All Accounts', 'Cash', 'Credit Card'];
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
    context.read<BookingPeriodBloc>().add(BookingPeriodEvent.load(PeriodMode.month));
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
    _dispatchLoadToViewBloc(index);
  }

  void _onPeriodSelected(String period) {
    setState(() {
      _selectedPeriod = period;
    });
  }

  void _onTransactionSelected(String transaction) {
    setState(() {
      _selectedTransaction = transaction;
    });
  }

  void _onAccountSelected(String account) {
    setState(() {
      _selectedAccount = account;
    });
  }

  void _showFilters() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return FilterModal(
          transactions: _transactions,
          selectedTransaction: _selectedTransaction,
          onTransactionSelected: _onTransactionSelected,
          accounts: _accounts,
          selectedAccount: _selectedAccount,
          onAccountSelected: _onAccountSelected,
          periods: _periods,
          selectedPeriod: _selectedPeriod,
          onPeriodSelected: _onPeriodSelected,
        );
      },
    );
  }

  void _dispatchLoadToViewBloc(int index) {
    final bookingPeriodState = context.read<BookingPeriodBloc>().state;

    bookingPeriodState.whenOrNull(
      loaded: (periods) {
        switch (index) {
          case 0:
            context.read<SummaryBloc>().add(SummaryEvent.load(periods));
            break;
          case 1:
            context.read<TransactionsBloc>().add(TransactionsEvent.load(periods));
            break;
          case 2:
            context.read<BalancesBloc>().add(BalancesEvent.load(periods));
            break;
          case 3:
            context.read<CalendarBloc>().add(CalendarEvent.load(periods));
            break;
          default:
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingPeriodBloc, BookingPeriodState>(
      listener: (context, state) {
        state.whenOrNull(
          loaded: (periods) {
            _dispatchLoadToViewBloc(_selectedNavIndex);
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Budget Book',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '$_selectedTransaction for ${_selectedAccount == 'all accounts' ? 'All Accounts' : _selectedAccount} - $_selectedPeriod',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          actions: [
            RefreshButton(),
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: _showFilters,
            ),
          ],
        ),
        body: Column(
          children: [
            ScrollableNavBar(
              onTabSelect: _onTabSelected,
              items: _navItems,
              selectedIndex: _selectedNavIndex,
            ),
            const SizedBox(height: 8),
            PeriodSelector(),
            const SizedBox(height: 8),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
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
}
