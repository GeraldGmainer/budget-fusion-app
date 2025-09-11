import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../main.dart';

abstract class MainBottomNavigationBarItem {
  BottomNavigationBarItem build(int selectedIndex);
}

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({super.key});

  void _selectTab(BuildContext context, int index) {
    if (index != 1) {
      context.read<MainCubit>().selectTab(index);
    }
  }

  void _createBooking(BuildContext context) => Navigator.of(context).pushNamed(AppRoutes.bookingSave);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Container(
        height: kBottomNavigationBarHeight,
        decoration: BoxDecoration(border: Border(top: AppBorders.secondaryBorder)),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _buildNavigationBar(),
            RemoteLoadingIndicator(),
            _buildCreateButton(context),
          ],
        ),
      ),
    );
  }

  BlocBuilder<MainCubit, MainState> _buildNavigationBar() {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        final selectedIndex = state.selectedIndex;
        return BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            _buildNavItem(tabIndex: 0, selectedIndex: selectedIndex, icon: Icons.home, label: 'Home'),
            _buildPlaceholderItem(),
            _buildNavItem(tabIndex: 2, selectedIndex: selectedIndex, icon: Icons.book, label: 'Budget'),
          ],
          currentIndex: selectedIndex,
          onTap: (index) => _selectTab(context, index),
          iconSize: 22,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        );
      },
    );
  }

  BottomNavigationBarItem _buildNavItem({required int tabIndex, required int selectedIndex, required IconData icon, required String label}) {
    final isSelected = selectedIndex == tabIndex;
    return BottomNavigationBarItem(
      label: '',
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 22, color: isSelected ? AppColors.primaryTextColor : AppColors.disabledTextColor),
          Text(label, style: TextStyle(fontSize: 12, color: isSelected ? AppColors.primaryTextColor : AppColors.disabledTextColor)),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildPlaceholderItem() {
    return const BottomNavigationBarItem(label: '', icon: SizedBox.shrink());
  }

  Positioned _buildCreateButton(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 8,
      child: Material(
        elevation: 6,
        shape: const CircleBorder(),
        color: AppColors.accentColor,
        child: InkWell(
          onTap: () => _createBooking(context),
          customBorder: const CircleBorder(),
          child: const SizedBox(width: 56, height: 56, child: Icon(Icons.add, color: Colors.white, size: 30)),
        ),
      ),
    );
  }
}
