import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/core.dart';

class SupabaseContainer extends StatelessWidget {
  final Widget? child;
  final GlobalKey<NavigatorState> rootNavigatorKey;

  const SupabaseContainer({super.key, required this.child, required this.rootNavigatorKey});

  void _go(void Function(NavigatorState nav) f) {
    final nav = rootNavigatorKey.currentState;
    if (nav != null) {
      f(nav);
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final n = rootNavigatorKey.currentState;
        if (n != null) f(n);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SupabaseAuthCubit, SupabaseAuthState>(
      listenWhen: (prev, next) => prev.runtimeType != next.runtimeType,
      listener: (ctx, state) {
        state.whenOrNull(
          unauthenticated: () => _go((n) => n.pushNamedAndRemoveUntil(AppRoutes.login, (_) => false)),
          authenticated: (_) => _go((n) => n.pushNamedAndRemoveUntil(AppRoutes.main, (_) => false)),
          passwordRecovery: (_) => _go((n) => n.pushNamedAndRemoveUntil(AppRoutes.passwordReset, (_) => false)),
        );
      },
      child: child ?? CircularProgressIndicator(),
    );
  }
}
