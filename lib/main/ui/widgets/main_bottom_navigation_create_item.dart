import 'package:budget_fusion_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'main_bottom_navigation_bar_item.dart';

class MainBottomNavigationCreateItem extends MainBottomNavigationBarItem {
  final VoidCallback onTap;

  MainBottomNavigationCreateItem({
    required this.onTap,
  });

  @override
  BottomNavigationBarItem build(int selectedIndex) {
    return BottomNavigationBarItem(
      label: '',
      icon: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.accentColor, // Replace with AppColors.accentColor if defined
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.add, color: Colors.white, size: 22),
        ),
      ),
    );
  }
}
