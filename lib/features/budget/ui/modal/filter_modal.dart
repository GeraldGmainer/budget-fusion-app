import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/shared.dart';
import '../../application/application.dart';
import '../../domain/domain.dart';

class FilterModal extends StatefulWidget {
  const FilterModal({
    super.key,
  });

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  final List<PeriodMode> _periods = [PeriodMode.all, PeriodMode.year, PeriodMode.month, PeriodMode.day];
  final List<TransactionType> _transactions = [TransactionType.income, TransactionType.outcome];
  final List<String> _accounts = ['All Accounts', 'Cash', 'Credit Card'];
  final TextEditingController _searchController = TextEditingController();

  PeriodMode _selectedPeriod = PeriodMode.month;
  TransactionType _selectedTransaction = TransactionType.outcome;
  String _selectedAccount = 'All Accounts';
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onTransactionChanged(TransactionType value) {
    setState(() {
      _selectedTransaction = value;
    });
  }

  void _onPeriodChanged(PeriodMode value) {
    setState(() {
      _selectedPeriod = value;
    });
  }

  void _onAccountChanged(String value) {
    setState(() {
      _selectedAccount = value;
    });
  }

  void _onSave(BuildContext context) {
    final newFilter = BudgetBookFilter(
      account: null,
      transaction: _selectedTransaction,
      period: _selectedPeriod,
    );

    final event = BookingPageEvent.updateView(filter: newFilter, viewMode: context.read<BookingPageBloc>().state.currentViewMode);
    context.read<BookingPageBloc>().add(event);
    Navigator.of(context).pop();
  }

  void _onCancel(BuildContext context) {
    Navigator.of(context).pop();
  }

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
          _buildSearchField(),
          const SizedBox(height: 16),
          _buildTransaction(),
          const SizedBox(height: 8),
          _buildPeriod(),
          const SizedBox(height: 8),
          _buildAccount(),
          const SizedBox(height: 16),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      style: TextStyle(fontSize: 14),
      decoration: InputDecoration(
        labelText: 'Search by description'.tr(),
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onChanged: (value) {
        setState(() {
          _searchQuery = value;
        });
      },
    );
  }

  Widget _buildTransaction() {
    return FilterChipGroup(
      title: 'Transaction',
      items: _transactions,
      selectedItem: _selectedTransaction,
      onItemSelected: _onTransactionChanged,
      valueToString: (value) => value.label.tr(),
    );
  }

  Widget _buildPeriod() {
    return FilterChipGroup(
      title: 'Period',
      items: _periods,
      selectedItem: _selectedPeriod,
      onItemSelected: _onPeriodChanged,
      valueToString: (value) => value.label.tr(),
    );
  }

  Widget _buildAccount() {
    return FilterChipGroup(
      title: 'Accounts',
      items: _accounts,
      selectedItem: _selectedAccount,
      onItemSelected: _onAccountChanged,
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => _onCancel(context),
          child: const Text('Cancel'),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () => _onSave(context),
          child: const Text('Save'),
        ),
      ],
    );
  }
}
