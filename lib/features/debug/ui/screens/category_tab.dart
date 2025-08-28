import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../repos/category/category.dart';
import '../../../../utils/utils.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  Color hexToColor(String hex) {
    try {
      return Color(int.parse(hex.substring(1, 7), radix: 16) + 0xFF000000);
    } catch (e) {
      try {
        return Color(int.parse(hex.substring(0, 6), radix: 16) + 0xFF000000);
      } catch (e) {
        BudgetLogger.instance.i("Unknown category color $hex");
      }
    }

    return Colors.white;
  }

  Widget buildCategory(Category category) {
    return Card(
      child: ExpansionTile(
        initiallyExpanded: true,
        leading: Icon(IconConverter.getIcon(category.iconName), color: hexToColor(category.iconColor)),
        title: Text(category.name),
        children:
            category.subcategories.map((sub) {
              return ListTile(
                leading: Icon(IconConverter.getIcon(sub.iconName), color: hexToColor(sub.iconColor)),
                title: Text(sub.name),
              );
            }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<RepoCubit<Category>, LoadableState<List<Category>>>(
        builder:
            (context, state) => state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: (_) => const Center(child: CircularProgressIndicator()),
              loaded: (data) {
                final parents = data.parentCategories;
                if (parents.isEmpty) return const Center(child: Text('No categories'));
                return ListView(
                  children: parents.map(buildCategory).toList(),
                );
              },
              error: (e) => Center(child: Text('Error: $e')),
            ),
      ),
    );
  }
}
