import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/core.dart';
import '../../data_managers/account/account.dart';
import '../../data_managers/booking/booking.dart';
import '../../data_managers/category/category.dart';
import '../../data_managers/profile/profile.dart';
import '../../utils/utils.dart';

part 'offline_first_loader_cubit.freezed.dart';
part 'offline_first_loader_state.dart';

@injectable
class OfflineFirstLoaderCubit extends Cubit<OfflineFirstLoaderState> {
  final QueueManager _queueManager;
  final CategoryDataManager _categoryManager;
  final AccountDataManager _accountManager;
  final BookingDataManager _bookingManager;
  final ProfileDataManager _profileManager;

  OfflineFirstLoaderCubit(this._queueManager, this._categoryManager, this._accountManager, this._bookingManager, this._profileManager)
    : super(const OfflineFirstLoaderState.initial());

  Future<void> init() async {
    try {
      emit(OfflineFirstLoaderState.loading());
      await _refreshToken();
      Future.wait([_queueManager.init(), _categoryManager.loadAll(), _accountManager.loadAll(), _bookingManager.loadAll(), _profileManager.loadAll()]);
      emit(OfflineFirstLoaderState.success());
    } on TranslatedException catch (e, stackTrace) {
      BudgetLogger.instance.e("${runtimeType.toString()} TranslatedException", e, stackTrace);
      emit(OfflineFirstLoaderState.error(e.error));
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("${runtimeType.toString()} Exception", e, stackTrace);
      emit(OfflineFirstLoaderState.error(AppError.unknown));
    }
  }

  Future<void> _refreshToken() async {
    try {
      if (supabase.auth.currentUser == null || supabase.auth.currentSession == null) {
        throw UnauthenticatedException();
      }
      Session session = supabase.auth.currentSession!;
      if ((session.expiresAt! - 5) < (DateTime.now().millisecondsSinceEpoch / 1000).round()) {
        BudgetLogger.instance.i("REFRESH TOKEN");
        await supabase.auth.refreshSession();
      }
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("Error refreshing session", e, stackTrace);
    }
  }
}
