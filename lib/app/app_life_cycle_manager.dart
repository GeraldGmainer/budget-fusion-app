import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/core.dart';
import '../utils/service/connectivity_service.dart';
import 'stream_life_cycle.dart';

@singleton
class AppLifecycleManager {
  final List<StreamLifecycle> _lifecycles;

  AppLifecycleManager(
    AccountDataManager accountManager,
    CategoryDataManager categoryManager,
    ProfileDataManager profileManager,
    ProfileSettingDataManager profileSettingManager,
    BookingDataManager bookingManager,
  ) : _lifecycles = [accountManager, categoryManager, profileManager, profileSettingManager, bookingManager];

  Future<void> init() async {
    await EasyLocalization.ensureInitialized();
    await dotenv.load(fileName: kReleaseMode ? ".env.prod" : ".env.dev");
    // await dotenv.load(fileName: ".env.prod");
    // await dotenv.load(fileName: ".env.dev");
    final connectivityService = getIt<ConnectivityService>();
    await connectivityService.start();

    await Supabase.initialize(url: dotenv.env['SUPABASE_URL'] ?? "", anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? "");

    for (final lc in _lifecycles) {
      lc.setupStreams();
    }
    // initial data loads…
  }

  Future<void> dispose() async {
    for (final lc in _lifecycles) {
      await lc.disposeStreams();
    }
  }
}
