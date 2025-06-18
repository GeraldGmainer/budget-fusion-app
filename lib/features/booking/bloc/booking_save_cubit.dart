import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/booking/use_cases/default_new_date_use_case.dart';
import 'package:budget_fusion_app/features/budget_book/enums/period_mode.dart';
import 'package:budget_fusion_app/features/budget_book/view_models/budget_date_range.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../domain/entities/booking_draft.dart';
import '../use_cases/default_account_use_case.dart';
import '../use_cases/save_booking_use_case.dart';

part 'booking_save_cubit.freezed.dart';
part 'booking_save_state.dart';

@injectable
class BookingSaveCubit extends ErrorHandledCubit<BookingSaveState> {
  final DefaultAccountUseCase _defaultAccountUseCase;
  final DefaultNewDateUseCase _defaultNewDateUseCase;
  final SaveBookingUseCase _saveBookingUseCase;
  final BookingDataManager _bookingDataManager;

  BookingSaveCubit(this._saveBookingUseCase, this._defaultAccountUseCase, this._bookingDataManager, this._defaultNewDateUseCase)
    : super(BookingSaveState.initial(draft: _initialDraft()));

  static BookingDraft _initialDraft({Account? account, DateTime? date}) {
    return BookingDraft(date: date ?? DateTime.now(), amount: Decimal.zero, account: account);
  }

  Future<void> init(Booking? booking, BudgetDateRange dateRange, PeriodMode period) => safeRun(
    action: () async {
      late BookingDraft draft;
      if (booking == null) {
        final defaultAccount = await _defaultAccountUseCase.get();
        final date = _defaultNewDateUseCase.get(dateRange, period);
        draft = _initialDraft(account: defaultAccount, date: date);
      } else {
        draft = BookingDraft.fromBooking(booking);
      }
      emit(BookingSaveState.draftUpdate(draft: draft, initialDraft: draft));
    },
    onError: (e, appError) => BookingSaveState.error(draft: state.draft, error: appError),
  );

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
