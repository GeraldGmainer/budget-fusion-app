import 'package:budget_fusion_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class FilterChipGroup extends StatelessWidget {
  final List<String> items;
  final String selectedItem;
  final ValueChanged<String> onItemSelected;
  final String title;

  const FilterChipGroup({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onItemSelected,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: items.map((item) {
            final isSelected = selectedItem == item;
            return GestureDetector(
              onTap: () {
                onItemSelected(item);
                Navigator.pop(context); // Close the bottom sheet if needed
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isSelected ? AppColors.accentColor : AppColors.secondaryColor,
                ),
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
