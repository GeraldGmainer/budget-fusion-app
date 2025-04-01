import 'dart:convert';

import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BudgetGoalsTab extends StatefulWidget {
  @override
  State<BudgetGoalsTab> createState() => _BudgetGoalsTabState();
}

class _BudgetGoalsTabState extends State<BudgetGoalsTab> {
  List<dynamic> categories = [];

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  Future<void> loadCategories() async {
    String jsonString = await rootBundle.loadString('assets/categories.json');
    setState(() {
      categories = json.decode(jsonString);
    });
  }

  Color hexToColor(String hex) {
    return Color(int.parse(hex.substring(1, 7), radix: 16) + 0xFF000000);
  }

  Widget buildCategory(Map<String, dynamic> category) {
    return Card(
      child: ExpansionTile(
        initiallyExpanded: true,
        leading: Icon(IconConverter.getIcon(category['icon_name']), color: hexToColor(category['icon_color'])),
        title: Text(category['name']),
        children: (category['sub_categories'] as List<dynamic>).map((subCat) {
          return ListTile(
            leading: Icon(IconConverter.getIcon(subCat['icon_name']), color: hexToColor(subCat['icon_color'])),
            title: Text(subCat['name']),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categories Test')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: categories.map((cat) => buildCategory(cat)).toList(),
        ),
      ),
    );
  }
}
