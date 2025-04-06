import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DefaultAccountUseCase {
  static const Duration timeout = Duration(seconds: 5);
  final AccountRepo _accountRepo;

  DefaultAccountUseCase(this._accountRepo);

  Future<Account?> call() async {
    return (await _accountRepo.watch().first.timeout(timeout)).firstOrNull;
  }
}
