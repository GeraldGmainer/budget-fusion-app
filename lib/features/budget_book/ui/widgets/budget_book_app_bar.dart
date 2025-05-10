import 'package:budget_fusion_app/shared/shared.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/budget_book_cubit.dart';
import 'budget_filter_button.dart';
import 'budget_tab_title.dart';

enum BudgetMenuAction { reload, settings }

class BudgetBookAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BudgetBookAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BudgetTabTitle(),
      leading: AppDrawerButton(),
      actions: [
        BudgetFilterButton(),
        PopupMenuButton<BudgetMenuAction>(
          icon: Icon(CommunityMaterialIcons.dots_vertical),
          onSelected: (action) {
            if (action == BudgetMenuAction.reload) {
              context.read<BudgetBookCubit>().resetAndLoad();
            }
          },
          itemBuilder: (ctx) {
            final isLoading = ctx.read<BudgetBookCubit>().state.isLoading;
            return [
              _buildReload(isLoading),
              PopupMenuItem<BudgetMenuAction>(
                value: BudgetMenuAction.settings,
                child: Text('Settings'),
              )
            ];
          },
        ),
      ],
    );
  }

  PopupMenuItem<BudgetMenuAction> _buildReload(bool isLoading) {
    return PopupMenuItem<BudgetMenuAction>(
      value: BudgetMenuAction.reload,
      enabled: !isLoading,
      child: Text('Reload Data'),
    );
  }
}
