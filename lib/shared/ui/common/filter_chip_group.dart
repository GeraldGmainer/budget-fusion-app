import 'package:flutter/material.dart';

import '../../../core/core.dart';

class FilterChipGroup<T> extends StatelessWidget {
  final List<T> items;
  final T selectedItem;
  final ValueChanged<T> onItemSelected;
  final String title;
  final String Function(T)? valueToString;

  const FilterChipGroup({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onItemSelected,
    required this.title,
    this.valueToString,
  }) : assert(T == String || valueToString != null, 'When T is not String, valueToString must be provided.');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: items.map((item) {
            final isSelected = selectedItem == item;
            return ChoiceChip(
              label: Text(T == String ? item.toString() : valueToString!(item)),
              selected: isSelected,
              onSelected: (_) {
                onItemSelected(item);
              },
              selectedColor: AppColors.accentColor,
              labelStyle: TextStyle(
                fontSize: 14,
                color: isSelected ? AppColors.primaryTextColor : AppColors.disabledTextColor,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
