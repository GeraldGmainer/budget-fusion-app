import 'package:budget_fusion_app/core/core.dart';
import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  static const double horizontalPadding = AppDimensions.horizontalPadding;
  static const double verticalPadding = 8;
  final IconData icon;
  final Color color;
  final String? text;
  final VoidCallback onTap;
  final bool isSelected;

  const CategoryIcon({
    super.key,
    required this.onTap,
    required this.icon,
    required this.color,
    this.isSelected = false,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double buttonWidth = constraints.maxWidth * 0.9;
          double computedCircleSize = buttonWidth * 0.85;
          double computedIconSize = computedCircleSize * 0.5;

          return Container(
            width: buttonWidth,
            padding: EdgeInsets.symmetric(vertical: verticalPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: isSelected ? Border.all(color: AppColors.primaryTextColor, width: 1) : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: computedCircleSize,
                  height: computedCircleSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: computedIconSize,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Text(
                    text ?? "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12, color: AppColors.primaryTextColor),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
