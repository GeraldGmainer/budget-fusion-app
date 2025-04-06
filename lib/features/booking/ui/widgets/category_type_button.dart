import 'package:budget_fusion_app/core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/save_booking_cubit.dart';
import '../../domain/entities/booking_draft.dart';

class CategoryTypeButton extends StatelessWidget {
  final BookingDraft draft;
  final CategoryType categoryType;

  const CategoryTypeButton({required this.draft, required this.categoryType});

  _onPressed(BuildContext context) {
    context.read<SaveBookingCubit>().updateDraft((draft) => draft.copyWith(categoryType: categoryType, category: null));
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _onPressed(context),
      child: Container(
        padding: const EdgeInsets.only(bottom: 2.0),
        decoration: _buildDecoration(draft.categoryType == categoryType, categoryType.color),
        child: Text(
          categoryType.text.tr().toUpperCase(),
          style: TextStyle(color: categoryType.color, fontSize: 12),
        ),
      ),
    );
  }

  _buildDecoration(bool hasUnderline, Color color) {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: hasUnderline ? color : Colors.transparent,
          width: 2.0,
        ),
      ),
    );
  }
}
