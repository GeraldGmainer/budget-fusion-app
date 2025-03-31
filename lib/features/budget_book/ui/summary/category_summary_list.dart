import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/category_view_summary_data.dart';

class CategorySummaryList extends StatelessWidget {
  final CategoryViewSummaryData parentSummary;

  const CategorySummaryList({super.key, required this.parentSummary});

  @override
  Widget build(BuildContext context) {
    final parentRow = _buildParent();

    if (parentSummary.subSummaries.isEmpty) {
      return parentRow;
    }

    final subcategoryRows = parentSummary.subSummaries.map((sub) => _buildSub(sub)).toList();

    return Column(
      children: [
        parentRow,
        ...subcategoryRows,
      ],
    );
  }

  Widget _buildParent() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      visualDensity: const VisualDensity(vertical: 0),
      leading: SizedBox(width: 40, child: BudgetIcon(name: parentSummary.iconName, color: parentSummary.iconColor)),
      title: Text(parentSummary.categoryName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CurrencyText(value: parentSummary.value, currency: parentSummary.currency, color: parentSummary.categoryType.color, fontSize: 15),
          Text("${parentSummary.percentage} %", textAlign: TextAlign.end, style: TextStyle(fontSize: 13, color: AppColors.secondaryTextColor)),
        ],
      ),
    );
  }

  Widget _buildSub(CategoryViewSummaryData sub) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SizedBox(
        width: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [BudgetIcon(name: sub.iconName, color: sub.iconColor, size: 20)],
        ),
      ),
      title: Text(sub.categoryName, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CurrencyText(value: sub.value, currency: sub.currency, color: sub.categoryType.color, fontSize: 14),
          Text("${sub.percentage} %", textAlign: TextAlign.end, style: TextStyle(fontSize: 12, color: AppColors.secondaryTextColor)),
        ],
      ),
    );
  }
}
