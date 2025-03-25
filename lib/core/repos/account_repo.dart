import 'package:budget_fusion_app/core/core.dart';

abstract class AccountRepo {
  Stream<List<Account>> watch();

  Future<void> loadAll();

  Future<void> save(Account entity);

  void dispose();
}
