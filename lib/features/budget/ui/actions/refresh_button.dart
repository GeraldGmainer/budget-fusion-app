import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RefreshButton extends StatelessWidget {
  _refresh(BuildContext context) {
    // context.read<BookingPeriodBloc>().add(BookingPeriodEvent.load(PeriodMode.month));
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.refresh),
      onPressed: () {
        _refresh(context);
      },
    );
  }
}
