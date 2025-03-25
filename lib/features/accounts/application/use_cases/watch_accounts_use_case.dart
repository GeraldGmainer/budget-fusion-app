import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WatchAccountsUseCase {
  final AccountRepo _repo;

  WatchAccountsUseCase(this._repo);

  Stream<List<Account>> call() {
    return _repo.watch();
  }
}
