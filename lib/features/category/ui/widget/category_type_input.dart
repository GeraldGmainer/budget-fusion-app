// TODO common widget
import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/category_draft.dart';

class CategoryTypeInput extends StatelessWidget {
  final CategoryDraft draft;
  final Function(CategoryType categoryType) onCategoryTypeChange;

  const CategoryTypeInput({super.key, required this.draft, required this.onCategoryTypeChange});

  _onTransactionTypeTap(BuildContext context) async {
    final CategoryType? selectedValue = await showSelectionBottomSheet<CategoryType>(
      context: context,
      title: "booking.select_transaction_type",
      items: [CategoryType.outcome, CategoryType.income],
      selectedItem: draft.categoryType,
      itemLabelBuilder: (categoryType) {
        return Row(
          children: [
            SizedBox(width: 45, child: Icon(categoryType.icon, color: categoryType.color)),
            Text(categoryType.label.tr()),
          ],
        );
      },
    );

    if (context.mounted && selectedValue != null) {
      onCategoryTypeChange(selectedValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTransactionTypeTap(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: "Category Type",
          labelStyle: TextStyle(fontSize: 12, color: AppColors.secondaryTextColor),
          suffixIcon: Icon(Icons.arrow_drop_down),
        ),
        child: Text(
          draft.categoryType.label.tr(),
          style: TextStyle(fontSize: 13, color: AppColors.primaryTextColor),
        ),
      ),
    );
  }
}
