import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../repos/category/category.dart';
import '../../../../utils/utils.dart';

class BudgetGoalsTab extends StatelessWidget {
  const BudgetGoalsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return _BudgetGoalsView();
  }
}

class _BudgetGoalsView extends StatelessWidget {
  const _BudgetGoalsView();

  Color hexToColor(String hex) => Color(int.parse(hex.substring(1, 7), radix: 16) + 0xFF000000);

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
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: Padding(
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
      ),
    );
  }
}
