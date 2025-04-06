import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ResetBudgetBookUseCase {
  final BookingRepo _bookingRepo;
  final CategoryRepo _categoryRepo;
  final AccountRepo _accountRepo;

  ResetBudgetBookUseCase(this._bookingRepo, this._categoryRepo, this._accountRepo);

  Future<void> call() async {
    await _bookingRepo.reset();
    await _categoryRepo.reset();
    await _accountRepo.reset();
    await Future.wait([
      _accountRepo.loadAll(),
      _categoryRepo.loadAll(),
      _bookingRepo.loadAll(),
    ]);
  }
}
