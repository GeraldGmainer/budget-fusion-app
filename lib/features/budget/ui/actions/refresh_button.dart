import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';

class RefreshButton extends StatelessWidget {
  final VoidCallback onTap;

  const RefreshButton({super.key, required this.onTap});

  void _refresh() {
    onTap.call();
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
          onPressed: isLoading ? null : () => _refresh(),
          tooltip: isLoading ? 'Refreshing...' : 'Refresh',
        );
      },
    );
  }
}
