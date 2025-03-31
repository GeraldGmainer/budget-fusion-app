import 'package:budget_fusion_app/utils/utils.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class BudgetIcon extends StatelessWidget {
  final String? name;
  final String? color;
  final double size;

  const BudgetIcon({
    super.key,
    required this.name,
    required this.color,
    this.size = 24.0,
  });

  static final Map<String, IconData> _iconDataMap = {
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

  IconData _getIcon(String? iconName) {
    return _iconDataMap[iconName] ?? CommunityMaterialIcons.help;
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      _getIcon(name),
      size: size,
      color: ColorConverter.stringToColor(color),
    );
  }
}
