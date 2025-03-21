import 'package:budget_fusion_app/core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/budget_book_filter.dart';

class DescriptionFilter extends StatefulWidget {
  final BudgetBookFilter filter;

  const DescriptionFilter({super.key, required this.filter});

  @override
  State<DescriptionFilter> createState() => _DescriptionFilterState();
}

class _DescriptionFilterState extends State<DescriptionFilter> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.filter.description);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      style: TextStyle(fontSize: 14),
      maxLines: 1,
      decoration: InputDecoration(
        labelText: 'Search by description'.tr(),
        labelStyle: TextStyle(fontSize: 14, color: AppColors.disabledTextColor),
        prefixIcon: const Icon(Icons.search),
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onChanged: (value) {
        widget.filter.description = value;
      },
    );
  }
}
