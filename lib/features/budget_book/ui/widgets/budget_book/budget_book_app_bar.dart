import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/application.dart';
import '../../../domain/domain.dart';
import '../../ui.dart';
import 'budget_tab_title.dart';

class BudgetBookAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BudgetBookAppBar({super.key});

  void _load(BuildContext context, BudgetBookFilter currentFilter, BookingViewMode currentViewMode) {
    context.read<BookingPageBloc>().add(BookingPageEvent.loadInitial(currentFilter, currentViewMode));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingPageBloc, BookingPageState>(
      builder: (context, state) {
        final currentFilter = state.currentFilter;
        final currentViewMode = state.currentViewMode;
        return AppBar(
          title: BudgetTabTitle(filter: currentFilter),
          leading: AppDrawerButton(),
          actions: [
            RefreshButton(onTap: () {
              _load(context, currentFilter, currentViewMode);
            }),
            BookingFilterButton(filter: currentFilter),
          ],
        );
      },
    );
  }
}
