import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:budget_fusion_app/core/di/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keep_screen_on/keep_screen_on.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/core.dart';
import 'utils/utils.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: kReleaseMode ? ".env.prod" : ".env.dev");
  // await dotenv.load(fileName: ".env.prod");
  // await dotenv.load(fileName: ".env.dev");
  configureInjection();
  final connectivityService = getIt<ConnectivityService>();
  await connectivityService.start();
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? "",
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? "",
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => ScaffoldProvider(),
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('de')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: MyApp(),
      ),
    ),
  );
}

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
          theme: _createTheme(context),
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

  ThemeData _createTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      // fontFamily: GoogleFonts.raleway().fontFamily,
      fontFamily: GoogleFonts.poppins().fontFamily,
      // fontFamily: GoogleFonts.notoSans().fontFamily,
      // fontFamily: GoogleFonts.arimo().fontFamily,
      primaryColor: AppColors.accentColor,
      tabBarTheme: TabBarTheme(
        labelPadding: EdgeInsets.symmetric(vertical: 8),
        indicator: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.accentColor, width: 4.0)),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.accentColor,
        unselectedItemColor: AppColors.secondaryTextColor,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.accentColor),
        displayMedium: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: AppColors.secondaryTextColor),
        displaySmall: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
        bodyLarge: TextStyle(fontSize: 16, color: AppColors.primaryTextColor, fontWeight: FontWeight.normal),
        bodyMedium: TextStyle(fontSize: 15, color: AppColors.secondaryTextColor, fontWeight: FontWeight.normal),
      ),
      cardTheme: CardTheme(color: AppColors.cardColor),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColors.accentColor, foregroundColor: AppColors.primaryTextColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(AppColors.primaryTextColor),
          backgroundColor: WidgetStateProperty.all(AppColors.secondaryColor),
        ),
      ),
    );
  }
}
