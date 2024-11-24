import 'package:budget_fusion_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

import 'main_bottom_navigation_bar_item.dart';
import 'main_bottom_navigation_create_item.dart';

class MainBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int index) onItemTapped;

  const MainBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.secondaryTextColor, width: 0.4)),
        ),
        child: BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            MainBottomNavigationBarItem(icon: Icons.home, label: 'Home', isSelected: 0 == currentIndex),
            MainBottomNavigationBarItem(icon: Icons.pie_chart, label: 'Budget', isSelected: 1 == currentIndex),
            MainBottomNavigationCreateItem(icon: Icons.add),
            MainBottomNavigationBarItem(icon: Icons.trending_up, label: 'Invest', isSelected: 3 == currentIndex),
            MainBottomNavigationBarItem(icon: Icons.person, label: 'Profile', isSelected: 4 == currentIndex),
          ],
          currentIndex: currentIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: onItemTapped,
          iconSize: 22,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      label: '',
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 22),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: currentIndex == index ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildCustomAddButton() {
    return BottomNavigationBarItem(
      label: '',
      icon: InkWell(
        onTap: () => onItemTapped(2),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.accentColor,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.add, color: Colors.white, size: 22),
        ),
      ),
    );
  }
}
