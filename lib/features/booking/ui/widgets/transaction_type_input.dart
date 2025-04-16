import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/booking/domain/entities/booking_draft.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/booking_save_cubit.dart';

class TransactionTypeInput extends StatelessWidget {
  final BookingDraft draft;

  const TransactionTypeInput({super.key, required this.draft});

  void _onTap(BuildContext context) async {
    final CategoryType? selectedValue = await showSelectionBottomSheet<CategoryType>(
      context: context,
      title: "booking.select_transaction_type",
      items: [CategoryType.outcome, CategoryType.income],
      selectedItem: draft.categoryType,
      itemLabelBuilder: (categoryType) {
        return Row(
          children: [
            SizedBox(width: 45, child: Icon(categoryType.icon, color: categoryType.color)),
            Text(categoryType.text.tr()),
          ],
        );
      },
    );

    if (selectedValue != null && context.mounted) {
      context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(categoryType: selectedValue));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onTap(context);
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: "Category Type",
          labelStyle: TextStyle(fontSize: 12, color: AppColors.secondaryTextColor),
          // prefixIcon: CircleAvatar(
          //   backgroundColor: Colors.transparent,
          //   child: Icon(draft.categoryType.icon, size: 18),
          // ),
          suffixIcon: Icon(Icons.arrow_drop_down),
        ),
        child: Text(
          draft.categoryType.text.tr(),
          style: TextStyle(fontSize: 13, color: AppColors.primaryTextColor),
        ),
      ),
    );
  }
}
