import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injection.config.dart';

GetIt getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
Future<void> configureInjection() async {
  getIt.enableRegisteringMultipleInstancesOfOneType();
  await getIt.init();
}

@module
abstract class RegisterModule {
  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @preResolve
  Future<SharedPreferences> get sharedPrefs => SharedPreferences.getInstance();
}
