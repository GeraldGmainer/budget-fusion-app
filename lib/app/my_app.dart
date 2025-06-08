import 'package:budget_fusion_app/app/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_screen_on/keep_screen_on.dart';

import '../core/core.dart';
import 'app_router.dart';
import 'bloc_providers.dart';

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

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
        child: MaterialApp(
          title: 'Budget book',
          theme: createTheme(context),
          onGenerateRoute: _appRouter.onGenerateRoute,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        ),
      ),
    );
  }
}
