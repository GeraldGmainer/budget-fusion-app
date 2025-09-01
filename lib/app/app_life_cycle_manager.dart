import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/core.dart';
import '../utils/service/connectivity_service.dart';

@singleton
class AppLifecycleManager {
  final ConnectivityService connectivityService;
  final OfflineFirstCoordinator offlineFirstCoordinator;

  AppLifecycleManager(this.connectivityService, this.offlineFirstCoordinator);

  Future<void> init() async {
    await EasyLocalization.ensureInitialized();
    await dotenv.load(fileName: kReleaseMode ? ".env.prod" : ".env.dev");
    await connectivityService.init();
    await Supabase.initialize(url: dotenv.env['SUPABASE_URL'] ?? "", anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? "");
    offlineFirstCoordinator.init();
  }
}
