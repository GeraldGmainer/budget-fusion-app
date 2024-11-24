import 'package:flutter/material.dart';

class MainBottomNavigationBarItem extends BottomNavigationBarItem {
  MainBottomNavigationBarItem({
    required IconData icon,
    required String label,
    required bool isSelected,
  }) : super(
          label: '',
          icon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 22,
                color: isSelected ? Colors.blue : Colors.grey,
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected ? Colors.blue : Colors.grey,
                ),
              ),
            ],
          ),
        );
}
