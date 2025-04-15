import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/booking/application/use_cases/delete_booking_use_case.dart';
import 'package:budget_fusion_app/features/booking/domain/entities/booking_draft.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../use_cases/default_account_use_case.dart';
import '../use_cases/save_booking_use_case.dart';

part 'save_booking_cubit.freezed.dart';
part 'save_booking_state.dart';

@injectable
class SaveBookingCubit extends Cubit<SaveBookingState> {
  final DefaultAccountUseCase _defaultAccountUseCase;
  final SaveBookingUseCase _saveBookingUseCase;
  final DeleteBookingUseCase _deleteBookingUseCase;

  SaveBookingCubit(
    this._saveBookingUseCase,
    this._defaultAccountUseCase,
    this._deleteBookingUseCase,
  ) : super(SaveBookingState.initial(draft: _initialDraft()));

  static BookingDraft _initialDraft({Account? account}) {
    return BookingDraft(date: DateTime.now(), amount: Decimal.zero, account: account);
  }

  Future<void> init(Booking? booking) async {
    try {
      if (booking == null) {
        final defaultAccount = await _defaultAccountUseCase();
        emit(SaveBookingState.draftUpdate(draft: _initialDraft(account: defaultAccount)));
      } else {
        emit(SaveBookingState.draftUpdate(draft: BookingDraft.fromBooking(booking)));
      }
    } on TranslatedException catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} init TranslatedException", e, stack);
      emit(SaveBookingState.error(draft: state.draft, message: e.message));
    } catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} init Exception", e, stack);
      emit(SaveBookingState.error(draft: state.draft, message: 'error.default'));
    }
  }

  void updateDraft(BookingDraft Function(BookingDraft) update) {
    emit(state.copyWith(draft: update(state.draft)));
  }

  Future<void> save() async {
    final draft = state.draft;
    emit(SaveBookingState.loading(draft: draft));
    try {
      await _saveBookingUseCase(draft);
      emit(SaveBookingState.loaded(draft: draft));
    } on TranslatedException catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} save TranslatedException", e, stack);
      emit(SaveBookingState.error(draft: draft, message: e.message));
    } catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} save Exception", e, stack);
      emit(SaveBookingState.error(draft: draft, message: 'error.default'));
    }
  }

  Future<void> delete(Booking? booking) async {
    final draft = state.draft;
    try {
      await _deleteBookingUseCase(booking!);
      emit(SaveBookingState.deleted(draft: draft, booking: booking));
    } on TranslatedException catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} delete TranslatedException", e, stack);
      emit(SaveBookingState.error(draft: draft, message: e.message));
    } catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} delete Exception", e, stack);
      emit(SaveBookingState.error(draft: draft, message: 'error.default'));
    }
  }

  void dispose() {
    emit(SaveBookingState.initial(draft: _initialDraft()));
  }
}
