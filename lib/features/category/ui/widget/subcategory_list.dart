import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repos/category/category.dart';
import '../../domain/entities/category_draft.dart';

class SubcategoryList extends StatelessWidget {
  final CategoryDraft draft;
  final Function(Category subcategory) onTap;

  const SubcategoryList({super.key, required this.draft, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepoCubit<Category>, LoadableState<List<Category>>>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (cats) {
            final category = cats.firstWhereOrNull((cat) => cat.id.value == draft.id?.value);
            return _buildList(category?.subcategories ?? []);
          },
          orElse: () => _buildList([]),
        );
      },
    );
  }

  Widget _buildList(List<Category> subcategories) {
    if (subcategories.isEmpty) {
      return Card(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16), child: Text('category.list.emptySubcategory'.tr())));
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 0),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: subcategories.length,
          separatorBuilder: (context, index) => const Divider(color: AppColors.disabledTextColor, thickness: 1),
          itemBuilder: (context, index) {
            final sub = subcategories[index];
            return ListTile(
              dense: true,
              title: Text(sub.name),
              leading: BudgetIcon(name: sub.iconName, color: sub.iconColor, isSynced: sub.isSynced),
              onTap: () => onTap(sub),
            );
          },
        ),
      ),
    );
  }
}
