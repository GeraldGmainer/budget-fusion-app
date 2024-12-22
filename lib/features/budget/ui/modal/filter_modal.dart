import 'package:budget_fusion_app/features/budget/ui/modal/widgets/account_filter.dart';
import 'package:budget_fusion_app/features/budget/ui/modal/widgets/description_filter.dart';
import 'package:budget_fusion_app/features/budget/ui/modal/widgets/period_filter.dart';
import 'package:budget_fusion_app/features/budget/ui/modal/widgets/transaction_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';
import '../../domain/domain.dart';

class FilterModal extends StatelessWidget {
  final BudgetBookFilter filter;

  const FilterModal({super.key, required this.filter});

  void _onSave(BuildContext context) {
    context.read<BookingPageBloc>().add(BookingPageEvent.updateView(filter: filter));
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
          DescriptionFilter(filter: filter),
          const SizedBox(height: 16),
          TransactionFilter(filter: filter),
          const SizedBox(height: 8),
          PeriodFilter(filter: filter),
          const SizedBox(height: 8),
          AccountFilter(filter: filter),
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
