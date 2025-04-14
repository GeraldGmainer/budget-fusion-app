import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../main.dart';

abstract class MainBottomNavigationBarItem {
  BottomNavigationBarItem build(int selectedIndex);
}

class MainBottomNavigationBar extends StatelessWidget {
  final List<MainBottomNavigationBarItem> items;

  const MainBottomNavigationBar({super.key, required this.items});

  void _selectTab(BuildContext context, int index) {
    context.read<MainCubit>().selectTab(index);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Container(
        decoration: BoxDecoration(border: Border(top: AppBorders.secondaryBorder)),
        child: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            final selectedIndex = state.selectedIndex;
            return BottomNavigationBar(
              selectedFontSize: 0,
              unselectedFontSize: 0,
              type: BottomNavigationBarType.fixed,
              items: items.map((item) => item.build(selectedIndex)).toList(),
              currentIndex: selectedIndex,
              onTap: (index) {
                _selectTab(context, index);
              },
              iconSize: 22,
              showSelectedLabels: false,
              showUnselectedLabels: false,
            );
          },
        ),
      ),
    );
  }
}

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
