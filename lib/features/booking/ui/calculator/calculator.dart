import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/calculator_cubit.dart';
import '../../application/cubits/save_booking_cubit.dart';
import '../../domain/entities/booking_draft.dart';
import 'calculator_key.dart';
import 'calculator_keyboard.dart';

export 'calculator_key.dart';

class Calculator extends StatefulWidget {
  final BookingDraft model;

  const Calculator({required this.model});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  _onPressed(CalculatorKey key) {
    switch (key) {
      case CalculatorKey.clear:
        BlocProvider.of<CalculatorCubit>(context).clear();
        break;

      case CalculatorKey.back:
        BlocProvider.of<CalculatorCubit>(context).back();
        break;

      case CalculatorKey.equal:
        BlocProvider.of<CalculatorCubit>(context).equal();
        break;

      default:
        BlocProvider.of<CalculatorCubit>(context).key(key);
    }
  }

  _onValueChange(double value) {
    context.read<SaveBookingCubit>().updateDraft((draft) => draft.copyWith(amount: Decimal.parse(value.toString())));
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
