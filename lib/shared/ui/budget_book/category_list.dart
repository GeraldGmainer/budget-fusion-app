import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';

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
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  Category? _selectedParent;
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

  List<Category> _sortByName(List<Category> cats) {
    cats.sort((a, b) => a.name.compareTo(b.name));
    return cats;
  }

  void _createCategory(BuildContext context, [Category? parent]) {}

  @override
  Widget build(BuildContext context) {
    final physics = _selectedParent != null ? const PageScrollPhysics() : const NeverScrollableScrollPhysics();

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: PageView(
        controller: _pageController,
        physics: physics,
        onPageChanged: (index) {
          if (index == 0) setState(() => _selectedParent = null);
        },
        children: [
          _ParentList(
            categories: widget.categories,
            categoryType: widget.categoryType,
            selectedCategory: widget.selectedCategory,
            onCategoryTap: widget.onCategoryTap,
            onParentSelected: (parent) {
              setState(() => _selectedParent = parent);
              _pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            createCategory: _createCategory,
            sortByName: _sortByName,
          ),
          _SubcategoryList(
            parent: _selectedParent,
            categories: widget.categories,
            selectedCategory: widget.selectedCategory,
            onCategoryTap: widget.onCategoryTap,
            onBack: () {
              _pageController.animateToPage(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              setState(() => _selectedParent = null);
            },
            createCategory: _createCategory,
            sortByName: _sortByName,
          ),
        ],
      ),
    );
  }
}

class _ParentList extends StatelessWidget {
  final List<Category> categories;
  final CategoryType categoryType;
  final Category? selectedCategory;
  final void Function(Category) onCategoryTap;
  final void Function(Category) onParentSelected;
  final void Function(BuildContext, [Category?]) createCategory;
  final List<Category> Function(List<Category>) sortByName;

  const _ParentList({
    required this.categories,
    required this.categoryType,
    required this.selectedCategory,
    required this.onCategoryTap,
    required this.onParentSelected,
    required this.createCategory,
    required this.sortByName,
  });

  @override
  Widget build(BuildContext context) {
    final parents = categories.where((c) => c.parent == null && c.categoryType == categoryType).toList();
    sortByName(parents);

    return ListView.builder(
      itemCount: parents.length + 1,
      itemBuilder: (context, index) {
        if (index < parents.length) {
          final category = parents[index];
          return CategoryTile(
            category: category,
            allCategories: categories,
            selectedCategory: selectedCategory,
            onTap: onCategoryTap,
            onParentSelected: onParentSelected,
          );
        } else {
          return ListTile(
            leading: CircleAvatar(backgroundColor: AppColors.accentColor, child: const Icon(Icons.add, color: Colors.white)),
            title: const Text("New Category"),
            onTap: () => createCategory(context),
          );
        }
      },
    );
  }
}

class _SubcategoryList extends StatelessWidget {
  final Category? parent;
  final List<Category> categories;
  final Category? selectedCategory;
  final void Function(Category) onCategoryTap;
  final VoidCallback onBack;
  final void Function(BuildContext, [Category?]) createCategory;
  final List<Category> Function(List<Category>) sortByName;

  const _SubcategoryList({
    required this.parent,
    required this.categories,
    required this.selectedCategory,
    required this.onCategoryTap,
    required this.onBack,
    required this.createCategory,
    required this.sortByName,
  });

  @override
  Widget build(BuildContext context) {
    if (parent == null) return const SizedBox.shrink();
    final subs = categories.where((c) => c.parent == parent && c.categoryType == parent!.categoryType).toList();
    sortByName(subs);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton.icon(
          onPressed: onBack,
          icon: Icon(Icons.arrow_back, color: Colors.white),
          label: Text(
            parent!.name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Divider(height: 1),
        SizedBox(height: 8.0),
        Expanded(
          child: ListView.builder(
            itemCount: subs.length + 1,
            itemBuilder: (context, index) {
              if (index < subs.length) {
                return CategoryTile(
                  category: subs[index],
                  allCategories: categories,
                  selectedCategory: selectedCategory,
                  onTap: onCategoryTap,
                  onParentSelected: (_) {},
                );
              } else {
                return ListTile(
                  leading: CircleAvatar(backgroundColor: AppColors.accentColor, child: const Icon(Icons.add, color: Colors.white)),
                  title: const Text("New Subcategory"),
                  onTap: () => createCategory(context, parent),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class CategoryTile extends StatelessWidget {
  final Category category;
  final List<Category> allCategories;
  final Category? selectedCategory;
  final void Function(Category) onTap;
  final void Function(Category) onParentSelected;

  const CategoryTile({
    super.key,
    required this.category,
    required this.allCategories,
    required this.selectedCategory,
    required this.onTap,
    required this.onParentSelected,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedCategory == category;
    final bool hasSubcategories = allCategories.any((c) => c.parent == category);
    final bool isSubSelected = selectedCategory?.parent == category;

    return ListTile(
      tileColor: isSelected ? AppColors.accentColor : null,
      shape: isSelected ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)) : null,
      leading: CircleAvatar(
        backgroundColor: ColorConverter.stringToColor(category.iconColor),
        child: Icon(
          IconConverter.getIcon(category.iconName),
          color: Colors.white,
        ),
      ),
      title: Text(category.name),
      trailing: isSubSelected ? const Icon(Icons.check, color: Colors.green) : (hasSubcategories ? const Icon(Icons.arrow_forward) : null),
      onTap: () {
        if (hasSubcategories) {
          onParentSelected(category);
        } else {
          onTap(category);
        }
      },
    );
  }
}
