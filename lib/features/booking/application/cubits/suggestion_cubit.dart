import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/dtos/booking_suggestion_dto.dart';
import '../use_cases/load_suggestions_use_case.dart';

@injectable
class SuggestionCubit extends Cubit<LoadableState<List<BookingSuggestionDto>>> {
  final LoadSuggestionsUseCase _loadSuggestionsUseCase;

  SuggestionCubit(this._loadSuggestionsUseCase) : super(const LoadableState.initial());

  Future<void> load() async {
    emit(LoadableState.loading());
    BudgetLogger.instance.d("${runtimeType.toString()} load suggestions", short: true);
    try {
      final suggestions = await _loadSuggestionsUseCase();
      emit(LoadableState.loaded(suggestions));
    } on TranslatedException catch (e, stackTrace) {
      BudgetLogger.instance.e("${runtimeType.toString()} TranslatedException", e, stackTrace);
      emit(LoadableState.error(e.error));
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("${runtimeType.toString()} Exception", e, stackTrace);
      emit(const LoadableState.error(AppError.unknown));
    }
  }
}
