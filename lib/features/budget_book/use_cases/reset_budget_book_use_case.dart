import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../../repos/account/account.dart';
import '../../../repos/booking/booking.dart';
import '../../../repos/category/category.dart';

@lazySingleton
class ResetBudgetBookUseCase {
  final CategoryRepo _categoryRepo;
  final AccountRepo _accountRepo;
  final BookingRepo _bookingRepo;
  final QueueManager _queueManager;

  ResetBudgetBookUseCase(this._categoryRepo, this._accountRepo, this._bookingRepo, this._queueManager);

  Future<void> reload() async {
    await Future.wait([
      _accountRepo.loadAll(invalidateCache: true),
      _categoryRepo.loadAll(invalidateCache: true),
      _bookingRepo.loadAll(invalidateCache: true),
    ]);
    await _queueManager.wakePausedItemsAndProcess();
  }
}
