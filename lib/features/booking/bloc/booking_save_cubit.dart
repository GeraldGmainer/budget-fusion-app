import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../domain/entities/booking_draft.dart';
import '../use_cases/default_account_use_case.dart';
import '../use_cases/save_booking_use_case.dart';

part 'booking_save_cubit.freezed.dart';
part 'booking_save_state.dart';

@injectable
class BookingSaveCubit extends Cubit<BookingSaveState> {
  final DefaultAccountUseCase _defaultAccountUseCase;
  final SaveBookingUseCase _saveBookingUseCase;
  final BookingDataManager _bookingDataManager;

  BookingSaveCubit(this._saveBookingUseCase, this._defaultAccountUseCase, this._bookingDataManager) : super(BookingSaveState.initial(draft: _initialDraft()));

  static BookingDraft _initialDraft({Account? account}) {
    return BookingDraft(date: DateTime.now(), amount: Decimal.zero, account: account);
  }

  Future<void> init(Booking? booking) async {
    try {
      if (booking == null) {
        final defaultAccount = await _defaultAccountUseCase.get();
        emit(BookingSaveState.draftUpdate(draft: _initialDraft(account: defaultAccount)));
      } else {
        emit(BookingSaveState.draftUpdate(draft: BookingDraft.fromBooking(booking)));
      }
    } on TranslatedException catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} init TranslatedException", e, stack);
      emit(BookingSaveState.error(draft: state.draft, error: e.error));
    } catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} init Exception", e, stack);
      emit(BookingSaveState.error(draft: state.draft, error: AppError.unknown));
    }
  }

  void updateDraft(BookingDraft Function(BookingDraft) update) {
    emit(state.copyWith(draft: update(state.draft)));
  }

  Future<void> save() async {
    final draft = state.draft;
    emit(BookingSaveState.loading(draft: draft));
    try {
      await _saveBookingUseCase.save(draft);
      emit(BookingSaveState.loaded(draft: draft));
    } on TranslatedException catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} save TranslatedException", e, stack);
      emit(BookingSaveState.error(draft: draft, error: e.error));
    } catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} save Exception", e, stack);
      emit(BookingSaveState.error(draft: draft, error: AppError.unknown));
    }
  }

  Future<void> delete(Booking booking) async {
    final draft = state.draft;
    try {
      await _bookingDataManager.delete(booking);
      emit(BookingSaveState.deleted(draft: draft, booking: booking));
    } on TranslatedException catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} delete TranslatedException", e, stack);
      emit(BookingSaveState.error(draft: draft, error: e.error));
    } catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} delete Exception", e, stack);
      emit(BookingSaveState.error(draft: draft, error: AppError.unknown));
    }
  }
}
