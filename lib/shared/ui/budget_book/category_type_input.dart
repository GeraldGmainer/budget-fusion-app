import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CategoryTypeInput extends StatelessWidget {
  final CategoryType value;
  final Function(CategoryType categoryType) onChange;

  const CategoryTypeInput({super.key, required this.onChange, required this.value});

  _onTransactionTypeTap(BuildContext context) async {
    final CategoryType? selectedValue = await showSelectionBottomSheet<CategoryType>(
      context: context,
      // TODO translation
      title: "Category Type",
      items: [CategoryType.outcome, CategoryType.income],
      selectedItem: value,
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
      onChange.call(selectedValue);
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
          value.label.tr(),
          style: TextStyle(fontSize: 13, color: AppColors.primaryTextColor),
        ),
      ),
    );
  }
}
