import 'dart:async';

import 'package:budget_fusion_app/features/category/use_cases/load_category_list_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/core.dart';
import '../../../repos/category/category.dart';

part 'category_list_cubit.freezed.dart';
part 'category_list_state.dart';

@injectable
class CategoryListCubit extends ErrorHandledCubit<LoadableState<List<Category>>> {
  final LoadCategoryListUseCase _categoryListUseCase;
  StreamSubscription<List<Category>>? _sub;

  CategoryListCubit(this._categoryListUseCase) : super(const LoadableState.initial()) {
    _sub?.cancel();
    emit(const LoadableState.loading());
    _sub = _categoryListUseCase.watch().listen(
      (data) => emit(LoadableState.loaded(data)),
      onError: (_) => emit(LoadableState.error(AppError.unknown)),
    );
  }

  @override
  Future<void> close() async {
    await _sub?.cancel();
    return super.close();
  }

  Future<void> load({bool clearCache = false}) => safeRun(
    action: () async => await _categoryListUseCase.load(clearCache),
    onError: (e, appError) => LoadableState.error(appError),
  );
}
