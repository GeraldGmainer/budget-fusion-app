import 'package:budget_fusion_app/core/data/sync_manager/sync_cursor_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../data_managers/account/account.dart';
import '../../../data_managers/booking/booking.dart';
import '../../../data_managers/category/category.dart';
import '../../../data_managers/profile/profile.dart';

@lazySingleton
class ResetBudgetBookUseCase {
  final SyncCursorRepo _syncCursorRepo;
  final CategoryDataManager _categoryManager;
  final AccountDataManager _accountManager;
  final BookingDataManager _bookingManager;
  final ProfileDataManager _profileDataManager;

  ResetBudgetBookUseCase(this._syncCursorRepo, this._categoryManager, this._accountManager, this._bookingManager, this._profileDataManager);

  Future<void> reset() async {
    await _syncCursorRepo.clear();
    await _bookingManager.reset();
    await _categoryManager.reset();
    await _accountManager.reset();
    await _profileDataManager.reset();
    await Future.wait([_accountManager.loadAll(), _categoryManager.loadAll(), _bookingManager.loadAll(), _profileDataManager.loadAll()]);
  }
}
