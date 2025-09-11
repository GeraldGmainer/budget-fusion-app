import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CategoryTypeInput extends StatelessWidget {
  final CategoryType value;
  final Function(CategoryType categoryType) onChange;
  final bool disabled;

  const CategoryTypeInput({super.key, required this.onChange, required this.value, this.disabled = false});

  Future<void> _onTransactionTypeTap(BuildContext context) async {
    final CategoryType? selectedValue = await showSelectionBottomSheet<CategoryType>(
      context: context,
      title: "booking.fields.type".tr(),
      items: [CategoryType.outcome, CategoryType.income],
      selectedItem: value,
      iconBuilder: (categoryType) => Icon(categoryType.icon, color: categoryType.color, size: 20),
      labelBuilder: (categoryType) => Text(categoryType.label.tr()),
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
      decoration: InputDecoration(labelText: 'booking.fields.type'.tr(), labelStyle: labelStyle, suffixIcon: Icon(Icons.arrow_right, color: iconColor)),
      child: Text(value.label.tr(), style: textStyle),
    );

    if (disabled) {
      return input;
    }

    return InkWell(onTap: () => _onTransactionTypeTap(context), borderRadius: BorderRadius.circular(4), child: input);
  }
}
