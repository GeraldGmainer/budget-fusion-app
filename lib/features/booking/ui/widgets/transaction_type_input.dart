import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/booking/domain/entities/booking_draft.dart';
import 'package:budget_fusion_app/shared/shared.dart' as shared;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/booking_save_cubit.dart';

class TransactionTypeInput extends StatelessWidget {
  final BookingDraft draft;

  const TransactionTypeInput({super.key, required this.draft});

  _onCategoryTypeChange(BuildContext context, CategoryType value) {
    context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(categoryType: value));
  }

  @override
  Widget build(BuildContext context) {
    return shared.CategoryTypeInput(
      onChange: (value) => _onCategoryTypeChange(context, value),
      value: draft.categoryType,
    );
  }
}
