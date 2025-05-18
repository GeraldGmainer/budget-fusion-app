import 'package:budget_fusion_app/core/core.dart';
import 'package:flutter/material.dart';

import '../../application/cubits/booking_save_cubit.dart';
import '../../application/cubits/calculator_cubit.dart';
import '../calculator/calculator.dart';

class CalculatorSheet extends StatelessWidget {
  final BookingSaveCubit bookingSaveCubit;
  final CalculatorCubit calculatorCubit;

  const CalculatorSheet({super.key, required this.bookingSaveCubit, required this.calculatorCubit});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primaryColorVariant,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 32.0),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(color: Theme.of(context).dividerColor, borderRadius: BorderRadius.circular(2)),
          ),
          SizedBox(height: 32.0),
          Calculator(bookingSaveCubit: bookingSaveCubit, calculatorCubit: calculatorCubit),
        ],
      ),
    );
  }
}
