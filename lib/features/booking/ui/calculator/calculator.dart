import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/booking_save_cubit.dart';
import '../../application/cubits/calculator_cubit.dart';
import 'calculator_key.dart';
import 'calculator_keyboard.dart';

export 'calculator_key.dart';

class Calculator extends StatefulWidget {
  final BookingSaveCubit bookingSaveCubit;
  final CalculatorCubit calculatorCubit;

  const Calculator({required this.bookingSaveCubit, required this.calculatorCubit});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  _onPressed(CalculatorKey key) {
    switch (key) {
      case CalculatorKey.clear:
        widget.calculatorCubit.clear();
        break;

      case CalculatorKey.back:
        widget.calculatorCubit.back();
        break;

      case CalculatorKey.equal:
        widget.calculatorCubit.equal();
        break;

      case CalculatorKey.done:
        widget.calculatorCubit.equal();
        Navigator.of(context).pop();
        break;

      default:
        widget.calculatorCubit.key(key);
    }
  }

  _onValueChange(double value) {
    widget.bookingSaveCubit.updateDraft((draft) => draft.copyWith(amount: Decimal.parse(value.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CalculatorCubit, CalculatorState>(
      listener: (context, state) {
        state.whenOrNull(updated: (_, result) => _onValueChange(result));
      },
      child: CalculatorKeyboard(onPressed: _onPressed),
    );
  }
}
