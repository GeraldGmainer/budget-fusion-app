import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/core/data/sync_manager/sync_cursor_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../repos/account/account.dart';
import '../../../repos/booking/booking.dart';
import '../../../repos/category/category.dart';

@lazySingleton
class ResetBudgetBookUseCase {
  final SyncCursorRepo _syncCursorRepo;
  final CategoryRepo _categoryRepo;
  final AccountRepo _accountRepo;
  final BookingRepo _bookingRepo;
  final QueueManager _queueManager;

  ResetBudgetBookUseCase(this._syncCursorRepo, this._categoryRepo, this._accountRepo, this._bookingRepo, this._queueManager);

  Future<void> reload() async {
    await Future.wait([_accountRepo.loadAll(), _categoryRepo.loadAll(), _bookingRepo.loadAll()]);
    await _queueManager.wakePausedItemsAndProcess();
  }

  Future<void> resetAndLoad() async {
    await _syncCursorRepo.clear();
    await _bookingRepo.reset();
    await _categoryRepo.reset();
    await _accountRepo.reset();
    await Future.wait([
      _accountRepo.loadAll(forceReload: true),
      _categoryRepo.loadAll(forceReload: true),
      _bookingRepo.loadAll(forceReload: true),
    ]);
    await _queueManager.wakePausedItemsAndProcess();
  }
}
