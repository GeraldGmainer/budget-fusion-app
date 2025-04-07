import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

import 'category_icon.dart';

class CategoryList extends StatefulWidget {
  final List<Category> categories;
  final CategoryType categoryType;
  final Function(Category category) onCategoryTap;
  final Category? selectedCategory;

  const CategoryList({
    super.key,
    required this.categories,
    required this.categoryType,
    required this.onCategoryTap,
    this.selectedCategory,
  });

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  Category? selectedParent;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _createCategory(BuildContext context) {
    // TODO create category
    // Navigator.of(context).pushNamed(CategoryCrudPage.route, arguments: CategoryModel.empty(categoryType: widget.categoryType));
  }

  Widget _buildIconGrid(List<Widget> icons) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const int numColumns = 4;
        const double spacing = 8.0;
        const double totalSpacing = spacing * (numColumns - 1);
        final double itemWidth = (constraints.maxWidth - totalSpacing) / numColumns;
        List<Widget> rows = [];
        for (int i = 0; i < icons.length; i += numColumns) {
          final List<Widget> rowIcons = List<Widget>.from(
            icons.sublist(i, i + numColumns > icons.length ? icons.length : i + numColumns),
          );
          if (rowIcons.length < numColumns) {
            int missing = numColumns - rowIcons.length;
            rowIcons.addAll(
              List.generate(missing, (_) => SizedBox(width: itemWidth)),
            );
          }
          rows.add(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: rowIcons.map((icon) => SizedBox(width: itemWidth, child: icon)).toList(),
            ),
          );
          if (i + numColumns < icons.length) {
            rows.add(const SizedBox(height: spacing));
          }
        }
        return Column(children: rows);
      },
    );
  }

  Widget _buildParentView() {
    var trimmedList = [...widget.categories];
    trimmedList.removeWhere((cat) => cat.categoryType != widget.categoryType);

    Map<Category, List<Category>> grouped = {};
    List<Category> standalone = [];

    for (var category in trimmedList) {
      if (category.parent != null) {
        grouped[category.parent!] = [...(grouped[category.parent!] ?? []), category];
      } else {
        standalone.add(category);
      }
    }
    standalone.removeWhere((cat) => grouped.containsKey(cat));

    var groupedEntries = grouped.entries.toList()..sort((a, b) => a.key.name.compareTo(b.key.name));
    for (var entry in groupedEntries) {
      entry.value.sort((a, b) => a.name.compareTo(b.name));
    }
    standalone.sort((a, b) => a.name.compareTo(b.name));

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      children: [
        ...groupedEntries.map((MapEntry<Category, List<Category>> entry) {
          return ListTile(
            key: ValueKey(entry.key.id),
            leading: CircleAvatar(
              backgroundColor: ColorConverter.stringToColor(entry.key.iconColor),
              child: Icon(IconConverter.getIcon(entry.key.iconName), color: Colors.white),
            ),
            title: Text(entry.key.name, style: Theme.of(context).textTheme.bodyMedium),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              setState(() {
                selectedParent = entry.key;
              });
              _pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
            },
          );
        }),
        if (standalone.isNotEmpty) ...[
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text("Other Categories", style: Theme.of(context).textTheme.bodyMedium),
          ),
          _buildIconGrid([
            ...standalone.map((category) => CategoryIcon(
                  key: ValueKey(category.id),
                  icon: IconConverter.getIcon(category.iconName),
                  text: category.name,
                  color: ColorConverter.stringToColor(category.iconColor),
                  isSelected: widget.selectedCategory == category,
                  onTap: () => widget.onCategoryTap(category),
                )),
            CategoryIcon(
              key: const ValueKey('new'),
              icon: CommunityMaterialIcons.plus,
              color: AppColors.accentColor,
              text: "New",
              onTap: () => _createCategory(context),
            ),
          ]),
        ],
      ],
    );
  }

  Widget _buildChildView() {
    var trimmedList = [...widget.categories];
    trimmedList.removeWhere((cat) => cat.categoryType != widget.categoryType);

    Map<Category, List<Category>> grouped = {};
    for (var category in trimmedList) {
      if (category.parent != null) {
        grouped[category.parent!] = [...(grouped[category.parent!] ?? []), category];
      }
    }
    List<Widget> childIcons = [];
    if (selectedParent != null && grouped[selectedParent] != null) {
      childIcons = grouped[selectedParent]!
          .map((category) => CategoryIcon(
                key: ValueKey(category.id),
                icon: IconConverter.getIcon(category.iconName),
                text: category.name,
                color: ColorConverter.stringToColor(category.iconColor),
                isSelected: widget.selectedCategory == category,
                onTap: () => widget.onCategoryTap(category),
              ))
          .toList();
    }
    return Column(
      key: const ValueKey('childView'),
      children: [
        Row(
          children: [
            TextButton.icon(
              icon: const Icon(Icons.arrow_back, color: AppColors.primaryTextColor),
              onPressed: () {
                _pageController.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                setState(() {
                  selectedParent = null;
                });
              },
              label: Text(selectedParent?.name ?? "unknown", style: const TextStyle(color: AppColors.primaryTextColor, fontSize: 15)),
            )
          ],
        ),
        const Divider(),
        _buildIconGrid(childIcons),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final pagePhysics = selectedParent != null ? const PageScrollPhysics() : const NeverScrollableScrollPhysics();

    return PageView(
      controller: _pageController,
      physics: pagePhysics,
      onPageChanged: (index) {
        if (index == 0) {
          setState(() {
            selectedParent = null;
          });
        }
      },
      children: [
        _buildParentView(),
        _buildChildView(),
      ],
    );
  }
}
