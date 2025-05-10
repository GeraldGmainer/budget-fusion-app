import 'package:budget_fusion_app/core/core.dart';
import 'package:flutter/material.dart';

class CustomCardWithAction extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final IconData icon;
  final VoidCallback? onOptionTap;
  final VoidCallback? onShowMoreTap;
  final Color backgroundColor;
  final Widget child;

  const CustomCardWithAction({
    super.key,
    this.title,
    this.titleStyle,
    this.icon = Icons.more_vert,
    this.onOptionTap,
    this.onShowMoreTap,
    this.backgroundColor = AppColors.cardColor,
    required this.child,
  }) : assert(onOptionTap == null || title != null, 'title is required when onOptionTap is provided');

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Stack(
        children: [
          if (onOptionTap == null) _buildContent(),
          if (onOptionTap != null) _buildContentWithOptionTap(),
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

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: child,
    );
  }

  Widget _buildContentWithOptionTap() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 16.0),
            Expanded(
              child: Text(
                title!,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600).merge(titleStyle),
              ),
            ),
            if (onOptionTap != null) IconButton(icon: Icon(icon, size: 20), onPressed: onOptionTap),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: child,
        ),
      ],
    );
  }
}
