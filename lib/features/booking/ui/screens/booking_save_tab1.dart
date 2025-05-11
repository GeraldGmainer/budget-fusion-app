import 'package:budget_fusion_app/core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/booking_draft.dart';
import '../calculator/calculator.dart';
import '../widgets/amount_display.dart';
import '../widgets/date_input.dart';
import '../widgets/description_input.dart';

// TODO cards 6.0 padding / sonst 16.0 padding
// TODO delete button in 3 dot
// TODO fix tab2
// TODO save button in appbar
class BookingSaveTab1 extends StatelessWidget {
  final BookingDraft draft;
  final VoidCallback onCategoryTap;
  final GlobalKey<AmountDisplayState> amountDisplayKey;

  const BookingSaveTab1({required this.draft, required this.onCategoryTap, required this.amountDisplayKey});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      final double appBarHeight = AppBar().preferredSize.height;
      final double screenHeight = MediaQuery.of(context).size.height - appBarHeight;
      final bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
      final hideQuickButtons = screenHeight < 600;

      return Column(
        children: [
          Expanded(
            child: Padding(
              padding: AppDimensions.pageFloatingPadding.copyWith(top: 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  AnimatedSize(
                    duration: Duration(milliseconds: 300),
                    child: SizedBox(
                      height: keyboardIsOpen ? 0.0 : null,
                      child: Column(
                        children: [
                          DateInput(model: draft, hideQuickButtons: hideQuickButtons),
                          const SizedBox(height: 8.0),
                          AmountDisplay(key: amountDisplayKey),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.verticalPadding),
                  DescriptionInput(draft: draft),
                  if (!keyboardIsOpen) const Spacer(),
                  Calculator(model: draft),
                ],
              ),
            ),
          ),
          _buildNextButton(),
        ],
      );
    });
  }

  Widget _buildNextButton() {
    return SafeArea(
      top: false,
      child: GestureDetector(
        onTap: onCategoryTap,
        child: Container(
          color: AppColors.secondaryColor,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "booking.choose_category_button".tr(),
                style: TextStyle(fontSize: 16, color: AppColors.primaryTextColor),
              ),
              const SizedBox(width: 8),
              Icon(Icons.arrow_forward, color: AppColors.primaryTextColor),
            ],
          ),
        ),
      ),
    );
  }
}
