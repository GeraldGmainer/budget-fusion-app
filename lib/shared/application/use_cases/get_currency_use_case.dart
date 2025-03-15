import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCurrencyUseCase {
  final ProfileSettingsRepo _repo;

  GetCurrencyUseCase(this._repo);

  Future<Currency> call() async {
    return await _repo.getCurrency();
  }
}
