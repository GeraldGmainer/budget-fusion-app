import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/singletons/budget_logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../repos/category/category.dart';
import '../../../category/category.dart';

enum CategoryPickerRoute { parent, subcategories }

class CategoryListInput extends StatefulWidget {
  final CategoryType categoryType;
  final Function(Category) onCategoryTap;
  final Category? selectedCategory;

  const CategoryListInput({super.key, required this.categoryType, required this.onCategoryTap, this.selectedCategory});

  @override
  State<CategoryListInput> createState() => _CategoryListInputState();
}

class _CategoryListInputState extends State<CategoryListInput> {
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
  void didUpdateWidget(covariant CategoryListInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedCategory != oldWidget.selectedCategory) {
      _selectedCategoryNotifier.value = widget.selectedCategory;
    }
    if (widget.categoryType != oldWidget.categoryType) {
      _categoryTypeNotifier.value = widget.categoryType;
    }
  }

  Future<bool> _onWillPop() async {
    if (_navigatorKey.currentState?.canPop() ?? false) {
      _navigatorKey.currentState!.pop();
      return false;
    }
    return true;
  }

  Route _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'parent':
        return _createRoute(_buildParentPage());
      case 'subcategories':
        final Category parent = settings.arguments as Category;
        return _createRoute(_buildSubcategoryPage(parent));
      default:
        BudgetLogger.instance.i("unknown route: ${settings.name}");
        return _createRoute(_buildParentPage());
    }
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (_, animation, secondaryAnimation, child) {
        final tween = Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).chain(CurveTween(curve: Curves.easeInOut));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  Widget _buildParentPage() {
    return RepoList<Category>(
      builder: (ctx, data) {
        return ParentCategoryList(
          categories: data,
          selectedCategory: _selectedCategoryNotifier.value,
          onCategoryTap: widget.onCategoryTap,
          onParentSelected: (Category parent) {
            _navigatorKey.currentState?.pushNamed('subcategories', arguments: parent);
          },
          sortByName: _sortCategories,
        );
      },
    );
  }

  Widget _buildSubcategoryPage(Category parent) {
    return RepoList<Category>(
      builder: (ctx, data) {
        return SubcategoryListScreen(
          parent: parent,
          selectedCategory: _selectedCategoryNotifier.value,
          onCategoryTap: widget.onCategoryTap,
          onBack: () => _navigatorKey.currentState!.pop(),
          sortByName: _sortCategories,
        );
      },
    );
  }

  List<Category> _sortCategories(List<Category> cats) {
    cats.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    return cats;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text("booking.dialogs.category.title".tr()),
          leading: IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.of(context).pop()),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CategoryTypeNotifierProvider(
            notifier: _categoryTypeNotifier,
            child: SelectedCategoryNotifierProvider(
              notifier: _selectedCategoryNotifier,
              child: Navigator(key: _navigatorKey, initialRoute: 'parent', onGenerateRoute: _generateRoute),
            ),
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
  final List<Category> Function(List<Category>) sortByName;

  const ParentCategoryList({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategoryTap,
    required this.onParentSelected,
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
                if (index == parents.length) {
                  return NewCategoryTile(parent: null);
                }
                return CategoryTile(
                  category: parents[index],
                  allCategories: categories,
                  selectedCategory: selectedCat,
                  onTap: onCategoryTap,
                  onParentSelected: onParentSelected,
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
  final Category? selectedCategory;
  final void Function(Category) onCategoryTap;
  final VoidCallback onBack;
  final List<Category> Function(List<Category>) sortByName;

  const SubcategoryListScreen({
    super.key,
    required this.parent,
    required this.selectedCategory,
    required this.onCategoryTap,
    required this.onBack,
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
            return Material(
              color: AppColors.primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCategoryParent(context),
                  _buildSubcategories(selectedCat),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildCategoryParent(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.arrow_back, color: AppColors.primaryTextColor),
      title: Text(parent.name, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.primaryTextColor)),
      onTap: onBack,
    );
  }

  Widget _buildSubcategories(Category? selectedCat) {
    return RepoList<Category>(
      builder: (ctx, data) {
        final updatedParent = data.firstWhere((c) => c.id == parent.id);
        final subs = updatedParent.subcategories;

        return Expanded(
          child: ListView.builder(
            itemCount: subs.length + 1,
            itemBuilder: (context, index) {
              if (index == subs.length) {
                return NewCategoryTile(parent: parent);
              }
              return CategoryTile(
                category: subs[index],
                allCategories: data,
                selectedCategory: selectedCat,
                onTap: onCategoryTap,
                onParentSelected: (_) {},
              );
            },
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
    final bool hasSubcategories = category.subcategories.isNotEmpty;
    final bool isSubSelected = selectedCategory?.parent?.id == category.id;
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
      leading: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: Opacity(opacity: value, child: child),
          );
        },
        child: BudgetIcon(name: category.iconName, color: category.iconColor),
      ),
      title: Text(category.name),
      trailing: (isSelected || isSubSelected) ? const Icon(Icons.check, color: Colors.green) : (hasSubcategories ? const Icon(Icons.arrow_forward) : null),
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

class NewCategoryTile extends StatelessWidget {
  final Category? parent;

  const NewCategoryTile({super.key, required this.parent});

  void _onTap(BuildContext context) {
    if (parent != null) {
      Navigator.of(context, rootNavigator: true).pushNamed(AppRoutes.categorySubSave, arguments: CategoryDraft.initial(parent: parent!));
      return;
    }
    Navigator.of(context, rootNavigator: true).pushNamed(AppRoutes.categoryParentSave, arguments: CategoryDraft.initial());
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
      title: Text("New".tr()),
      leading: SizedBox(
        width: AppDimensions.tileIconWidth,
        child: Icon(Icons.add, color: AppColors.primaryTextColor),
      ),
      onTap: () => _onTap(context),
    );
  }
}
