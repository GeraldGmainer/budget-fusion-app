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
    final showDescription = draft.description?.isNotEmpty ?? false;

    return Card(
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
                  if (showDescription) const SizedBox(height: AppDimensions.verticalPadding),
                  if (showDescription) Text("${draft.description}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
