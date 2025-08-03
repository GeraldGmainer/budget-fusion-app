import 'package:injectable/injectable.dart';

import '../core.dart';

@module
abstract class DataManagerModule {
  /// Required so that AppLifecycleManager can setup streams
  /// ATTENTION: order is important
  /// booking data manager needs profile manager, so profile manager must be before!
  @singleton
  List<DataManager<dynamic>> managers(
    ProfileDataManager profileDM,
    CurrencyDataManager currencyDM,
    CategoryDataManager categoryDM,
    AccountDataManager accountDM,
    BookingDataManager bookingDM,
  ) => [profileDM, currencyDM, categoryDM, accountDM, bookingDM];
}
