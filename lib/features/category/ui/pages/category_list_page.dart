import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/category_draft.dart';

class CategoryListPage extends StatefulWidget {
  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: CategoryType.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _reloadCategories() {
    context.read<CategoryCubit>().load(clearCache: true);
  }

  void _onCreateCategory() {
    Navigator.of(context).pushNamed(AppRoutes.categoryParentSave, arguments: CategoryDraft.initial());
  }

  void _onCategoryTap(Category category) {
    Navigator.of(context).pushNamed(AppRoutes.categoryParentSave, arguments: CategoryDraft.fromCategory(category));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories').tr(),
        actions: [
          IconButton(
            icon: const Icon(CommunityMaterialIcons.plus),
            onPressed: _onCreateCategory,
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            color: AppColors.primaryColor,
            child: TabBar(
              controller: _tabController,
              tabs: CategoryType.values.map((vm) {
                return Tab(text: vm.label.tr());
              }).toList(),
              isScrollable: true,
              tabAlignment: TabAlignment.center,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildCategoryList(CategoryType.outcome),
            _buildCategoryList(CategoryType.income),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryList(CategoryType type) {
    return SingleChildScrollView(
      child: BlocBuilder<CategoryCubit, LoadableState<List<Category>>>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (cats) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildContent(type, cats),
                ),
              );
            },
            error: (message) => ErrorText(message: message, onReload: _reloadCategories),
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  Widget _buildContent(CategoryType type, List<Category> cats) {
    final filtered = (type == CategoryType.outcome) ? cats.parentOutcomeCategories : cats.parentIncomeCategories;
    if (filtered.isEmpty) {
      return Center(child: Text('No categories found').tr());
    }
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        final category = filtered[index];
        return _buildCategory(category);
      },
      itemCount: filtered.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(color: AppColors.disabledTextColor, thickness: 1),
    );
  }

  Widget _buildCategory(Category category) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      onTap: () => _onCategoryTap(category),
      visualDensity: const VisualDensity(vertical: 0),
      leading: SizedBox(width: 40, child: BudgetIcon(name: category.iconName, color: category.iconColor)),
      title: Text(category.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: _buildSubtitle(category),
    );
  }

  Widget? _buildSubtitle(Category category) {
    if (category.subcategories.isEmpty) {
      return null;
    }
    return Text(category.subcategories.map((x) => x.name).join(", "));
  }
}
