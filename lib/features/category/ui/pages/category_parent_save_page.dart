import 'package:budget_fusion_app/core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/category_save_cubit.dart';
import '../../domain/entities/category_draft.dart';
import '../containers/category_save_container.dart';
import '../widget/category_type_input.dart';
import '../widget/icon_input.dart';
import '../widget/name_input.dart';
import '../widget/subcategory_list.dart';

class CategoryParentSavePage extends StatelessWidget {
  final CategoryDraft draft;

  const CategoryParentSavePage({super.key, required this.draft});

  _onAddSubcategory(BuildContext context) {
    _handleSave(context, CategoryDraft.initial(parent: draft.toCategory()));
  }

  _onEditSubcategory(BuildContext context, Category category) {
    _handleSave(context, CategoryDraft.fromCategory(category));
  }

  _handleSave(BuildContext context, CategoryDraft saveDraft) async {
    final result = await Navigator.of(context).pushNamed(AppRoutes.categorySubSave, arguments: saveDraft);
    final bool? shouldRefresh = result as bool?;
    if (context.mounted && shouldRefresh == true) {
      context.read<CategorySaveCubit>().refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CategorySaveContainer(
      draft: draft,
      builder: (BuildContext context, CategoryDraft draft) => _buildContent(context, draft),
      title: draft.isCreating ? "category.new_title_parent" : "category.edit_title_parent".tr(),
    );
  }

  Widget _buildContent(BuildContext context, CategoryDraft draft) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.floatingPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: AppDimensions.verticalPadding, right: 8.0),
                    child: IconInput(draft: draft),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NameInput(draft: draft, autofocus: draft.isCreating),
                        const SizedBox(height: 8),
                        CategoryTypeInput(draft: draft),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              if (!draft.isCreating) _buildSubcategoryHeader(context),
              const SizedBox(height: 8),
            ],
          ),
        ),
        if (!draft.isCreating)
          Expanded(
            child: SingleChildScrollView(
              child: SubcategoryList(draft: draft, onTap: (category) => _onEditSubcategory(context, category)),
            ),
          ),
      ],
    );
  }

  Widget _buildSubcategoryHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Subcategories'.tr(), style: Theme.of(context).textTheme.titleMedium),
        IconButton(
          onPressed: () => _onAddSubcategory(context),
          icon: Icon(Icons.add, color: AppColors.primaryTextColor),
        ),
      ],
    );
  }
}
