import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/booking_draft.dart';

class CategorySelectInput extends StatelessWidget {
  final BookingDraft draft;
  final Function(Category category) onChange;
  final bool hasError;

  const CategorySelectInput({required this.draft, required this.onChange, required this.hasError});

  _reload(BuildContext context) {
    BlocProvider.of<CategoryCubit>(context).load();
  }

  void _openCategoryPicker(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (sheetCtx) {
        return BlocBuilder<CategoryCubit, LoadableState<List<Category>>>(
          builder: (ctx, state) {
            return state.maybeWhen(
              error: (message) => ErrorText(message: message, onReload: () => _reload(context)),
              loaded: (categories) => CategoryListInput(
                categories: categories,
                categoryType: draft.categoryType,
                onCategoryTap: (category) {
                  onChange.call(category);
                  Navigator.of(context).pop();
                },
                selectedCategory: draft.category,
              ),
              orElse: () => const Center(child: CircularProgressIndicator()),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO translation
    final hasValue = draft.category != null;
    return ListTile(
      leading: hasValue
          ? BudgetIcon(name: draft.category!.iconName, color: draft.category!.iconColor)
          : Icon(CommunityMaterialIcons.table_large, color: Theme.of(context).hintColor),
      title: Text(
        hasValue ? draft.category!.name : "Category",
        style: hasValue ? null : TextStyle(color: Theme.of(context).hintColor),
      ),
      subtitle: hasValue
          ? Text("Category")
          : hasError
              ? Text("Required", style: TextStyle(color: AppColors.validationErrorColor))
              : null,
      trailing: Icon(CommunityMaterialIcons.chevron_right),
      onTap: () => _openCategoryPicker(context),
      // onTap: onTap,
    );
  }
}
