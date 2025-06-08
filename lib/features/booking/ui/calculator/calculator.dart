import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/booking_save_cubit.dart';
import '../../bloc/calculator_cubit.dart';
import 'calculator_key.dart';
import 'calculator_keyboard.dart';

export 'calculator_key.dart';

class Calculator extends StatelessWidget {
  final BookingSaveCubit bookingSaveCubit;
  final CalculatorCubit calculatorCubit;

  const Calculator({required this.bookingSaveCubit, required this.calculatorCubit});

  _onPressed(BuildContext context, CalculatorKey key) {
    switch (key) {
      case CalculatorKey.clear:
        calculatorCubit.clear();
        break;

      case CalculatorKey.back:
        calculatorCubit.back();
        break;

      case CalculatorKey.equal:
        calculatorCubit.equal();
        break;

      case CalculatorKey.done:
        calculatorCubit.equal();
        Navigator.of(context).pop();
        break;

      default:
        calculatorCubit.key(key);
    }
  }

  _onValueChange(double value) {
    bookingSaveCubit.updateDraft((draft) => draft.copyWith(amount: Decimal.parse(value.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CalculatorCubit, CalculatorState>(
      listener: (context, state) {
        state.whenOrNull(updated: (_, result) => _onValueChange(result));
      },
      child: CalculatorKeyboard(onPressed: (key) => _onPressed(context, key)),
    );
  }
}
