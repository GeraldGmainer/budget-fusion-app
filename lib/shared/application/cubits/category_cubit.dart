import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../use_cases/load_categories_use_case.dart';
import '../use_cases/watch_categories_use_case.dart';

@injectable
class CategoryCubit extends Cubit<LoadableState<List<Category>>> {
  final WatchCategoriesUseCase _watchCategories;
  final LoadCategoriesUseCase _loadCategories;
  StreamSubscription? _sub;

  CategoryCubit(this._watchCategories, this._loadCategories) : super(const LoadableState.initial()) {
    _startWatching();
  }

  void _startWatching() {
    _sub?.cancel();
    _sub = _watchCategories().listen(
      (accounts) => emit(LoadableState.loaded(accounts)),
      onError: (error) => emit(LoadableState.error(error is TranslatedException ? error.error : AppError.unknown)),
    );
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }

  Future<void> load({String? userId, bool clearCache = false}) async {
    try {
      DomainLogger.instance.d(runtimeType.toString(), DomainType.category.name, "initiate load");
      emit(const LoadableState.loading());
      await _loadCategories(clearCache);
    } on TranslatedException catch (e, stackTrace) {
      BudgetLogger.instance.e("${runtimeType.toString()} TranslatedException", e, stackTrace);
      emit(LoadableState.error(e.error));
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("${runtimeType.toString()} Exception", e, stackTrace);
      emit(LoadableState.error(AppError.unknown));
    }
  }
}
