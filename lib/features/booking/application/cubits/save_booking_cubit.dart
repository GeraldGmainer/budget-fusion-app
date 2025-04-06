import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
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

  SaveBookingCubit(this._saveBookingUseCase, this._defaultAccountUseCase) : super(SaveBookingState.initial(draft: _initialDraft()));

  static BookingDraft _initialDraft({Account? account}) {
    return BookingDraft(date: DateTime.now(), amount: Decimal.zero, account: account);
  }

  Future<void> init(Booking? booking) async {
    try {
      if (booking == null) {
        final defaultAccount = await _defaultAccountUseCase();
        emit(SaveBookingState.initial(draft: _initialDraft(account: defaultAccount)));
      } else {
        emit(SaveBookingState.initial(draft: BookingDraft.fromBooking(booking)));
      }
    } on TranslatedException catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} TranslatedException", e, stack);
      emit(SaveBookingState.error(draft: state.draft, message: e.message));
    } catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} Exception", e, stack);
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
      await _saveBookingUseCase();
      emit(SaveBookingState.loaded(draft: draft));
    } on TranslatedException catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} TranslatedException", e, stack);
      emit(SaveBookingState.error(draft: draft, message: e.message));
    } catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} Exception", e, stack);
      emit(SaveBookingState.error(draft: draft, message: 'error.default'));
    }
  }
}
