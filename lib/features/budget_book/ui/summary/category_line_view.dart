import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/category_view_summary.dart';

class CategoryLineView extends StatelessWidget {
  final CategoryViewSummary summary;

  const CategoryLineView({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      visualDensity: VisualDensity(vertical: 0),
      leading: SizedBox(
        width: 36,
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: BudgetIcon(name: summary.iconName, color: summary.iconColor),
        ),
      ),
      title: Text(summary.categoryName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: summary.parentCategoryName == null
          ? null
          : Text(summary.parentCategoryName!, style: const TextStyle(fontSize: 14, color: AppColors.secondaryTextColor)),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CurrencyText(value: summary.value, currency: summary.currency, color: summary.categoryType.color),
          Text("${summary.percentage} %", textAlign: TextAlign.end, style: TextStyle(fontSize: 13, color: AppColors.secondaryTextColor)),
        ],
      ),
    );
  }
}
