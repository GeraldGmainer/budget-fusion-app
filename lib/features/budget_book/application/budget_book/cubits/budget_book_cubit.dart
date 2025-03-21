import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/budget_book/application/budget_book/use_cases/fetch_and_group_budget_book_data_use_case.dart';
import 'package:budget_fusion_app/features/budget_book/application/budget_book/use_cases/generate_budget_summary_use_case.dart';
import 'package:budget_fusion_app/features/budget_book/domain/entities/budget_page_data.dart';
import 'package:budget_fusion_app/shared/application/use_cases/get_currency_use_case.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/budget_book_filter.dart';
import '../../../domain/entities/summary_view_data.dart';
import '../../../domain/enums/budget_view_mode.dart';
import '../use_cases/filter_bookings_use_case.dart';

part 'budget_book_cubit.freezed.dart';
part 'budget_book_state.dart';

@injectable
class BudgetBookCubit extends Cubit<BudgetBookState> {
  final FetchAndGroupBudgetBookDataUseCase _fetchAndGroupBudgetBookDataUseCase;
  final GenerateBudgetSummaryUseCase _generateBudgetSummaryUseCase;
  final GetCurrencyUseCase _getCurrencyUseCase;
  final FilterBookingsUseCase _filterBookingsUseCase;

  BudgetBookCubit(this._fetchAndGroupBudgetBookDataUseCase, this._generateBudgetSummaryUseCase, this._getCurrencyUseCase, this._filterBookingsUseCase)
      : super(BudgetBookState.initial(currentFilter: BudgetBookFilter.initial(), currentViewMode: BudgetViewMode.summary));

  Future<void> load(BudgetBookFilter filter, BudgetViewMode viewMode) async {
    try {
      emit(BudgetBookState.loading(rawItems: state.rawItems, summaries: state.summaries, currentFilter: filter, currentViewMode: viewMode));
      final results = await Future.wait([_fetchAndGroupBudgetBookDataUseCase(), _getCurrencyUseCase()]);
      final rawItems = results[0] as List<BudgetPageData>;
      final currency = results[1] as Currency;
      final filteredItems = _filterBookingsUseCase.execute(rawItems, filter);
      final summaries = _generateBudgetSummaryUseCase(filteredItems, currency);
      emit(BudgetBookState.loaded(rawItems: rawItems, summaries: summaries, currentFilter: filter, currentViewMode: viewMode));
    } on TranslatedException catch (e, stackTrace) {
      BudgetLogger.instance.e("BudgetBookCubit Exception", e, stackTrace);
      emit(BudgetBookState.fromError(message: e.message, state: state));
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("BudgetBookCubit Exception", e, stackTrace);
      emit(BudgetBookState.fromError(message: 'error.default', state: state));
    }
  }

  Future<void> updateView({BudgetBookFilter? filter, BudgetViewMode? viewMode}) async {
    final rawItems = state.rawItems;
    final newFilter = filter ?? state.currentFilter;
    final newViewMode = viewMode ?? state.currentViewMode;
    emit(BudgetBookState.loading(rawItems: rawItems, summaries: state.summaries, currentFilter: newFilter, currentViewMode: newViewMode));

    final currency = await _getCurrencyUseCase();
    final filteredItems = _filterBookingsUseCase.execute(rawItems, newFilter);
    final summaries = _generateBudgetSummaryUseCase(filteredItems, currency);
    emit(BudgetBookState.loaded(
      rawItems: rawItems,
      summaries: summaries,
      currentFilter: newFilter,
      currentViewMode: newViewMode,
    ));
  }
}
