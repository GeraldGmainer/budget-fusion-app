import 'package:budget_fusion_app/app/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_router.dart';
import 'bloc_providers.dart';
import 'supabase_container.dart';

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: getBlocProviders(),
      child: MaterialApp(
        navigatorKey: _rootNavigatorKey,
        title: 'Budget book',
        theme: createTheme(context),
        onGenerateRoute: _appRouter.onGenerateRoute,
        debugShowCheckedModeBanner: !kReleaseMode,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        builder: (ctx, child) => SafeArea(
          top: false,
          child: SupabaseContainer(
            rootNavigatorKey: _rootNavigatorKey,
            child: child,
          ),
        ),
      ),
    );
  }
}
