import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';
import '../../domain/domain.dart';
import '../widgets/widgets.dart';

class SummaryTab extends StatefulWidget {
  @override
  State<SummaryTab> createState() => _SummaryTabState();
}

class _SummaryTabState extends State<SummaryTab> {
  void _load() {
    context.read<BookingPeriodBloc>().add(BookingPeriodEvent.load(PeriodMode.month));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryBloc, SummaryState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (charts) => SummaryView(charts: charts),
          empty: () => Center(child: Text("Empty")),
          error: (error) => ErrorText(message: error, onReload: _load),
          orElse: () => LoadingIndicator(),
        );
      },
    );
  }
}
