import 'package:injectable/injectable.dart';

import '../../repos/account/account.dart';
import '../../repos/booking/booking.dart';
import '../../repos/category/category.dart';
import '../../repos/currency/currency.dart';
import '../../repos/profile/profile.dart';
import '../core.dart';

@module
abstract class DataManagerModule {
  /// Required so that AppLifecycleManager can setup streams
  /// ATTENTION: order is important
  /// booking data manager needs profile manager, so profile manager must be before!
  @singleton
  List<Repo<dynamic>> repos(
    CurrencyRepo currencyRepo,
    ProfileRepo profileRepo,
    CategoryRepo categoryRepo,
    AccountRepo accountRepo,
    BookingRepo bookingRepo,
  ) => [currencyRepo, profileRepo, categoryRepo, accountRepo, bookingRepo];
}
