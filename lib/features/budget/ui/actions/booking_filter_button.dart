import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import '../modal/filter_modal.dart';

class BookingFilterButton extends StatelessWidget {
  final BudgetBookFilter filter;

  const BookingFilterButton({super.key, required this.filter});

  void _showFilterDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (BuildContext context) {
        return FilterModal(filter: filter);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.filter_list),
      onPressed: () {
        _showFilterDialog(context);
      },
    );
  }
}
