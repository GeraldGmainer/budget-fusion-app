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

    List<Category> standalone = [];
    Map<Category, List<Category>> grouped = {};

    for (var category in trimmedList) {
      if (category.parent != null) {
        grouped[category.parent!] = [...(grouped[category.parent!] ?? []), category];
      } else {
        standalone.add(category);
      }
    }
    standalone.removeWhere((cat) => grouped.containsKey(cat));

    var groupedEntries = grouped.entries.toList();
    groupedEntries.sort((a, b) => a.key.name.compareTo(b.key.name));
    for (var entry in groupedEntries) {
      entry.value.sort((a, b) => a.name.compareTo(b.name));
    }
    standalone.sort((a, b) => a.name.compareTo(b.name));

    List<Widget> widgets = [];
    for (int i = 0; i < groupedEntries.length; i++) {
      var entry = groupedEntries[i];
      widgets.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(entry.key.name, style: Theme.of(context).textTheme.bodyMedium),
      ));
      widgets.add(Wrap(
        runSpacing: CategoryIcon.verticalPadding,
        spacing: CategoryIcon.horizontalPadding,
        children: entry.value
            .map((category) => CategoryIcon(
                  icon: IconConverter.getIcon(category.iconName),
                  text: category.name,
                  color: ColorConverter.stringToColor(category.iconColor),
                  isSelected: selectedCategory == category,
                  onTap: () => onCategoryTap(category),
                ))
            .toList(),
      ));
      if (i < groupedEntries.length - 1) {
        widgets.add(const Divider());
      }
    }
    if (standalone.isNotEmpty) {
      widgets.add(const Divider());
    }
    List<Widget> standaloneWidgets = standalone
        .map((category) => CategoryIcon(
              icon: IconConverter.getIcon(category.iconName),
              text: category.name,
              color: ColorConverter.stringToColor(category.iconColor),
              isSelected: selectedCategory == category,
              onTap: () => onCategoryTap(category),
            ))
        .toList();

    standaloneWidgets.add(CategoryIcon(
      icon: CommunityMaterialIcons.plus,
      color: AppColors.accentColor,
      text: "New",
      onTap: () => _createCategory(context),
    ));

    widgets.add(Wrap(
      runSpacing: CategoryIcon.verticalPadding,
      spacing: CategoryIcon.horizontalPadding,
      children: standaloneWidgets,
    ));

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets,
      ),
    );
  }
}
