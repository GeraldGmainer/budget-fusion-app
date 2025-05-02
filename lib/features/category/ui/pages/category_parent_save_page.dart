import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/category/domain/entities/category_draft.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/models/uuid.dart';
import '../../application/cubits/category_save_cubit.dart';
import '../containers/category_save_container.dart';
import '../widget/category_type_input.dart';
import '../widget/icon_input.dart';
import '../widget/name_input.dart';
import '../widget/subcategory_list.dart';

class CategoryParentSavePage extends StatelessWidget {
  final CategoryDraft draft;

  const CategoryParentSavePage({super.key, required this.draft});

  _onAddSubcategory(BuildContext context) {
    final userId = Uuid(supabase.auth.currentUser!.id);
    Navigator.of(context).pushNamed(AppRoutes.categorySubSave, arguments: CategoryDraft.initial(parent: draft.toCategory(userId)));
  }

  _onEditSubcategory(BuildContext context, Category category) {
    Navigator.of(context).pushNamed(AppRoutes.categorySubSave, arguments: CategoryDraft.fromCategory(category));
  }

  _onDelete(BuildContext context) {
    // TODO display different message when it has sub categories. that it will also clear sub categories
    ConfirmDialog.show(
      context,
      headerText: "booking.dialog.delete_title",
      bodyText: "booking.dialog.delete_body",
      onOK: () => BlocProvider.of<CategorySaveCubit>(context).delete(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CategorySaveContainer(
      draft: draft,
      builder: (BuildContext context, CategoryDraft draft) => _buildContent(context, draft),
      appBar: AppBar(
        title: Text(draft.isCreating ? "category.new_title_parent" : "category.edit_title_parent").tr(),
        actions: [
          if (!draft.isCreating)
            IconButton(
              icon: const Icon(CommunityMaterialIcons.delete),
              onPressed: () => _onDelete(context),
            )
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, CategoryDraft draft) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: IconInput(draft: draft),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NameInput(draft: draft),
                  const SizedBox(height: 8),
                  CategoryTypeInput(draft: draft),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _buildSubcategoryHeader(context),
        const SizedBox(height: 8),
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
