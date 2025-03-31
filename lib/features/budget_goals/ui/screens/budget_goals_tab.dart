import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';

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

  IconData getHugeIcon(String iconName) {
    var mapping = {
      "strokeRoundedHome01": HugeIcons.strokeRoundedHome01,
      "strokeRoundedKey01": HugeIcons.strokeRoundedKey01,
      "strokeRoundedBank": HugeIcons.strokeRoundedBank,
      "strokeRoundedWrench01": HugeIcons.strokeRoundedWrench01,
      "strokeRoundedShield01": HugeIcons.strokeRoundedShield01,
      "strokeRoundedRestaurant01": HugeIcons.strokeRoundedRestaurant01,
      "strokeRoundedShoppingBasket01": HugeIcons.strokeRoundedShoppingBasket01,
      "strokeRoundedPlate": HugeIcons.strokeRoundedPlate,
      "strokeRoundedCookie": HugeIcons.strokeRoundedCookie,
      "strokeRoundedBus01": HugeIcons.strokeRoundedBus01,
      "strokeRoundedFuelStation": HugeIcons.strokeRoundedFuelStation,
      "strokeRoundedDumbbell01": HugeIcons.strokeRoundedDumbbell01,
      "strokeRoundedWellness": HugeIcons.strokeRoundedWellness,
      "strokeRoundedShoppingBag02": HugeIcons.strokeRoundedShoppingBag02,
      "strokeRoundedShirt01": HugeIcons.strokeRoundedShirt01,
      "strokeRoundedSmartPhone01": HugeIcons.strokeRoundedSmartPhone01,
      "strokeRoundedPerfume": HugeIcons.strokeRoundedPerfume,
      "strokeRoundedShoppingBag01": HugeIcons.strokeRoundedShoppingBag01,
      "strokeRoundedFilm01": HugeIcons.strokeRoundedFilm01,
      "strokeRoundedMusicNote01": HugeIcons.strokeRoundedMusicNote01,
      "strokeRoundedGameController03": HugeIcons.strokeRoundedGameController03,
      "strokeRoundedAirplane01": HugeIcons.strokeRoundedAirplane01,
      "strokeRoundedTv01": HugeIcons.strokeRoundedTv01,
      "strokeRoundedBook01": HugeIcons.strokeRoundedBook01,
      "strokeRoundedMortarboard01": HugeIcons.strokeRoundedMortarboard01,
      "strokeRoundedBookOpen01": HugeIcons.strokeRoundedBookOpen01,
      "strokeRoundedLaptop": HugeIcons.strokeRoundedLaptop,
      "strokeRoundedPresentation01": HugeIcons.strokeRoundedPresentation01,
      "strokeRoundedRobot01": HugeIcons.strokeRoundedRobot01,
      "strokeRoundedPiggyBank": HugeIcons.strokeRoundedPiggyBank,
      "strokeRoundedChart01": HugeIcons.strokeRoundedChart01,
      "strokeRoundedClock01": HugeIcons.strokeRoundedClock01,
      "strokeRoundedMore01": HugeIcons.strokeRoundedMore01,
      "strokeRoundedMoneyBag02": HugeIcons.strokeRoundedMoneyBag02,
      "strokeRoundedSofa01": HugeIcons.strokeRoundedSofa01,
      "strokeRoundedTruck": HugeIcons.strokeRoundedTruck,
      "strokeRoundedHealth": HugeIcons.strokeRoundedHealth,
      "strokeRoundedDoctor01": HugeIcons.strokeRoundedDoctor01,
      "strokeRoundedCar01": HugeIcons.strokeRoundedCar01,
    };
    return mapping[iconName] ?? Icons.help;
  }

  Widget buildCategory(Map<String, dynamic> category) {
    return Card(
      child: ExpansionTile(
        initiallyExpanded: true,
        leading: Icon(getHugeIcon(category['icon_name']), color: hexToColor(category['icon_color'])),
        title: Text(category['name']),
        children: (category['sub_categories'] as List<dynamic>).map((subCat) {
          return ListTile(
            leading: Icon(getHugeIcon(subCat['icon_name']), color: hexToColor(subCat['icon_color'])),
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
