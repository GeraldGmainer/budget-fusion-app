import 'package:flutter/material.dart';

class BudgetGoalsTab extends StatelessWidget {
  const BudgetGoalsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return _BudgetGoalsView();
  }
}

class _BudgetGoalsView extends StatelessWidget {
  const _BudgetGoalsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Budget Goals')), body: const Center(child: Text('Budget Goals')));
  }
}
