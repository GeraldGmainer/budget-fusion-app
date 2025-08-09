import 'package:injectable/injectable.dart';

import '../../../../repos/account/account.dart';

@lazySingleton
class BookingAccountService {
  final AccountRepo _repo;

  BookingAccountService(this._repo);

  Future<Account?> getDefaultAccount() async {
    return (await _repo.getAll()).firstOrNull;
  }
}
