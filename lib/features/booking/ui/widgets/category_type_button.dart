import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart' as shared;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/booking_save_cubit.dart';
import '../../domain/entities/booking_draft.dart';

class TransactionTypeButton extends StatelessWidget {
  final BookingDraft draft;

  const TransactionTypeButton({super.key, required this.draft});

  _onCategoryTypeChange(BuildContext context, CategoryType value) {
    context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(categoryType: value, category: null));
  }

  @override
  Widget build(BuildContext context) {
    return shared.CategoryTypeInput(
      onChange: (value) => _onCategoryTypeChange(context, value),
      value: draft.categoryType,
    );
  }
}
