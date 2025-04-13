import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/booking_draft.dart';
import '../calculator/calculator.dart';
import '../widgets/amount_display.dart';
import '../widgets/date_input.dart';
import '../widgets/description_input.dart';

class SaveBookingTab1 extends StatelessWidget {
  final BookingDraft draft;
  final VoidCallback onCategoryTap;
  final GlobalKey<AmountDisplayState> amountDisplayKey;

  const SaveBookingTab1({required this.draft, required this.onCategoryTap, required this.amountDisplayKey});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      final double appBarHeight = AppBar().preferredSize.height;
      final double screenHeight = MediaQuery.of(context).size.height - appBarHeight;
      final bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
      final hideQuickButtons = screenHeight < 600;

      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          AnimatedSize(
            duration: Duration(milliseconds: 300),
            child: SizedBox(
              height: keyboardIsOpen ? 0.0 : null,
              child: Column(
                children: [
                  DateInput(model: draft, hideQuickButtons: hideQuickButtons),
                  const SizedBox(height: AppDimensions.verticalPadding * 2),
                  AmountDisplay(key: amountDisplayKey),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.verticalPadding),
          DescriptionInput(draft: draft),
          if (!keyboardIsOpen) const Spacer(),
          Calculator(model: draft),
          const SizedBox(height: AppDimensions.verticalPadding * 2),
          SaveButton(text: "booking.choose_category_button", onTap: onCategoryTap, backgroundColor: AppColors.secondaryColor),
          const SizedBox(height: AppDimensions.verticalPadding),
        ],
      );
    });
  }
}
