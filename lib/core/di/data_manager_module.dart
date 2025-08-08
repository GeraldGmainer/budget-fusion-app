import 'package:injectable/injectable.dart';

import '../../data_managers/account/account.dart';
import '../../data_managers/booking/booking.dart';
import '../../data_managers/category/category.dart';
import '../../data_managers/currency/currency.dart';
import '../../data_managers/profile/profile.dart';
import '../core.dart';

@module
abstract class DataManagerModule {
  /// Required so that AppLifecycleManager can setup streams
  /// ATTENTION: order is important
  /// booking data manager needs profile manager, so profile manager must be before!
  @singleton
  List<DataManager<dynamic>> managers(
    CurrencyDataManager currencyDM,
    ProfileDataManager profileDM,
    CategoryDataManager categoryDM,
    AccountDataManager accountDM,
    BookingDataManager bookingDM,
  ) => [currencyDM, profileDM, categoryDM, accountDM, bookingDM];
}
