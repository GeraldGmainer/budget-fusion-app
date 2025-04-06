import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/save_booking_cubit.dart';
import '../../domain/entities/booking_draft.dart';
import '../widgets/category_list_input.dart';
import '../widgets/description_input.dart';
import '../widgets/save_booking_overview.dart';

class SaveBookingTab2 extends StatelessWidget {
  final BookingDraft draft;

  const SaveBookingTab2({required this.draft});

  _upload(BuildContext context) {
    if (draft.category == null) {
      showErrorSnackBar(context, "booking.validation.required_category", duration: Duration(seconds: 2));
      return;
    }
    context.read<SaveBookingCubit>().save();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SaveBookingOverview(draft: draft),
        const SizedBox(height: AppDimensions.verticalPadding),
        DescriptionInput(draft: draft),
        const SizedBox(height: AppDimensions.verticalPadding),
        Expanded(child: CategoryListInput(draft: draft)),
        const SizedBox(height: AppDimensions.verticalPadding * 2),
        SaveButton(onTap: () => _upload(context)),
        const SizedBox(height: AppDimensions.verticalPadding),
      ],
    );
  }
}
