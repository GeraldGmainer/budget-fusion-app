import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CategoryTypeInput extends StatelessWidget {
  final CategoryType value;
  final Function(CategoryType categoryType) onChange;
  final bool disabled;

  const CategoryTypeInput({
    super.key,
    required this.onChange,
    required this.value,
    this.disabled = false,
  });

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
    final labelStyle = TextStyle(fontSize: 12, color: disabled ? AppColors.disabledTextColor : AppColors.secondaryTextColor);
    final textStyle = TextStyle(fontSize: 13, color: disabled ? AppColors.disabledTextColor : AppColors.primaryTextColor);
    final iconColor = disabled ? AppColors.disabledTextColor : Theme.of(context).iconTheme.color;

    final input = InputDecorator(
      decoration: InputDecoration(
        labelText: 'category_type'.tr(),
        labelStyle: labelStyle,
        suffixIcon: Icon(Icons.arrow_drop_down, color: iconColor),
      ),
      child: Text(value.label.tr(), style: textStyle),
    );

    if (disabled) {
      return input;
    }

    return InkWell(
      onTap: () => _onTransactionTypeTap(context),
      borderRadius: BorderRadius.circular(4),
      child: input,
    );
  }
}
