import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/category_view_summary_data.dart';

class CategorySummaryList extends StatelessWidget {
  final List<CategoryViewSummaryData> summaries;

  const CategorySummaryList({super.key, required this.summaries});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: summaries.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildRows(summaries[index]);
          },
          separatorBuilder: (context, index) => const Divider(color: AppColors.disabledTextColor, thickness: 1),
        ),
      ),
    );
  }

  Widget _buildRows(CategoryViewSummaryData parentSummary) {
    final parentRow = _buildParent(parentSummary);

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

  Widget _buildParent(CategoryViewSummaryData parentSummary) {
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
