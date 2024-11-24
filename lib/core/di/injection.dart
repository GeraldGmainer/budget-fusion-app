import 'package:connectivity_plus/connectivity_plus.dart';
import 'injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
void configureInjection() => getIt.init();

@module
abstract class RegisterModule {
  @lazySingleton
  Connectivity get connectivity => Connectivity();
}
