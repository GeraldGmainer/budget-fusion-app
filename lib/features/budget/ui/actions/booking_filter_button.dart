import 'package:flutter/material.dart';

import '../modal/filter_modal.dart';

class BookingFilterButton extends StatelessWidget {
  final List<String> _periods = ['Today', 'Week', 'Month', 'All'];
  final List<String> _transactions = ['Income', 'Outcome'];
  final List<String> _accounts = ['All Accounts', 'Cash', 'Credit Card'];
  final String _selectedAccount = 'All Accounts';
  final String _selectedTransaction = 'Outcome';
  final String _selectedPeriod = 'Month';

  void _onPeriodSelected(String period) {}

  void _onTransactionSelected(String transaction) {}

  void _onAccountSelected(String account) {}

  void _showFilters(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.filter_list),
      onPressed: () {
        _showFilters(context);
      },
    );
  }
}
