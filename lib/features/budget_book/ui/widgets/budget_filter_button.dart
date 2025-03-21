import 'package:budget_fusion_app/features/budget_book/application/budget_book/cubits/budget_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modal/filter_modal.dart';

class BudgetFilterButton extends StatelessWidget {
  void _showFilterDialog(BuildContext context) {
    final filter = context.read<BudgetBookCubit>().state.currentFilter;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (BuildContext context) {
        return FilterModal(filter: filter);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.filter_list),
      onPressed: () {
        _showFilterDialog(context);
      },
    );
  }
}
