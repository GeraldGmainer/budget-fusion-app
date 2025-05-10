import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/category/category.dart';
import 'package:budget_fusion_app/shared/shared.dart' as shared;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryTypeInput extends StatelessWidget {
  final CategoryDraft draft;

  const CategoryTypeInput({super.key, required this.draft});

  _onCategoryTypeChange(BuildContext context, CategoryType value) {
    context.read<CategorySaveCubit>().updateDraft((draft) => draft.copyWith(categoryType: value));
  }

  @override
  Widget build(BuildContext context) {
    return shared.CategoryTypeInput(
      onChange: (value) => _onCategoryTypeChange(context, value),
      value: draft.categoryType,
    );
  }
}
