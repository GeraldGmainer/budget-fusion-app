import 'package:bloc/bloc.dart';
import 'package:budget_fusion_app/features/category/use_cases/load_category_list_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/core.dart';
import '../../../shared/shared.dart';
import '../../../utils/utils.dart';

part 'category_list_cubit.freezed.dart';
part 'category_list_state.dart';

@injectable
class CategoryListCubit extends Cubit<LoadableState<List<Category>>> {
  final LoadCategoryListUseCase _categoryListUseCase;

  CategoryListCubit(this._categoryListUseCase) : super(const LoadableState.initial());

  Future<void> load({bool clearCache = false}) async {
    try {
      emit(LoadableState.loading());
      final categories = await _categoryListUseCase.load(clearCache);
      emit(LoadableState.loaded(categories));
    } on TranslatedException catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} init TranslatedException", e, stack);
      emit(LoadableState.error(e.error));
    } catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} init Exception", e, stack);
      emit(LoadableState.error(AppError.unknown));
    }
  }
}
