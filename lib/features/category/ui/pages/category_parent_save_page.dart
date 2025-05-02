import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/category/category.dart';
import 'package:budget_fusion_app/features/category/domain/entities/category_draft.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../containers/category_save_container.dart';
import '../widget/category_type_input.dart';
import '../widget/icon_input.dart';
import '../widget/name_input.dart';
import '../widget/subcategory_list.dart';

class CategoryParentSavePage extends StatefulWidget {
  final Category? model;

  const CategoryParentSavePage({super.key, required this.model});

  @override
  State<CategoryParentSavePage> createState() => _CategoryParentSavePageState();
}

class _CategoryParentSavePageState extends State<CategoryParentSavePage> {
  final _formKey = GlobalKey<FormState>();
  bool _submitted = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategorySaveCubit>(context).init(widget.model);
  }

  _onSave() {
    setState(() => _submitted = true);
    if (!_formKey.currentState!.validate()) {
      return;
    }
    context.read<CategorySaveCubit>().save();
  }

  _onAddSubcategory() {}

  _onEditSubcategory(Category category) {}

  @override
  Widget build(BuildContext context) {
    return CategorySaveContainer(
      builder: (BuildContext context, CategoryDraft draft) => _buildContent(draft),
      formKey: _formKey,
      submitted: _submitted,
      model: widget.model,
    );
  }

  Widget _buildContent(CategoryDraft draft) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              IconInput(draft: draft),
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
          _buildSubcategoryHeader(),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              child: SubcategoryList(draft: draft, onTap: _onEditSubcategory),
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
