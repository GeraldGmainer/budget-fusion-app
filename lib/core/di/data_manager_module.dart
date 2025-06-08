import 'package:injectable/injectable.dart';

import '../core.dart';

@module
abstract class DataManagerModule {
  /// Required so that AppLifecycleManager can setup streams
  @singleton
  List<DataManager<dynamic>> managers(
    CategoryDataManager categoryDM,
    AccountDataManager accountDM,
    BookingDataManager bookingDM,
    ProfileDataManager profileDM,
    ProfileSettingDataManager profileSettingDM,
  ) => [categoryDM, accountDM, bookingDM, profileDM, profileSettingDM];
}
