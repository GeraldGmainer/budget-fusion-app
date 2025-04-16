import 'package:budget_fusion_app/core/core.dart';

abstract class AccountRepo {
  Stream<List<Account>> watch();

  Future<void> loadAll();

  Future<void> save(Account entity);

  Future<void> delete(Account entity);

  Future<void> reset();

  void dispose();
}
