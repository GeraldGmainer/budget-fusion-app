import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/category/category.dart';
import 'package:budget_fusion_app/features/category/domain/entities/category_draft.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/category_type_input.dart';
import '../widget/icon_input.dart';
import '../widget/name_input.dart';
import '../widget/subcategory_list.dart';

class CategoryParentSavePage extends StatefulWidget {
  final Category category;

  const CategoryParentSavePage({super.key, required this.category});

  @override
  State<CategoryParentSavePage> createState() => _CategoryParentSavePageState();
}

class _CategoryParentSavePageState extends State<CategoryParentSavePage> {
  late Category _category;

  @override
  void initState() {
    super.initState();
    _category = widget.category.copyWith();
  }

  bool get _hasChanged => _category != widget.category;

  Future<bool> _confirmDiscardChanges() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Unsaved changes').tr(),
        content: Text('You have unsaved changes. Are you sure you want to leave?').tr(),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel').tr(),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('OK').tr(),
          ),
        ],
      ),
    );
    return result == true;
  }

  _onAddSubcategory() {}

  _onEditSubcategory(Category category) {}

  _onNameChange(String value) {
    context.read<CategorySaveCubit>().updateDraft((draft) => draft.copyWith(name: value));
  }

  _onIconChange(String iconName, String iconColor) {
    context.read<CategorySaveCubit>().updateDraft((draft) => draft.copyWith(iconName: iconName, iconColor: iconColor));
  }

  _onCategoryTypeChange(CategoryType value) {
    context.read<CategorySaveCubit>().updateDraft((draft) => draft.copyWith(categoryType: value));
  }

  _onDelete() {}

  _onSave() {}

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_hasChanged,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }
        final bool shouldPop = await _confirmDiscardChanges();
        if (context.mounted && shouldPop) {
          Navigator.pop(context);
        }
      },
      child: BlocConsumer<CategorySaveCubit, CategorySaveState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.draft.isCreating ? "category.new_title" : "category.edit_title").tr(),
              actions: [
                if (!state.draft.isCreating)
                  IconButton(
                    icon: const Icon(CommunityMaterialIcons.delete),
                    onPressed: _onDelete,
                  )
              ],
            ),
            body: state.maybeWhen(
              loading: (draft) => Center(child: CircularProgressIndicator()),
              loaded: (draft) => Center(child: CircularProgressIndicator()),
              orElse: () => _buildContent(state.draft),
            ),
          );
        },
      ),
    );
  }

  // TODO use draft
  Widget _buildContent(CategoryDraft draft) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              IconInput(category: _category, onIconChange: _onIconChange),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NameInput(draft: draft, onNameChange: _onNameChange),
                    const SizedBox(height: 8),
                    CategoryTypeInput(category: _category, onCategoryTypeChange: _onCategoryTypeChange),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSubcategoryHeader(),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              child: SubcategoryList(category: _category, onTap: _onEditSubcategory),
            ),
          ),
          const SizedBox(height: 16),
          _buildSaveButton(),
        ],
      ),
    );
  }

  Widget _buildSubcategoryHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Subcategories'.tr(), style: Theme.of(context).textTheme.titleMedium),
        IconButton(
          onPressed: _onAddSubcategory,
          icon: Icon(Icons.add, color: AppColors.primaryTextColor),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: _onSave,
      child: Text('Save'.tr()),
    );
  }
}
