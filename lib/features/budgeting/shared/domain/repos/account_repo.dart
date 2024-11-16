import '../entities/entities.dart';

abstract class AccountRepo {
  Future<List<Account>> getAccounts();
}
