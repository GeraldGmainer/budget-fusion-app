import 'package:budget_fusion_app/app/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_screen_on/keep_screen_on.dart';

import '../core/core.dart';
import 'app_navigator_observer.dart';
import 'app_router.dart';
import 'bloc_providers.dart';

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
  final ValueNotifier<bool> navReady = ValueNotifier(false);
  final AppRouter _appRouter = AppRouter();

  MyApp({super.key}) {
    if (!kReleaseMode) {
      KeepScreenOn.turnOn();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: getBlocProviders(),
      child: MaterialApp(
        navigatorKey: rootNavigatorKey,
        title: 'Budget book',
        theme: createTheme(context),
        onGenerateRoute: _appRouter.onGenerateRoute,
        navigatorObservers: [BootstrapNavObserver(navReady)],
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        builder: (ctx, child) {
          void go(void Function(NavigatorState nav) f) {
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

          return BlocListener<SupabaseAuthCubit, SupabaseAuthState>(
            listener: (ctx, state) {
              state.whenOrNull(
                unauthenticated: () => go((n) => n.pushNamedAndRemoveUntil(AppRoutes.login, (_) => false)),
                authenticated: (_) => go((n) => n.pushNamedAndRemoveUntil(AppRoutes.main, (_) => false)),
                passwordRecovery: (_) => go((n) => n.pushNamedAndRemoveUntil(AppRoutes.passwordReset, (_) => false)),
              );
            },
            child: child,
          );
        },
      ),
    );
  }
}
