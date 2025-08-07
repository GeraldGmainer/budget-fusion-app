import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/booking/domain/service/booking_account_service.dart';
import 'package:injectable/injectable.dart';

import '../../../data_managers/account/account.dart';

@lazySingleton
class DefaultAccountUseCase {
  final BookingAccountService _bookingAccountService;

  DefaultAccountUseCase(this._bookingAccountService);

  Future<Account?> get() async {
    return _bookingAccountService.getDefaultAccount();
  }
}
