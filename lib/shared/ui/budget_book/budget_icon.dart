import 'package:budget_fusion_app/utils/utils.dart';
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

  @override
  Widget build(BuildContext context) {
    return Icon(
      IconConverter.getIcon(name),
      size: size,
      color: ColorConverter.stringToColor(color),
    );
  }
}
