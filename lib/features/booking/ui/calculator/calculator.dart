import 'package:flutter/material.dart';

import '../../domain/entities/booking_draft.dart';
import 'calculator_key.dart';

export 'calculator_key.dart';

class Calculator extends StatefulWidget {
  final BookingDraft model;

  const Calculator({required this.model});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  _onPressed(CalculatorKey key) {
    // TODO
    // switch (key) {
    //   case CalculatorKey.clear:
    //     BlocProvider.of<CalculatorBloc>(context).add(ClearCalculatorEvent());
    //     break;
    //
    //   case CalculatorKey.back:
    //     BlocProvider.of<CalculatorBloc>(context).add(BackCalculatorEvent());
    //     break;
    //
    //   case CalculatorKey.equal:
    //     BlocProvider.of<CalculatorBloc>(context).add(EqualCalculatorEvent());
    //     break;
    //
    //   default:
    //     BlocProvider.of<CalculatorBloc>(context).add(KeyCalculatorEvent(key));
    // }
  }

  _onValueChange(double value) {
    // widget.model.amount = value;
  }

  @override
  Widget build(BuildContext context) {
    // return BlocListener<CalculatorBloc, CalculatorState>(
    //   listener: (context, state) {
    //     if (state is CalculatorUpdateState) {
    //       _onValueChange(state.result);
    //     }
    //   },
    //   child: CalculatorKeyboard(onPressed: _onPressed),
    // );
    return Text("Calculator");
  }
}
