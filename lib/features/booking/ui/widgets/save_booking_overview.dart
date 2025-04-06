import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/booking_draft.dart';
import 'account_select_input.dart';

class SaveBookingOverview extends StatelessWidget {
  final BookingDraft draft;

  const SaveBookingOverview({super.key, required this.draft});

  @override
  Widget build(BuildContext context) {
    final keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return AnimatedSize(
      duration: Duration(milliseconds: 100),
      child: SizedBox(
        height: keyboardIsOpen ? 0.0 : null,
        child: SizedBox(
          width: double.infinity,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.horizontalPadding,
                vertical: AppDimensions.verticalPadding,
              ),
              child: Row(
                children: [
                  AccountSelectInput(draft: draft),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      children: [
                        Text(DateTimeConverter.toEEEEdMMMM(draft.date), style: const TextStyle(fontSize: 16)),
                        const SizedBox(height: AppDimensions.verticalPadding),
                        CurrencyText(value: draft.amount, fontSize: 38, color: AppColors.primaryTextColor),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
