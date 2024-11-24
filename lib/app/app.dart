import 'package:budget_fusion_app/app/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_screen_on/keep_screen_on.dart';

import 'app_router.dart';
import 'providers/bloc_providers.dart';
import 'supabase/supabase_container.dart';

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  MyApp({super.key}) {
    if (!kReleaseMode) {
      KeepScreenOn.turnOn();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ...getBlocProviders(),
      ],
      child: SupabaseContainer(
        navigatorKey: _navigatorKey,
        child: MaterialApp(
          title: 'Budget book',
          theme: createTheme(context),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          navigatorKey: _navigatorKey,
          onGenerateRoute: _appRouter.onGenerateRoute,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        ),
      ),
    );
  }
}
