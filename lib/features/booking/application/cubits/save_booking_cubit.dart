import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/booking/domain/entities/booking_draft.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../use_cases/save_booking_use_case.dart';

part 'save_booking_cubit.freezed.dart';
part 'save_booking_state.dart';

@injectable
class SaveBookingCubit extends Cubit<SaveBookingState> {
  final SaveBookingUseCase _saveBookingUseCase;

  SaveBookingCubit(this._saveBookingUseCase) : super(SaveBookingState.initial(draft: _initialDraft()));

  static BookingDraft _initialDraft() {
    return BookingDraft(date: DateTime.now(), amount: Decimal.zero);
  }

  void init(Booking? booking) {
    emit(SaveBookingState.initial(draft: booking == null ? _initialDraft() : BookingDraft.fromBooking(booking)));
  }

  void updateDraft(BookingDraft Function(BookingDraft) update) {
    emit(state.copyWith(draft: update(state.draft)));
  }

  Future<void> save(BookingDraft draft) async {
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
