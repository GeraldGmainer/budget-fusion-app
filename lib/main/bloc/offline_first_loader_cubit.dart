import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/core.dart';
import '../../repos/account/account.dart';
import '../../repos/booking/booking.dart';
import '../../repos/category/category.dart';
import '../../repos/currency/currency.dart';
import '../../repos/profile/profile.dart';
import '../../utils/utils.dart';

part 'offline_first_loader_cubit.freezed.dart';
part 'offline_first_loader_state.dart';

@injectable
class OfflineFirstLoaderCubit extends Cubit<OfflineFirstLoaderState> {
  final QueueManager _queueManager;
  final CategoryRepo _categoryRepo;
  final AccountRepo _accountRepo;
  final BookingRepo _bookingRepo;
  final ProfileRepo _profileRepo;
  final CurrencyRepo _currencyRepo;

  OfflineFirstLoaderCubit(this._queueManager, this._categoryRepo, this._accountRepo, this._bookingRepo, this._profileRepo, this._currencyRepo)
    : super(const OfflineFirstLoaderState.initial());

  Future<void> init() async {
    try {
      emit(OfflineFirstLoaderState.loading());
      await _refreshToken();
      Future.wait([
        _queueManager.init(),
        _currencyRepo.loadAll(),
        _categoryRepo.loadAll(),
        _accountRepo.loadAll(),
        _bookingRepo.loadAll(),
        _profileRepo.loadAll(),
      ]);
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
