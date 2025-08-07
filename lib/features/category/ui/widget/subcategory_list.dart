import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../data_managers/category/category.dart';
import '../../domain/entities/category_draft.dart';

class SubcategoryList extends StatelessWidget {
  final CategoryDraft draft;
  final Function(Category subcategory) onTap;

  const SubcategoryList({super.key, required this.draft, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (draft.subcategories.isEmpty) {
      return Card(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16), child: Text('category.list.emptySubcategory'.tr())));
    }

    final subs = draft.subcategories;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 0),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: subs.length,
          separatorBuilder: (context, index) => const Divider(color: AppColors.disabledTextColor, thickness: 1),
          itemBuilder: (context, index) {
            final sub = subs[index];
            return ListTile(dense: true, title: Text(sub.name), leading: BudgetIcon(name: sub.iconName, color: sub.iconColor), onTap: () => onTap(sub));
          },
        ),
      ),
    );
  }
}
