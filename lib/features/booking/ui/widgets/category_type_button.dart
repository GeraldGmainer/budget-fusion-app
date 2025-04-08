import 'package:budget_fusion_app/core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/save_booking_cubit.dart';
import '../../domain/entities/booking_draft.dart';

class TransactionTypeButton extends StatelessWidget {
  final BookingDraft draft;

  const TransactionTypeButton({super.key, required this.draft});

  Future<void> _showTypeDialog(BuildContext context) async {
    final selectedType = await showDialog<CategoryType>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Transaction Type").tr(),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: CategoryType.values.map((type) {
              return ListTile(
                title: Text(type.text.tr()),
                onTap: () {
                  Navigator.pop(context, type);
                },
              );
            }).toList(),
          ),
        );
      },
    );
    if (selectedType != null && context.mounted) {
      context.read<SaveBookingCubit>().updateDraft((draft) => draft.copyWith(categoryType: selectedType, category: null));
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _showTypeDialog(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(
          draft.categoryType.text.tr(),
          style: TextStyle(color: AppColors.primaryTextColor),
        ),
      ),
    );
  }
}
