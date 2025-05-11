import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/category_view_summary_data.dart';

class CategorySummaryList extends StatelessWidget {
  final List<CategoryViewSummaryData> summaries;

  const CategorySummaryList({super.key, required this.summaries});

  @override
  Widget build(BuildContext context) {
    return CustomCardWithAction(
      title: "Category Summary",
      onOptionTap: () {
        context.showComingSoon();
      },
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: summaries.length,
        itemBuilder: (BuildContext context, int index) {
          return CollapsibleCategoryTile(summary: summaries[index]);
        },
        separatorBuilder: (context, index) => const Divider(color: AppColors.disabledTextColor, thickness: 1),
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
  late final AnimationController _arrowController;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _arrowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _arrowController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    if (_isExpanded) {
      _arrowController.forward();
    } else {
      _arrowController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildParent(),
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

  Widget _buildParent() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      visualDensity: const VisualDensity(vertical: 0),
      leading: SizedBox(
        width: 40,
        child: BudgetIcon(name: widget.summary.iconName, color: widget.summary.iconColor),
      ),
      onTap: () {
        context.showComingSoon();
      },
      title: _buildParentTitle(),
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

  Widget _buildParentTitle() {
    final title = Text(widget.summary.categoryName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
    if (widget.summary.subSummaries.isEmpty) {
      return title;
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _toggleExpanded,
      child: title,
    );
  }

  Widget? _buildParentSubtitle() {
    final subs = widget.summary.subSummaries;
    if (subs.isEmpty) {
      return null;
    }
    final label = "${_isExpanded ? 'Hide' : 'Show'} ${subs.length} sub-categories";
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _toggleExpanded,
      child: Padding(
        padding: const EdgeInsets.all(8.0).copyWith(left: 0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            RotationTransition(
              turns: Tween(begin: 0.0, end: 0.5).animate(_arrowController),
              child: Icon(
                Icons.expand_more,
                size: 16,
                color: AppColors.secondaryTextColor,
              ),
            ),
            const SizedBox(width: 4),
            Text(label, style: TextStyle(fontSize: 13)),
          ],
        ),
      ),
    );
  }

  Widget _buildSub(CategoryViewSummaryData sub) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(vertical: -3),
      leading: Padding(
        padding: const EdgeInsets.only(left: 7.0),
        child: BudgetIcon(name: sub.iconName, color: sub.iconColor, size: 20),
      ),
      onTap: () {
        context.showComingSoon();
      },
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
}
