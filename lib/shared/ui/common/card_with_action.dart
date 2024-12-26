import 'package:flutter/material.dart';

import '../../../core/core.dart';

class CardWithAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Widget child;

  const CardWithAction({
    super.key,
    this.icon = Icons.more_vert,
    required this.onTap,
    this.backgroundColor = AppColors.primaryColor,
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
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
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
