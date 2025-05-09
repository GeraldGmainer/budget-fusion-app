import 'package:budget_fusion_app/core/core.dart';
import 'package:flutter/material.dart';

class CustomCardWithAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onOptionTap;
  final VoidCallback? onShowMoreTap;
  final Color backgroundColor;
  final Widget child;

  const CustomCardWithAction({
    super.key,
    this.icon = Icons.more_vert,
    this.onOptionTap,
    this.onShowMoreTap,
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
            padding: onShowMoreTap != null ? const EdgeInsets.fromLTRB(8, 8, 8, 38) : const EdgeInsets.all(8.0),
            child: child,
          ),
          if (onOptionTap != null) Positioned(top: 8, right: 8, child: IconButton(icon: Icon(icon), onPressed: onOptionTap)),
          if (onShowMoreTap != null)
            Positioned(
              bottom: 0,
              right: 0,
              child: TextButton(
                onPressed: onShowMoreTap,
                child: Text('Show More', style: TextStyle(color: AppColors.accentColor, fontWeight: FontWeight.bold, fontSize: 13)),
              ),
            )
        ],
      ),
    );
  }
}
