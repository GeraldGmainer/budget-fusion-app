import 'package:budget_fusion_app/features/booking/domain/service/booking_account_service.dart';
import 'package:injectable/injectable.dart';

import '../../../repos/account/account.dart';

@lazySingleton
class DefaultAccountUseCase {
  final BookingAccountService _bookingAccountService;

  DefaultAccountUseCase(this._bookingAccountService);

  Future<Account?> get() async {
    return _bookingAccountService.getDefaultAccount();
  }
}
