import 'package:budget_fusion_app/core/data/sync_manager/sync_cursor_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../repos/account/account.dart';
import '../../../repos/booking/booking.dart';
import '../../../repos/category/category.dart';
import '../../../repos/profile/profile.dart';

@lazySingleton
class ResetBudgetBookUseCase {
  final SyncCursorRepo _syncCursorRepo;
  final CategoryRepo _categoryRepo;
  final AccountRepo _accountRepo;
  final BookingRepo _bookingRepo;
  final ProfileRepo _profileRepo;

  ResetBudgetBookUseCase(this._syncCursorRepo, this._categoryRepo, this._accountRepo, this._bookingRepo, this._profileRepo);

  Future<void> reset() async {
    await _syncCursorRepo.clear();
    await _bookingRepo.reset();
    await _categoryRepo.reset();
    await _accountRepo.reset();
    await _profileRepo.reset();
    await Future.wait([_accountRepo.loadAll(), _categoryRepo.loadAll(), _bookingRepo.loadAll(), _profileRepo.loadAll()]);
  }
}
