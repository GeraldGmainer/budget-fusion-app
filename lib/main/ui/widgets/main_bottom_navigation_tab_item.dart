import 'package:flutter/material.dart';

import '../../../core/core.dart';
import 'main_bottom_navigation_bar_item.dart';

class MainBottomNavigationTabItem extends MainBottomNavigationBarItem {
  final int tabIndex;
  final IconData icon;
  final String label;

  MainBottomNavigationTabItem({
    required this.tabIndex,
    required this.icon,
    required this.label,
  });

  @override
  BottomNavigationBarItem build(int selectedIndex) {
    final isSelected = selectedIndex == tabIndex;
    return BottomNavigationBarItem(
      label: '',
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 22,
            color: isSelected ? AppColors.primaryTextColor : AppColors.disabledTextColor,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? AppColors.primaryTextColor : AppColors.disabledTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
