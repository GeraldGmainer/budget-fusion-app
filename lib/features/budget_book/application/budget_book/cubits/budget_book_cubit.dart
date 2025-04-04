import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/base/budget_view_data.dart';
import '../../../domain/entities/budget_book_filter.dart';
import '../../../domain/enums/budget_view_mode.dart';
import '../../../domain/enums/period_mode.dart';
import '../use_cases/filter_and_group_bookings_use_case.dart';
import '../use_cases/generate_budget_summary_use_case.dart';
import '../use_cases/reset_budget_book_use_case.dart';

part 'budget_book_cubit.freezed.dart';
part 'budget_book_state.dart';

@injectable
class BudgetBookCubit extends Cubit<BudgetBookState> {
  final GenerateBudgetSummaryUseCase _generateBudgetSummaryUseCase;
  final FilterAndGroupBookingsUseCase _filterAndGroupBookingsUseCase;
  final WatchBookingsUseCase _watchBookingsUseCase;
  final ResetBudgetBookUseCase _resetBudgetBookUseCase;

  BudgetBookCubit(
    this._generateBudgetSummaryUseCase,
    this._filterAndGroupBookingsUseCase,
    this._watchBookingsUseCase,
    this._resetBudgetBookUseCase,
  ) : super(BudgetBookState.initial(filter: BudgetBookFilter.initial(), period: PeriodMode.month));

  Future<void> load() async {
    DomainLogger.instance.d(runtimeType.toString(), "initiate load for budget book: ${state.viewMode} / ${state.filter}");
    await _reload(state.filter, state.viewMode);
  }

  Future<void> updateView({BudgetBookFilter? filter, BudgetViewMode? viewMode}) async {
    final newViewMode = viewMode ?? state.viewMode;
    final newFilter = filter ?? state.filter;
    DomainLogger.instance.d(runtimeType.toString(), "update view for budget book: $newViewMode / $newFilter");
    await _reload(newFilter, newViewMode);
  }

  Future<void> resetAndLoad() async {
    DomainLogger.instance.d(runtimeType.toString(), "reset and load load for budget book: ${state.viewMode} / ${state.filter}");
    emit(BudgetBookState.loading(items: [], filter: state.filter, viewMode: state.viewMode, period: state.period));
    await _resetBudgetBookUseCase();
    await _reload(state.filter, state.viewMode);
  }

  Future<void> _reload(BudgetBookFilter newFilter, BudgetViewMode newViewMode, {bool emitLoading = true}) async {
    try {
      if (emitLoading) {
        emit(BudgetBookState.loading(items: state.items, filter: newFilter, viewMode: newViewMode, period: state.period));
      }
      final rawItems = await _watchBookingsUseCase().first;
      print("rawItems ${rawItems.length}");
      print(rawItems.last);
      final items = await _filterAndGroupBookingsUseCase(rawItems, newFilter);
      final summaries = await _generateBudgetSummaryUseCase(items);
      emit(BudgetBookState.loaded(items: summaries, filter: newFilter, viewMode: newViewMode, period: state.period));
      DomainLogger.instance.d(runtimeType.toString(), "loading budget book done");
    } on TranslatedException catch (e, stackTrace) {
      BudgetLogger.instance.e("${runtimeType.toString()} TranslatedException", e, stackTrace);
      emit(BudgetBookState.fromError(message: e.message, state: state));
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("${runtimeType.toString()} Exception", e, stackTrace);
      emit(BudgetBookState.fromError(message: 'error.default', state: state));
    }
  }
}
