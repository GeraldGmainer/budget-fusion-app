import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/budget_book_cubit.dart';

class BudgetBookReloader extends StatelessWidget {
  final Widget child;

  const BudgetBookReloader({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(onRefresh: () => context.read<BudgetBookCubit>().resetAndLoad(), child: child);
  }
}
