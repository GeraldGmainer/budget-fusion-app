import 'package:budget_fusion_app/core/core.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;

  const CustomCard({
    super.key,
    this.backgroundColor = AppColors.cardColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (FeatureConstants.useCard) {
      return Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      );
    }
    return child;
  }
}
