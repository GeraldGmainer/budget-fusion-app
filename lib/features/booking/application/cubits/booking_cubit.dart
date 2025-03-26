import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../use_cases/load_bookings_use_case.dart';
import '../use_cases/watch_bookings_use_case.dart';

@injectable
class BookingCubit extends Cubit<LoadableState<List<Booking>>> {
  final WatchBookingsUseCase _watchBookings;
  final LoadBookingsUseCase _loadBookings;
  StreamSubscription? _sub;

  BookingCubit(this._watchBookings, this._loadBookings) : super(const LoadableState.initial()) {
    _startWatching();
  }

  void _startWatching() {
    _sub?.cancel();
    _sub = _watchBookings().listen(
      (bookings) => emit(LoadableState.loaded(bookings)),
      onError: (error) => emit(LoadableState.error(error is TranslatedException ? error.message : 'error.default')),
    );
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }

  Future<void> load({String? userId}) async {
    try {
      DomainLogger.instance.d(runtimeType.toString(), "initiate load for ${DomainLogger.applyColor('booking')}");
      emit(const LoadableState.loading());
      await _loadBookings();
    } on TranslatedException catch (e, stackTrace) {
      BudgetLogger.instance.e("${runtimeType.toString()} TranslatedException", e, stackTrace);
      emit(LoadableState.error(e.message));
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("${runtimeType.toString()} Exception", e, stackTrace);
      emit(LoadableState.error("error.default"));
    }
  }
}
