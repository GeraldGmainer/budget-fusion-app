import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../../../data_managers/account/account.dart';

@lazySingleton
class BookingAccountService {
  final AccountDataManager _manager;

  BookingAccountService(this._manager);

  Future<Account?> getDefaultAccount() async {
    return (await _manager.getAll()).firstOrNull;
  }
}
