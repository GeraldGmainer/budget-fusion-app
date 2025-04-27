import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/budget_book_cubit.dart';
import '../../domain/entities/budget_book_filter.dart';
import 'account_filter.dart';
import 'description_filter.dart';
import 'period_filter.dart';
import 'transaction_filter.dart';

class FilterModal extends StatefulWidget {
  final BudgetBookFilter filter;

  const FilterModal({super.key, required this.filter});

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  late final BudgetBookFilter _filter;

  @override
  void initState() {
    super.initState();
    _filter = widget.filter;
  }

  void _onSave(BuildContext context) {
    context.read<BudgetBookCubit>().updateView(filter: _filter);
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
          DescriptionFilter(filter: _filter),
          const SizedBox(height: 16),
          TransactionFilter(filter: _filter),
          const SizedBox(height: 8),
          PeriodFilter(filter: _filter),
          const SizedBox(height: 8),
          AccountFilter(filter: _filter),
          const SizedBox(height: 16),
          _buildButtons(context),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
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
