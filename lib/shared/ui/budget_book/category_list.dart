import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

import 'category_icon.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;
  final CategoryType categoryType;
  final Function(Category category) onCategoryTap;
  final Category? selectedCategory;

  const CategoryList({
    required this.categories,
    required this.categoryType,
    required this.onCategoryTap,
    this.selectedCategory,
  });

  _createCategory(BuildContext context) {
    // TODO create category
    // Navigator.of(context).pushNamed(CategoryCrudPage.route, arguments: CategoryModel.empty(categoryType: categoryType));
  }

  @override
  Widget build(BuildContext context) {
    var trimmedList = [...categories];
    trimmedList.removeWhere((category) => category.categoryType != categoryType);

    return Wrap(
      runSpacing: CategoryIcon.verticalPadding,
      spacing: CategoryIcon.horizontalPadding,
      children: [
        for (int index = 0; index < trimmedList.length; index++)
          CategoryIcon(
            icon: IconConverter.getIcon(trimmedList[index].iconName),
            text: trimmedList[index].name,
            color: ColorConverter.stringToColor(trimmedList[index].iconColor),
            isSelected: selectedCategory == trimmedList[index],
            onTap: () {
              onCategoryTap.call(trimmedList[index]);
            },
          ),
        CategoryIcon(
          icon: CommunityMaterialIcons.plus,
          color: AppColors.accentColor,
          text: "New",
          onTap: () {
            _createCategory(context);
          },
        ),
      ],
    );
  }
}
