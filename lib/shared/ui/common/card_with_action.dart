import 'package:budget_fusion_app/core/core.dart';
import 'package:flutter/material.dart';

// TODO rename widget
class CardWithAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Widget child;

  const CardWithAction({
    super.key,
    this.icon = Icons.more_vert,
    this.onTap,
    this.backgroundColor = AppColors.cardColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
          if (onTap != null)
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: Icon(icon),
                onPressed: onTap,
              ),
            ),
        ],
      ),
    );
  }
}
