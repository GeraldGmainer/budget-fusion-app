import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../repos/category/category.dart';
import '../../domain/entities/booking_draft.dart';
import 'category_list_input.dart';

class CategorySelectInput extends StatelessWidget {
  final BookingDraft draft;
  final Function(Category category) onChange;
  final bool hasError;

  const CategorySelectInput({required this.draft, required this.onChange, required this.hasError});

  void _onCategoryTap(BuildContext context, Category category) {
    onChange.call(category);
    Navigator.of(context).pop();
  }

  void _openCategoryPicker(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (sheetCtx) {
        return CategoryListInput(
          categoryType: draft.categoryType,
          onCategoryTap: (category) => _onCategoryTap(context, category),
          selectedCategory: draft.category,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasValue = draft.category != null;
    return ListTile(
      leading: hasValue
          ? BudgetIcon(name: draft.category!.iconName, color: draft.category!.iconColor)
          : Icon(CommunityMaterialIcons.table_large, color: Theme.of(context).hintColor),
      title: Text(hasValue ? draft.category!.name : "booking.fields.category".tr(), style: hasValue ? null : TextStyle(color: Theme.of(context).hintColor)),
      subtitle: hasValue
          ? Text("booking.fields.category".tr())
          : hasError
          ? Text("shared.validation.required".tr(), style: TextStyle(color: AppColors.validationErrorColor))
          : null,
      trailing: Icon(CommunityMaterialIcons.chevron_right),
      onTap: () => _openCategoryPicker(context),
      // onTap: onTap,
    );
  }
}
