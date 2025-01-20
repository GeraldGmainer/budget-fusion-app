import 'package:flutter/material.dart';

import '../../../core/core.dart';

class AppDrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String route;
  final bool isSelected;
  final Function(BuildContext, String) onTap;

  const AppDrawerItem({super.key, required this.icon, required this.title, required this.isSelected, required this.onTap, required this.route});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? AppColors.accentColor : null,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? AppColors.accentColor : null,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      onTap: () => onTap.call(context, route),
    );
  }
}
