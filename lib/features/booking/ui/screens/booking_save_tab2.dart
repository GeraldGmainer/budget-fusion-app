import 'package:budget_fusion_app/core/core.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/booking_draft.dart';
import '../widgets/account_select_input.dart';
import '../widgets/category_list_input.dart';
import '../widgets/save_booking_overview.dart';
import '../widgets/transaction_type_input.dart';

class BookingSaveTab2 extends StatelessWidget {
  final BookingDraft draft;

  const BookingSaveTab2({required this.draft});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimensions.pageFloatingPadding,
      child: Column(
        children: [
          SaveBookingOverview(draft: draft),
          const SizedBox(height: AppDimensions.verticalPadding),
          Row(
            children: [
              SizedBox(width: 8.0),
              Expanded(child: TransactionTypeInput(draft: draft)),
              SizedBox(width: 8.0),
              Expanded(child: AccountSelectInput(draft: draft)),
              SizedBox(width: 8.0),
            ],
          ),
          const SizedBox(height: AppDimensions.verticalPadding),
          Expanded(
            child: CategoryListInput(draft: draft),
          ),
        ],
      ),
    );
  }
}
