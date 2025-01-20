import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ScrollableNavBar extends StatefulWidget {
  final List<String> items;
  final Function(int) onTabSelect;

  const ScrollableNavBar({
    super.key,
    required this.onTabSelect,
    required this.items,
  });

  @override
  State<ScrollableNavBar> createState() => _ScrollableNavBarState();
}

class _ScrollableNavBarState extends State<ScrollableNavBar> {
  final ScrollController _scrollController = ScrollController();
  late List<GlobalKey> _itemKeys;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _itemKeys = List.generate(widget.items.length, (index) => GlobalKey());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onItemTap(int index) {
    _selectedIndex = index;
    widget.onTabSelect(index);
    final key = _itemKeys[index];
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 300),
        alignment: 0.5,
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(border: Border(bottom: AppBorders.secondaryBorder)),
      child: Center(
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(widget.items.length, (index) {
              final isSelected = _selectedIndex == index;
              return GestureDetector(
                onTap: () => _onItemTap(index),
                child: Container(
                  key: _itemKeys[index],
                  padding: EdgeInsets.fromLTRB(4, 4, 4, 8),
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: isSelected ? AppColors.primaryTextColor : Colors.transparent,
                        width: 3.0,
                      ),
                    ),
                  ),
                  child: Text(
                    widget.items[index],
                    style: TextStyle(
                      fontSize: 14,
                      color: isSelected ? AppColors.primaryTextColor : Colors.grey,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
