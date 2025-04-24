import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/budget_book_cubit.dart';

class RefreshButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BudgetBookCubit, BudgetBookState>(
      builder: (context, state) {
        final isLoading = state.isLoading;
        return IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: isLoading
              ? null
              : () {
                  context.read<BudgetBookCubit>().resetAndLoad();
                },
          tooltip: isLoading ? 'Refreshing...' : 'Refresh',
        );
      },
    );
  }
}
