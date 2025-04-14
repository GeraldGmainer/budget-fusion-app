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
          physics: const NeverScrollableScrollPhysics(),
          itemCount: summaries.length,
          itemBuilder: (BuildContext context, int index) {
            return CollapsibleCategoryTile(summary: summaries[index]);
          },
          separatorBuilder: (context, index) => const Divider(color: AppColors.disabledTextColor, thickness: 1),
        ),
      ),
    );
  }
}

class CollapsibleCategoryTile extends StatefulWidget {
  final CategoryViewSummaryData summary;

  const CollapsibleCategoryTile({super.key, required this.summary});

  @override
  State<CollapsibleCategoryTile> createState() => _CollapsibleCategoryTileState();
}

class _CollapsibleCategoryTileState extends State<CollapsibleCategoryTile> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  Widget _buildParent() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      visualDensity: const VisualDensity(vertical: 0),
      leading: SizedBox(
        width: 40,
        child: BudgetIcon(name: widget.summary.iconName, color: widget.summary.iconColor),
      ),
      title: Text(widget.summary.categoryName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: _buildParentSubtitle(),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CurrencyText(
            value: widget.summary.value,
            currency: widget.summary.currency,
            color: widget.summary.categoryType.color,
            fontSize: 15,
          ),
          Text(
            "${widget.summary.percentage} %",
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 13, color: AppColors.secondaryTextColor),
          ),
        ],
      ),
    );
  }

  Widget? _buildParentSubtitle() {
    if (widget.summary.subSummaries.isEmpty) {
      return null;
    }
    return Text("${widget.summary.subSummaries.length} sub-categories");
  }

  Widget _buildSub(CategoryViewSummaryData sub) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: BudgetIcon(name: sub.iconName, color: sub.iconColor, size: 20),
      ),
      title: Text(sub.categoryName, style: const TextStyle(fontSize: 15)),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CurrencyText(
            value: sub.value,
            currency: sub.currency,
            color: sub.categoryType.color,
            fontSize: 14,
          ),
          Text(
            "${sub.percentage} %",
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 12, color: AppColors.secondaryTextColor),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _toggleExpanded,
          child: _buildParent(),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: _isExpanded && widget.summary.subSummaries.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    children: widget.summary.subSummaries.map((sub) => _buildSub(sub)).toList(),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
