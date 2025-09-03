import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/budget_book_cubit.dart';
import 'budget_filter_button.dart';
import 'budget_tab_title.dart';

enum BudgetMenuAction { settings }

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
            if (action == BudgetMenuAction.settings) {
              context.showComingSoon();
            }
          },
          itemBuilder: (ctx) {
            return [
              PopupMenuItem<BudgetMenuAction>(value: BudgetMenuAction.settings, child: Text('shared.button.settings'.tr())),
            ];
          },
        ),
      ],
    );
  }
}
