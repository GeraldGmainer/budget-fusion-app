import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';
import '../../domain/domain.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({super.key});

  void _refresh(BuildContext context) {
    // TODO: Update the filter based on your application's requirements.
    final filter = BudgetBookFilter(
      transaction: TransactionType.outcome,
      period: PeriodMode.month,
    );
    context.read<BookingPageBloc>().add(BookingPageEvent.loadInitial(filter));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingPageBloc, BookingPageState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final isLoading = state.maybeWhen(loading: (_, __) => true, orElse: () => false);

        return IconButton(
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: child,
            ),
            child: isLoading
                ? SizedBox(
                    key: const ValueKey('loading'),
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Icon(
                    Icons.refresh,
                    key: ValueKey('refresh'),
                  ),
          ),
          onPressed: isLoading ? null : () => _refresh(context),
          tooltip: isLoading ? 'Refreshing...' : 'Refresh',
        );
      },
    );
  }
}
