import 'package:bloc/bloc.dart';
import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/category_draft.dart';
import '../use_cases/delete_category_use_case.dart';
import '../use_cases/save_category_use_case.dart';

part 'category_save_cubit.freezed.dart';
part 'category_save_state.dart';

@injectable
class CategorySaveCubit extends Cubit<CategorySaveState> {
  final SaveCategoryUseCase _saveCategoryUseCase;
  final DeleteCategoryUseCase _deleteCategoryUseCase;

  CategorySaveCubit(this._saveCategoryUseCase, this._deleteCategoryUseCase) : super(CategorySaveState.initial(draft: _initialDraft()));

  static CategoryDraft _initialDraft() {
    return CategoryDraft();
  }

  Future<void> init(Category? category) async {
    try {
      if (category == null) {
        emit(CategorySaveState.draftUpdate(draft: _initialDraft()));
      } else {
        emit(CategorySaveState.draftUpdate(draft: CategoryDraft.fromCategory(category)));
      }
    } on TranslatedException catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} init TranslatedException", e, stack);
      emit(CategorySaveState.error(draft: state.draft, message: e.message));
    } catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} init Exception", e, stack);
      emit(CategorySaveState.error(draft: state.draft, message: 'error.default'));
    }
  }

  void updateDraft(CategoryDraft Function(CategoryDraft) update) {
    emit(state.copyWith(draft: update(state.draft)));
  }

  Future<void> save() async {
    final draft = state.draft;
    emit(CategorySaveState.loading(draft: draft));
    try {
      await _saveCategoryUseCase(draft);
      emit(CategorySaveState.loaded(draft: draft));
    } on TranslatedException catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} save TranslatedException", e, stack);
      emit(CategorySaveState.error(draft: draft, message: e.message));
    } catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} save Exception", e, stack);
      emit(CategorySaveState.error(draft: draft, message: 'error.default'));
    }
  }

  Future<void> delete(Category? category) async {
    final draft = state.draft;
    try {
      await _deleteCategoryUseCase(category!);
      emit(CategorySaveState.deleted(draft: draft, category: category));
    } on TranslatedException catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} delete TranslatedException", e, stack);
      emit(CategorySaveState.error(draft: draft, message: e.message));
    } catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} delete Exception", e, stack);
      emit(CategorySaveState.error(draft: draft, message: 'error.default'));
    }
  }

  void dispose() {
    emit(CategorySaveState.initial(draft: _initialDraft()));
  }
}
