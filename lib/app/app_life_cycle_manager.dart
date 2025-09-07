import 'package:budget_fusion_app/core/supabase/supabase_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import '../core/core.dart';
import '../utils/service/connectivity_service.dart';

@singleton
class AppLifecycleManager {
  final ConnectivityService connectivityService;
  final OfflineFirstCoordinator offlineFirstCoordinator;
  final SupabaseAuthManager supabaseAuthManager;
  final SupabaseManager supabaseManager;

  AppLifecycleManager(this.connectivityService, this.offlineFirstCoordinator, this.supabaseAuthManager, this.supabaseManager);

  Future<void> init() async {
    await EasyLocalization.ensureInitialized();
    await dotenv.load(fileName: kReleaseMode ? ".env.prod" : ".env.dev");
    await connectivityService.init();
    await supabaseManager.init(dotenv.env['SUPABASE_URL'] ?? "", dotenv.env['SUPABASE_ANON_KEY'] ?? "");
    await supabaseAuthManager.init();
    offlineFirstCoordinator.init();
  }
}
