import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
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
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  late final ValueNotifier<Category?> _selectedCategoryNotifier;
  late final ValueNotifier<CategoryType> _categoryTypeNotifier;

  @override
  void initState() {
    super.initState();
    _selectedCategoryNotifier = ValueNotifier(widget.selectedCategory);
    _categoryTypeNotifier = ValueNotifier(widget.categoryType);
  }

  @override
  void didUpdateWidget(covariant CategoryList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedCategory != oldWidget.selectedCategory) {
      _selectedCategoryNotifier.value = widget.selectedCategory;
    }
    if (widget.categoryType != oldWidget.categoryType) {
      _categoryTypeNotifier.value = widget.categoryType;
      // _navigatorKey.currentState?.popUntil((route) => route.settings.name == 'parent');
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

  Route _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'parent':
        return _createRoute(_buildParentPage());
      case 'subcategories':
        final Category parent = settings.arguments as Category;
        return _createRoute(_buildSubcategoryPage(parent));
      default:
        return _createRoute(_buildParentPage());
    }
  }

  Widget _buildParentPage() {
    return ParentCategoryList(
      categories: widget.categories,
      selectedCategory: _selectedCategoryNotifier.value,
      onCategoryTap: widget.onCategoryTap,
      onParentSelected: (Category parent) {
        _navigatorKey.currentState?.pushNamed('subcategories', arguments: parent);
      },
      createCategory: (context, [parent]) {},
      sortByName: _sortCategories,
    );
  }

  Widget _buildSubcategoryPage(Category parent) {
    return SubcategoryListScreen(
      parent: parent,
      categories: widget.categories,
      selectedCategory: _selectedCategoryNotifier.value,
      onCategoryTap: widget.onCategoryTap,
      onBack: () => _navigatorKey.currentState!.pop(),
      createCategory: (context, [parent]) {},
      sortByName: _sortCategories,
    );
  }

  List<Category> _sortCategories(List<Category> cats) {
    cats.sort((a, b) => a.name.compareTo(b.name));
    return cats;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: CategoryTypeNotifierProvider(
        notifier: _categoryTypeNotifier,
        child: SelectedCategoryNotifierProvider(
          notifier: _selectedCategoryNotifier,
          child: Navigator(
            key: _navigatorKey,
            initialRoute: 'parent',
            onGenerateRoute: _generateRoute,
          ),
        ),
      ),
    );
  }
}

class SelectedCategoryNotifierProvider extends InheritedWidget {
  final ValueNotifier<Category?> notifier;

  const SelectedCategoryNotifierProvider({super.key, required this.notifier, required super.child});

  static ValueNotifier<Category?> of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<SelectedCategoryNotifierProvider>();
    return provider!.notifier;
  }

  @override
  bool updateShouldNotify(SelectedCategoryNotifierProvider oldWidget) => notifier != oldWidget.notifier;
}

class CategoryTypeNotifierProvider extends InheritedWidget {
  final ValueNotifier<CategoryType> notifier;

  const CategoryTypeNotifierProvider({super.key, required this.notifier, required super.child});

  static ValueNotifier<CategoryType> of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<CategoryTypeNotifierProvider>();
    return provider!.notifier;
  }

  @override
  bool updateShouldNotify(CategoryTypeNotifierProvider oldWidget) => notifier != oldWidget.notifier;
}

class ParentCategoryList extends StatelessWidget {
  final List<Category> categories;
  final Category? selectedCategory;
  final void Function(Category) onCategoryTap;
  final void Function(Category) onParentSelected;
  final void Function(BuildContext, [Category?]) createCategory;
  final List<Category> Function(List<Category>) sortByName;

  const ParentCategoryList({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategoryTap,
    required this.onParentSelected,
    required this.createCategory,
    required this.sortByName,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<CategoryType>(
      valueListenable: CategoryTypeNotifierProvider.of(context),
      builder: (context, categoryType, _) {
        return ValueListenableBuilder<Category?>(
          valueListenable: SelectedCategoryNotifierProvider.of(context),
          builder: (context, selectedCat, _) {
            final parents = categories.where((c) => c.isParent && c.categoryType == categoryType).toList();
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
                }
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.accentColor,
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                  title: const Text("New Category"),
                  onTap: () => createCategory(context),
                );
              },
            );
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
    return ValueListenableBuilder<CategoryType>(
      valueListenable: CategoryTypeNotifierProvider.of(context),
      builder: (context, categoryType, _) {
        return ValueListenableBuilder<Category?>(
          valueListenable: SelectedCategoryNotifierProvider.of(context),
          builder: (context, selectedCat, _) {
            final subs = parent.subcategories;
            // sortByName(subs);
            return Material(
              color: AppColors.primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCategoryParent(context),
                  _buildSubcategories(subs, selectedCat),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildCategoryParent(BuildContext context) {
    return TextButton.icon(
      onPressed: onBack,
      icon: const Icon(Icons.arrow_back, color: Colors.white),
      label: Text(
        parent.name,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
      ),
    );
  }

  Widget _buildSubcategories(List<Category> subs, Category? selectedCat) {
    return Expanded(
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
          }
          return ListTile(
            leading: CircleAvatar(backgroundColor: AppColors.accentColor, child: const Icon(Icons.add, color: Colors.white)),
            title: const Text("New Subcategory"),
            onTap: () => createCategory(context, parent),
          );
        },
      ),
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
    final bool hasSubcategories = category.subcategories.isNotEmpty;
    final bool isSubSelected = selectedCategory?.parent?.id == category.id;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      tileColor: isSelected ? AppColors.accentColor : null,
      shape: isSelected ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)) : null,
      leading: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: Opacity(
              opacity: value,
              child: child,
            ),
          );
        },
        child: CircleAvatar(
          backgroundColor: ColorConverter.stringToColor(category.iconColor),
          child: Icon(IconConverter.getIcon(category.iconName), color: Colors.white),
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
