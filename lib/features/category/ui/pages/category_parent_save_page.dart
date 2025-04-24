import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../widget/icon_color_picker_dialog.dart';

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
    setState(() => _category = _category.copyWith(name: value));
  }

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

  _onIconTap() async {
    final result = await showModalBottomSheet<Map<String, String>>(
      context: context,
      isScrollControlled: true,
      builder: (_) => FractionallySizedBox(
        heightFactor: 1.0,
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: IconColorPickerDialog(
            initialIconName: _category.iconName,
            initialIconColor: _category.iconColor,
          ),
        ),
      ),
    );
    if (result != null) {
      setState(() {
        _category = _category.copyWith(
          iconName: result['iconName']!,
          iconColor: result['iconColor']!,
        );
      });
    }
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
      child: Scaffold(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  _buildIcon(),
                  const SizedBox(width: 16),
                  _buildCategoryForm(),
                ],
              ),
              const SizedBox(height: 24),
              _buildSubcategoryHeader(),
              const SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  child: _buildSubcategories(),
                ),
              ),
              const SizedBox(height: 16),
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return GestureDetector(
      onTap: _onIconTap,
      child: SizedBox(
        width: 80,
        height: 80,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: Material(
                type: MaterialType.circle,
                elevation: 4,
                shadowColor: Colors.black45,
                color: AppColors.cardColor,
                child: Center(
                  child: BudgetIcon(
                    name: _category.iconName,
                    color: _category.iconColor,
                    size: 44,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.accentColor,
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 4),
                  ],
                ),
                child: Icon(
                  Icons.edit,
                  size: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryForm() {
    return Expanded(
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
              counterText: "",
            ),
            onChanged: _onNameChange,
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: _onTransactionTypeTap,
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

  Widget _buildSubcategories() {
    if (_category.subcategories.isEmpty) {
      return Text('No subcategories'.tr());
    }

    final subs = _category.subcategories;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 0),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: subs.length,
          separatorBuilder: (context, index) => const Divider(color: AppColors.disabledTextColor, thickness: 1),
          itemBuilder: (context, index) {
            final sub = subs[index];
            return ListTile(
              dense: true,
              title: Text(sub.name),
              leading: BudgetIcon(name: sub.iconName, color: sub.iconColor),
              onTap: () => _onEditSubcategory(sub),
            );
          },
        ),
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
