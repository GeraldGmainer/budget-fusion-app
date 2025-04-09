import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';

// TODO refactoring
class CategoryList extends StatelessWidget {
  final List<Category> categories;
  final CategoryType categoryType;
  final Function(Category) onCategoryTap;
  final Category? selectedCategory;

  const CategoryList({
    super.key,
    required this.categories,
    required this.categoryType,
    required this.onCategoryTap,
    this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoryNavigator(
        categories: categories,
        categoryType: categoryType,
        onCategoryTap: onCategoryTap,
        selectedCategory: selectedCategory,
      ),
    );
  }
}

class CategoryNavigator extends StatefulWidget {
  final List<Category> categories;
  final CategoryType categoryType;
  final Function(Category) onCategoryTap;
  final Category? selectedCategory;

  const CategoryNavigator({
    super.key,
    required this.categories,
    required this.categoryType,
    required this.onCategoryTap,
    this.selectedCategory,
  });

  @override
  _CategoryNavigatorState createState() => _CategoryNavigatorState();
}

class _CategoryNavigatorState extends State<CategoryNavigator> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  late final ValueNotifier<Category?> _selectedCategoryNotifier;

  @override
  void initState() {
    super.initState();
    _selectedCategoryNotifier = ValueNotifier(widget.selectedCategory);
  }

  @override
  void didUpdateWidget(covariant CategoryNavigator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedCategory != oldWidget.selectedCategory) {
      _selectedCategoryNotifier.value = widget.selectedCategory;
    }
  }

  Future<bool> _onWillPop() async {
    if (_navigatorKey.currentState?.canPop() ?? false) {
      _navigatorKey.currentState!.pop();
      return false;
    }
    return true;
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (_, animation, secondaryAnimation, child) {
        final tween = Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SelectedCategoryNotifierProvider(
        notifier: _selectedCategoryNotifier,
        child: Navigator(
          key: _navigatorKey,
          initialRoute: 'parent',
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case 'parent':
                return _createRoute(ParentCategoryList(
                  categories: widget.categories,
                  categoryType: widget.categoryType,
                  selectedCategory: _selectedCategoryNotifier.value,
                  onCategoryTap: widget.onCategoryTap,
                  onParentSelected: (Category parent) {
                    _navigatorKey.currentState?.pushNamed('subcategories', arguments: parent);
                  },
                  createCategory: (context, [parent]) {},
                  sortByName: (cats) {
                    cats.sort((a, b) => a.name.compareTo(b.name));
                    return cats;
                  },
                ));
              case 'subcategories':
                final Category parent = settings.arguments as Category;
                return _createRoute(SubcategoryListScreen(
                  parent: parent,
                  categories: widget.categories,
                  selectedCategory: _selectedCategoryNotifier.value,
                  onCategoryTap: widget.onCategoryTap,
                  onBack: () => _navigatorKey.currentState!.pop(),
                  createCategory: (context, [parent]) {},
                  sortByName: (cats) {
                    cats.sort((a, b) => a.name.compareTo(b.name));
                    return cats;
                  },
                ));
              default:
                return _createRoute(ParentCategoryList(
                  categories: widget.categories,
                  categoryType: widget.categoryType,
                  selectedCategory: _selectedCategoryNotifier.value,
                  onCategoryTap: widget.onCategoryTap,
                  onParentSelected: (Category parent) {
                    _navigatorKey.currentState?.pushNamed('subcategories', arguments: parent);
                  },
                  createCategory: (context, [parent]) {},
                  sortByName: (cats) {
                    cats.sort((a, b) => a.name.compareTo(b.name));
                    return cats;
                  },
                ));
            }
          },
        ),
      ),
    );
  }
}

class SelectedCategoryNotifierProvider extends InheritedWidget {
  final ValueNotifier<Category?> notifier;

  const SelectedCategoryNotifierProvider({
    super.key,
    required this.notifier,
    required Widget child,
  }) : super(child: child);

  static ValueNotifier<Category?> of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<SelectedCategoryNotifierProvider>();
    return provider!.notifier;
  }

  @override
  bool updateShouldNotify(SelectedCategoryNotifierProvider oldWidget) => notifier != oldWidget.notifier;
}

class ParentCategoryList extends StatelessWidget {
  final List<Category> categories;
  final CategoryType categoryType;
  final Category? selectedCategory;
  final void Function(Category) onCategoryTap;
  final void Function(Category) onParentSelected;
  final void Function(BuildContext, [Category?]) createCategory;
  final List<Category> Function(List<Category>) sortByName;

  const ParentCategoryList({
    super.key,
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
    return ValueListenableBuilder<Category?>(
      valueListenable: SelectedCategoryNotifierProvider.of(context),
      builder: (context, selectedCat, child) {
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
                selectedCategory: selectedCat,
                onTap: onCategoryTap,
                onParentSelected: onParentSelected,
              );
            } else {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.accentColor,
                  child: const Icon(Icons.add, color: Colors.white),
                ),
                title: const Text("New Category"),
                onTap: () => createCategory(context),
              );
            }
          },
        );
      },
    );
  }
}

class SubcategoryListScreen extends StatelessWidget {
  final Category parent;
  final List<Category> categories;
  final Category? selectedCategory;
  final void Function(Category) onCategoryTap;
  final VoidCallback onBack;
  final void Function(BuildContext, [Category?]) createCategory;
  final List<Category> Function(List<Category>) sortByName;

  const SubcategoryListScreen({
    super.key,
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
    return ValueListenableBuilder<Category?>(
      valueListenable: SelectedCategoryNotifierProvider.of(context),
      builder: (context, selectedCat, child) {
        final subs = categories.where((c) => c.parent == parent && c.categoryType == parent.categoryType).toList();
        sortByName(subs);
        return Material(
          color: AppColors.primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                onPressed: onBack,
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                label: Text(
                  parent.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: subs.length + 1,
                  itemBuilder: (context, index) {
                    if (index < subs.length) {
                      return CategoryTile(
                        category: subs[index],
                        allCategories: categories,
                        selectedCategory: selectedCat,
                        onTap: onCategoryTap,
                        onParentSelected: (_) {},
                      );
                    } else {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppColors.accentColor,
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                        title: const Text("New Subcategory"),
                        onTap: () => createCategory(context, parent),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
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
        child: Icon(IconConverter.getIcon(category.iconName), color: Colors.white),
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
