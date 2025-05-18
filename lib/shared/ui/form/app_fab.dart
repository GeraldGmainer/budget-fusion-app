import 'package:budget_fusion_app/core/core.dart';
import 'package:flutter/material.dart';

class AppFab extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const AppFab({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: onPressed,
      backgroundColor: AppColors.accentColor,
      foregroundColor: AppColors.primaryTextColor,
      child: Icon(icon),
    );
  }

  /// named constructor for a “save” FAB
  factory AppFab.save(VoidCallback onPressed) {
    return AppFab(
      onPressed: onPressed,
      icon: Icons.check,
    );
  }

  /// named constructor for an “add” FAB
  factory AppFab.add(VoidCallback onPressed) {
    return AppFab(
      onPressed: onPressed,
      icon: Icons.add,
    );
  }
}
