import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryListPage extends StatefulWidget {
  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  final List<String> _tabs = [
    CategoryType.outcome.text.tr(),
    CategoryType.income.text.tr(),
  ];
  int _selectedIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onCreateCategory() {
    // TODO: navigate to category creation screen
  }

  void _onTap(Category category) {}

  void _onTabSelected(int index) {
    setState(() => _selectedIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories').tr(),
        actions: [_buildCreateCategory()],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          ScrollableNavBar(
            items: _tabs,
            onTabSelect: _onTabSelected,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: PageView(
                controller: _pageController,
                onPageChanged: _onTabSelected,
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  _buildCategoryList(CategoryType.outcome),
                  _buildCategoryList(CategoryType.income),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateCategory() {
    return IconButton(
      onPressed: _onCreateCategory,
      icon: const Icon(CommunityMaterialIcons.plus),
    );
  }

  Widget _buildCategoryList(CategoryType type) {
    return BlocBuilder<CategoryCubit, LoadableState<List<Category>>>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (categories) {
            final filtered = type == CategoryType.outcome ? categories.parentOutcomeCategories : categories.parentIncomeCategories;
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildCategories(filtered),
              ),
            );
          },
          // TODO display error with reload button
          orElse: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _buildCategories(List<Category> categories) {
    if (categories.isEmpty) {
      return Center(child: Text('No categories found').tr());
    }
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        final category = categories[index];
        return _buildCategory(category);
      },
      itemCount: categories.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(color: AppColors.disabledTextColor, thickness: 1),
    );
  }

  Widget _buildCategory(Category category) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      onTap: () => _onTap(category),
      visualDensity: const VisualDensity(vertical: 0),
      leading: SizedBox(width: 40, child: BudgetIcon(name: category.iconName, color: category.iconColor)),
      title: Text(category.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: _buildSubtitle(category),
    );
  }

  Widget? _buildSubtitle(Category category) {
    // TODO display subcategories
    // if (category.hasSubcategories) {
    //   return null;
    // }
    // return Text(booking.description!);
    return null;
  }
}
