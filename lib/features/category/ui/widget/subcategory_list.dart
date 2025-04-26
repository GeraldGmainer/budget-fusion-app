import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SubcategoryList extends StatelessWidget {
  final Category category;
  final Function(Category subcategory) onTap;

  const SubcategoryList({super.key, required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (category.subcategories.isEmpty) {
      return Text('No subcategories'.tr());
    }

    final subs = category.subcategories;
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
            return ListTile(
              dense: true,
              title: Text(sub.name),
              leading: BudgetIcon(name: sub.iconName, color: sub.iconColor),
              onTap: () {
                onTap(sub);
              },
            );
          },
        ),
      ),
    );
  }
}
