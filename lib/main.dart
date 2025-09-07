import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:keep_screen_on/keep_screen_on.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app/app.dart';
import 'core/constants/feature_constants.dart';
import 'core/di/injection.dart';
import 'utils/utils.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await configureInjection();
  final lifecycle = GetIt.I<AppLifecycleManager>();
  await lifecycle.init();

  if (!kReleaseMode) {
    KeepScreenOn.turnOn();
  }

  runAppWithProviders() => runApp(
    ChangeNotifierProvider(
      create: (context) => ScaffoldProvider(),
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('de')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: MyApp(),
      ),
    ),
  );

  if (FeatureConstants.useSentry) {
    await SentryFlutter.init(
      (options) {
        options.dsn = 'https://915d1e87a556cc98905eab9123ad3b83@o4509979700756480.ingest.de.sentry.io/4509979702722640';
        // Adds request headers and IP for users,
        // visit: https://docs.sentry.io/platforms/dart/data-management/data-collected/ for more info
        options.sendDefaultPii = true;
        // Enable logs to be sent to Sentry
        options.enableLogs = true;
        // Set sessionSampleRate to 0.1 to capture 10% of sessions and onErrorSampleRate to 1.0 to capture 100% of errors.
        options.replay.sessionSampleRate = 0.1;
        options.replay.onErrorSampleRate = 1.0;
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = 1.0;
        // The sampling rate for profiling is relative to tracesSampleRate
        // Setting to 1.0 will profile 100% of sampled transactions:
        options.profilesSampleRate = 1.0;
      },
      appRunner: runAppWithProviders,
    );
  } else {
    runAppWithProviders();
  }
}
