import 'package:budget_fusion_app/core/core.dart';

abstract class AccountRepo {
  Stream<List<AccountLocalDto>> watch();

  Future<void> loadAll();

  Future<void> save(AccountLocalDto dto);

  void dispose();
}
