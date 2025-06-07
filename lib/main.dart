import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'app/app_life_cycle_manager.dart';
import 'core/di/injection.dart';
import 'utils/utils.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await configureInjection();
  final lifecycle = GetIt.I<AppLifecycleManager>();
  await lifecycle.init();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ScaffoldProvider(),
      child: EasyLocalization(supportedLocales: const [Locale('en'), Locale('de')], path: 'assets/translations', fallbackLocale: Locale('en'), child: MyApp()),
    ),
  );
}
