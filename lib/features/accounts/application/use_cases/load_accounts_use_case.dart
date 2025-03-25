import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoadAccountsUseCase {
  final AccountRepo _repo;

  LoadAccountsUseCase(this._repo);

  Future<void> call() async {
    await _repo.loadAll();
  }
}
