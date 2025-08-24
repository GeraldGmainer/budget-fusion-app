import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';

class BudgetIcon extends StatelessWidget {
  final String? name;
  final String? color;
  final double width;
  final double size;
  final bool isSynced;
  final double badgeSize;
  final Color? badgeColor;
  final Alignment badgeAlignment;

  const BudgetIcon({
    super.key,
    required this.name,
    required this.color,
    this.width = 40.0,
    this.size = 24.0,
    this.isSynced = true,
    this.badgeSize = 8,
    this.badgeColor,
    this.badgeAlignment = Alignment.topRight,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = ColorConverter.stringToColor(color);

    final bg = Theme.of(context).colorScheme.surface;
    return SizedBox(
      width: width,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(child: Icon(IconConverter.getIcon(name), size: size, color: iconColor)),
          if (!isSynced)
            Align(
              alignment: badgeAlignment,
              child: Container(
                width: badgeSize,
                height: badgeSize,
                decoration: BoxDecoration(
                  color: badgeColor ?? AppColors.errorColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: bg, width: 1),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
