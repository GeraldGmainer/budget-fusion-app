import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ResetBudgetBookUseCase {
  final CategoryDataManager _categoryManager;
  final AccountDataManager _accountManager;
  final BookingDataManager _bookingManager;

  ResetBudgetBookUseCase(this._categoryManager, this._accountManager, this._bookingManager);

  Future<void> call() async {
    await _bookingManager.reset();
    await _categoryManager.reset();
    await _accountManager.reset();
    await Future.wait([_accountManager.loadAll(), _categoryManager.loadAll(), _bookingManager.loadAll()]);
  }
}
