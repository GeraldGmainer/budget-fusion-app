import 'package:budget_fusion_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class MainBottomNavigationCreateItem extends BottomNavigationBarItem {
  MainBottomNavigationCreateItem({
    required IconData icon,
  }) : super(
          label: '',
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.accentColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 22,
            ),
          ),
        );
}
