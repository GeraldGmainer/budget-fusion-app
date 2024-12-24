import 'package:budget_fusion_app/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/domain.dart';

part 'booking_filter_bloc.freezed.dart';
part 'booking_filter_event.dart';
part 'booking_filter_state.dart';

@injectable
class BookingFilterBloc extends Bloc<BookingFilterEvent, BookingFilterState> {
  BookingFilterBloc() : super(const BookingFilterState()) {
    on<BookingFilterEvent>((event, emit) {
      event.when(
        setAccount: (account) => _onSetAccount(emit, account),
        setTransaction: (transaction) => _onSetTransaction(emit, transaction),
        setPeriod: (period) => _onSetPeriod(emit, period),
        resetFilters: () => _onResetFilters(emit),
      );
    });
  }

  void _onSetAccount(Emitter<BookingFilterState> emit, Account? account) {
    emit(state.copyWith(selectedAccount: account));
  }

  void _onSetTransaction(Emitter<BookingFilterState> emit, TransactionType transaction) {
    emit(state.copyWith(selectedTransaction: transaction));
  }

  void _onSetPeriod(Emitter<BookingFilterState> emit, PeriodMode period) {
    emit(state.copyWith(selectedPeriod: period));
  }

  void _onResetFilters(Emitter<BookingFilterState> emit) {
    emit(const BookingFilterState());
  }
}
