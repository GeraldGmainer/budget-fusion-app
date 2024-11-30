import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';
import '../../domain/domain.dart';

class RefreshButton extends StatelessWidget {
  _refresh(BuildContext context) {
    context.read<SummaryBloc>().add(PeriodPaginationEvent.load(BudgetBookFilter(transaction: TransactionType.outcome, period: PeriodMode.month)));
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
