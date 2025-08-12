import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../repos/category/category.dart';
import '../../domain/entities/category_draft.dart';
import '../containers/category_save_container.dart';
import '../widget/icon_input.dart';
import '../widget/name_input.dart';

class CategorySubSavePage extends StatelessWidget {
  final CategoryDraft draft;

  const CategorySubSavePage({super.key, required this.draft});

  @override
  Widget build(BuildContext context) {
    return CategorySaveContainer(
      draft: draft,
      builder: (BuildContext context, CategoryDraft draft) => _buildContent(context, draft),
      title: draft.isCreating ? "category.newSubcategoryTitle" : "category.editSubcategoryTitle",
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
              Padding(padding: const EdgeInsets.only(top: AppDimensions.verticalPadding, right: 8.0), child: IconInput(draft: draft)),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NameInput(draft: draft, autofocus: draft.isCreating),
                    const SizedBox(height: 8),
                    DisabledField(label: 'booking.fields.type'.tr(), value: draft.categoryType.label.tr()),
                    const SizedBox(height: 8),
                    DisabledField(label: 'category.fields.parent'.tr(), value: draft.parent?.name ?? "unknown"),
                    if (draft.id != null) EntityMetaWidget<Category>(id: draft.id!, repo: getIt<CategoryRepo>()),
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
