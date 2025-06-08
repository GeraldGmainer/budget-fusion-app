import 'package:budget_fusion_app/features/category/use_cases/load_category_list_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/core.dart';

part 'category_list_cubit.freezed.dart';
part 'category_list_state.dart';

@injectable
class CategoryListCubit extends ErrorHandledCubit<LoadableState<List<Category>>> {
  final LoadCategoryListUseCase _categoryListUseCase;

  CategoryListCubit(this._categoryListUseCase) : super(const LoadableState.initial());

  Future<void> load({bool clearCache = false}) => safeCall(
    call: () async {
      emit(LoadableState.loading());
      return await _categoryListUseCase.load(clearCache);
    },
    onSuccess: (data) => emit(LoadableState.loaded(data)),
    onError: (e, appError) => LoadableState.error(appError),
  );
}
