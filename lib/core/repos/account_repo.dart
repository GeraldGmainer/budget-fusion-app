import '../core.dart';

abstract class AccountRepo {
  Future<List<Account>> getAccounts();
}
