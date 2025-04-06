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
  void didUpdateWidget(covariant ScrollableNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items.length != widget.items.length) {
      _itemKeys = List.generate(widget.items.length, (index) => GlobalKey());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
              return NavBarItem(
                key: _itemKeys[index],
                text: widget.items[index],
                isSelected: _selectedIndex == index,
                onTap: () => _onItemTap(index),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const NavBarItem({
    required Key key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(4, 4, 4, 8),
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
          text,
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? AppColors.primaryTextColor : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
