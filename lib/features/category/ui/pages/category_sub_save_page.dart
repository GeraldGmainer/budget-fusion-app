import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/category_save_cubit.dart';
import '../../domain/entities/category_draft.dart';
import '../containers/category_save_container.dart';
import '../widget/icon_input.dart';
import '../widget/name_input.dart';

class CategorySubSavePage extends StatelessWidget {
  final CategoryDraft draft;

  const CategorySubSavePage({super.key, required this.draft});

  _onDelete(BuildContext context) {
    ConfirmDialog.show(context,
        headerText: "booking.dialog.delete_title", bodyText: "booking.dialog.delete_body", onOK: () => BlocProvider.of<CategorySaveCubit>(context).delete());
  }

  @override
  Widget build(BuildContext context) {
    return CategorySaveContainer(
      draft: draft,
      builder: (BuildContext context, CategoryDraft draft) => _buildContent(context, draft),
      appBar: AppBar(
        title: Text(draft.isCreating ? "category.new_title_sub" : "category.edit_title_sub").tr(),
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
    return Padding(
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
                    NameInput(draft: draft),
                    const SizedBox(height: 8),
                    DisabledField(label: 'Category Type'.tr(), value: draft.categoryType.label.tr()),
                    const SizedBox(height: 8),
                    DisabledField(label: 'Parent Category'.tr(), value: draft.parent?.name ?? "unknown"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
