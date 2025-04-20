import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CategoryParentSavePage extends StatefulWidget {
  final Category category;

  const CategoryParentSavePage({super.key, required this.category});

  @override
  State<CategoryParentSavePage> createState() => _CategoryParentSavePageState();
}

class _CategoryParentSavePageState extends State<CategoryParentSavePage> {
  late final Category _category;

  @override
  void initState() {
    super.initState();
    _category = widget.category.copyWith();
  }

  _onAddSubcategory() {}

  _onEditSubcategory(Category category) {}

  _onTransactionTypeTap() async {
    final CategoryType? selectedValue = await showSelectionBottomSheet<CategoryType>(
      context: context,
      title: "booking.select_transaction_type",
      items: [CategoryType.outcome, CategoryType.income],
      selectedItem: _category.categoryType,
      itemLabelBuilder: (categoryType) {
        return Row(
          children: [
            SizedBox(width: 45, child: Icon(categoryType.icon, color: categoryType.color)),
            Text(categoryType.label.tr()),
          ],
        );
      },
    );

    if (selectedValue != null && context.mounted) {
      // context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(categoryType: selectedValue));
    }
  }

  _onDelete() {}

  _onSave() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category').tr(),
        actions: [
          IconButton(
            icon: const Icon(CommunityMaterialIcons.delete),
            onPressed: _onDelete,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildCategory(),
        const SizedBox(height: 24),
        _buildSubcategoryHeader(),
        const SizedBox(height: 8),
        _buildSubcategories(),
        const SizedBox(height: 8),
        _buildSaveButton(),
      ],
    );
  }

  Widget _buildCategory() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            radius: 40,
            child: BudgetIcon(name: _category.iconName, color: _category.iconColor),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: _category.name,
                style: TextStyle(fontSize: 13),
                maxLength: FeatureConstants.descriptionMaxLength,
                decoration: InputDecoration(
                  labelText: 'Name'.tr(),
                  labelStyle: TextStyle(fontSize: 12, color: AppColors.secondaryTextColor),
                ),
                onChanged: (v) {
                  setState(() => _category.copyWith(name: v));
                },
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  _onTransactionTypeTap();
                },
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: "Category Type",
                    labelStyle: TextStyle(fontSize: 12, color: AppColors.secondaryTextColor),
                    suffixIcon: Icon(Icons.arrow_drop_down),
                  ),
                  child: Text(
                    _category.categoryType.label.tr(),
                    style: TextStyle(fontSize: 13, color: AppColors.primaryTextColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSubcategoryHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Subcategories'.tr(), style: Theme.of(context).textTheme.titleMedium),
        IconButton(
          onPressed: _onAddSubcategory,
          icon: Icon(Icons.add, color: AppColors.accentColor),
        ),
      ],
    );
  }

  Widget _buildSubcategories() {
    if (_category.subcategories.isEmpty) {
      return Text('No subcategories'.tr());
    }

    return Expanded(
      child: ListView.separated(
        itemCount: _category.subcategories.length,
        // physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (ctx, i) {
          final sub = _category.subcategories[i];
          return ListTile(
            title: Text(sub.name),
            leading: BudgetIcon(name: sub.iconName, color: sub.iconColor),
            onTap: () => _onEditSubcategory(sub),
          );
        },
      ),
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: _onSave,
      child: Text('Save'.tr()),
    );
  }
}
