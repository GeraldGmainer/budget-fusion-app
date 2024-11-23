import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';

class FilterModal extends StatelessWidget {
  final List<String> transactions;
  final String selectedTransaction;
  final ValueChanged<String> onTransactionSelected;
  final List<String> accounts;
  final String selectedAccount;
  final ValueChanged<String> onAccountSelected;
  final List<String> periods;
  final String selectedPeriod;
  final ValueChanged<String> onPeriodSelected;

  const FilterModal({
    super.key,
    required this.periods,
    required this.selectedPeriod,
    required this.onPeriodSelected,
    required this.transactions,
    required this.selectedTransaction,
    required this.onTransactionSelected,
    required this.accounts,
    required this.selectedAccount,
    required this.onAccountSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Filters', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          FilterChipGroup(
            title: 'Transaction',
            items: transactions,
            selectedItem: selectedTransaction,
            onItemSelected: onTransactionSelected,
          ),
          const SizedBox(height: 8),
          FilterChipGroup(
            title: 'Period',
            items: periods,
            selectedItem: selectedPeriod,
            onItemSelected: onPeriodSelected,
          ),
          const SizedBox(height: 8),
          FilterChipGroup(
            title: 'Accounts',
            items: accounts,
            selectedItem: selectedAccount,
            onItemSelected: onAccountSelected,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
