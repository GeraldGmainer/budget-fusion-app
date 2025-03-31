import 'dart:convert';

import 'package:community_material_icon/community_material_icon.dart';
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

  IconData getIcon(String iconName) {
    var mapping = {
      "home_outline": CommunityMaterialIcons.home_outline,
      "key_outline": CommunityMaterialIcons.key_outline,
      "bank_outline": CommunityMaterialIcons.bank_outline,
      "wrench_outline": CommunityMaterialIcons.wrench_outline,
      "shield_outline": CommunityMaterialIcons.shield_outline,
      "silverware_fork_knife": CommunityMaterialIcons.silverware_fork_knife,
      "shopping": CommunityMaterialIcons.shopping,
      "food_fork_drink": CommunityMaterialIcons.food_fork_drink,
      "cookie": CommunityMaterialIcons.cookie,
      "bus": CommunityMaterialIcons.bus,
      "gas_station": CommunityMaterialIcons.gas_station,
      "dumbbell": CommunityMaterialIcons.dumbbell,
      "leaf": CommunityMaterialIcons.leaf,
      "tshirt_crew_outline": CommunityMaterialIcons.tshirt_crew_outline,
      "cellphone": CommunityMaterialIcons.cellphone,
      "flower": CommunityMaterialIcons.flower,
      "shopping_outline": CommunityMaterialIcons.shopping_outline,
      "filmstrip": CommunityMaterialIcons.filmstrip,
      "music_note": CommunityMaterialIcons.music_note,
      "gamepad_variant": CommunityMaterialIcons.gamepad_variant,
      "airplane": CommunityMaterialIcons.airplane,
      "television_classic": CommunityMaterialIcons.television_classic,
      "book_outline": CommunityMaterialIcons.book_outline,
      "school_outline": CommunityMaterialIcons.school_outline,
      "book_open_outline": CommunityMaterialIcons.book_open_outline,
      "laptop": CommunityMaterialIcons.laptop,
      "presentation": CommunityMaterialIcons.presentation,
      "robot": CommunityMaterialIcons.robot,
      "piggy_bank": CommunityMaterialIcons.piggy_bank,
      "chart_line": CommunityMaterialIcons.chart_line,
      "clock_outline": CommunityMaterialIcons.clock_outline,
      "dots_horizontal": CommunityMaterialIcons.dots_horizontal,
      "cash": CommunityMaterialIcons.cash,
      "sofa": CommunityMaterialIcons.sofa,
      "truck": CommunityMaterialIcons.truck,
      "heart_outline": CommunityMaterialIcons.heart_outline,
      "doctor": CommunityMaterialIcons.doctor,
      "beer": CommunityMaterialIcons.beer,
      "car": CommunityMaterialIcons.car,
      "pill": CommunityMaterialIcons.pill,
      "briefcase_outline": CommunityMaterialIcons.briefcase_outline,
      "gift_outline": CommunityMaterialIcons.gift_outline,
      "cash_multiple": CommunityMaterialIcons.cash_multiple,
    };
    return mapping[iconName] ?? Icons.help;
  }

  Widget buildCategory(Map<String, dynamic> category) {
    return Card(
      child: ExpansionTile(
        initiallyExpanded: true,
        leading: Icon(getIcon(category['icon_name']), color: hexToColor(category['icon_color'])),
        title: Text(category['name']),
        children: (category['sub_categories'] as List<dynamic>).map((subCat) {
          return ListTile(
            leading: Icon(getIcon(subCat['icon_name']), color: hexToColor(subCat['icon_color'])),
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
