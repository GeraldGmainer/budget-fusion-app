import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/budget_book/cubits/budget_book_cubit.dart';
import '../../domain/entities/budget_book_filter.dart';
import '../../domain/enums/budget_view_mode.dart';
import 'budget_filter_button.dart';
import 'budget_tab_title.dart';
import 'refresh_button.dart';

class BudgetBookAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BudgetBookAppBar({super.key});

  void _load(BuildContext context, BudgetBookFilter currentFilter, BudgetViewMode currentViewMode) {
    context.read<BudgetBookCubit>().load(currentFilter, currentViewMode);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BudgetBookCubit, BudgetBookState>(
      builder: (context, state) {
        final currentFilter = state.currentFilter;
        return AppBar(
          title: BudgetTabTitle(filter: currentFilter),
          leading: AppDrawerButton(),
          actions: [
            RefreshButton(onTap: () {
              _load(context, currentFilter, state.currentViewMode);
            }),
            BudgetFilterButton(),
          ],
        );
      },
    );
  }
}
