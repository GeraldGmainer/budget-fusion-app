import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../main.dart';
import 'main_bottom_navigation_bar_item.dart';

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
