import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/booking/domain/entities/booking_draft.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TransactionTypeInput extends StatelessWidget {
  final BookingDraft draft;
  final Function(CategoryType value) onChange;

  const TransactionTypeInput({super.key, required this.draft, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<CategoryType>(
      segments: <ButtonSegment<CategoryType>>[
        ButtonSegment<CategoryType>(
          value: CategoryType.income,
          label: Text(CategoryType.income.label.tr()),
          icon: Icon(CategoryType.income.icon),
        ),
        ButtonSegment<CategoryType>(
          value: CategoryType.outcome,
          label: Text(CategoryType.outcome.label.tr()),
          icon: Icon(CategoryType.outcome.icon),
        ),
      ],
      selected: <CategoryType>{draft.categoryType},
      onSelectionChanged: (Set<CategoryType> newSelection) {
        onChange.call(newSelection.first);
      },
    );
  }
}
