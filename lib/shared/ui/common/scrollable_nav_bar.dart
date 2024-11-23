import 'package:budget_fusion_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class ScrollableNavBar extends StatefulWidget {
  final List<String> items;
  final int selectedIndex;
  final Function(int) onTabSelect;

  const ScrollableNavBar({
    super.key,
    required this.onTabSelect,
    required this.items,
    required this.selectedIndex,
  });

  @override
  State<ScrollableNavBar> createState() => _ScrollableNavBarState();
}

class _ScrollableNavBarState extends State<ScrollableNavBar> {
  final ScrollController _scrollController = ScrollController();
  late List<GlobalKey> _itemKeys;

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
      height: 40,
      padding: const EdgeInsets.only(top: 8),
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(widget.items.length, (index) {
            final isSelected = widget.selectedIndex == index;
            return GestureDetector(
              onTap: () => _onItemTap(index),
              child: Container(
                key: _itemKeys[index],
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isSelected ? AppColors.secondaryColor : Colors.transparent,
                ),
                child: Text(
                  widget.items[index],
                  style: TextStyle(
                    fontSize: 14,
                    color: isSelected ? Colors.white : Colors.grey,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
