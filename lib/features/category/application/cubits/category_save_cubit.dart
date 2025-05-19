import 'package:bloc/bloc.dart';
import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/category_draft.dart';
import '../use_cases/delete_category_use_case.dart';
import '../use_cases/load_category_use_case.dart';
import '../use_cases/save_category_use_case.dart';

part 'category_save_cubit.freezed.dart';
part 'category_save_state.dart';

@injectable
class CategorySaveCubit extends Cubit<CategorySaveState> {
  final SaveCategoryUseCase _saveCategoryUseCase;
  final DeleteCategoryUseCase _deleteCategoryUseCase;
  final LoadCategoryUseCase _loadCategoryUseCase;

  CategorySaveCubit(this._saveCategoryUseCase, this._deleteCategoryUseCase, this._loadCategoryUseCase)
    : super(CategorySaveState.initial(draft: CategoryDraft.initial()));

  Future<void> init(CategoryDraft draft) async {
    try {
      emit(CategorySaveState.draftUpdate(draft: draft, initialDraft: draft));
    } on TranslatedException catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} init TranslatedException", e, stack);
      emit(CategorySaveState.error(draft: state.draft, error: e.error));
    } catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} init Exception", e, stack);
      emit(CategorySaveState.error(draft: state.draft, error: AppError.unknown));
    }
  }

  void updateDraft(CategoryDraft Function(CategoryDraft) update) {
    emit(state.copyWith(draft: update(state.draft)));
  }

  Future<void> refresh() async {
    try {
      final id = state.draft.id;
      if (id == null) {
        BudgetLogger.instance.e("${runtimeType.toString()} RefreshException", "CategoryDraft ID is NULL");
        return;
      }
      final category = await _loadCategoryUseCase(id);
      if (category == null) {
        BudgetLogger.instance.e("${runtimeType.toString()} RefreshException", "found Category by ID is NULL");
        return;
      }
      final newDraft = CategoryDraft.fromCategory(category);
      emit(CategorySaveState.draftUpdate(draft: newDraft, initialDraft: newDraft));
    } on TranslatedException catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} refresh TranslatedException", e, stack);
      emit(CategorySaveState.error(draft: state.draft, error: e.error));
    } catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} refresh Exception", e, stack);
      emit(CategorySaveState.error(draft: state.draft, error: AppError.unknown));
    }
  }

  Future<void> save() async {
    final draft = state.draft;
    emit(CategorySaveState.loading(draft: draft));
    try {
      await _saveCategoryUseCase(draft);
      emit(CategorySaveState.saved(draft: draft));
    } on TranslatedException catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} save TranslatedException", e, stack);
      emit(CategorySaveState.error(draft: draft, error: e.error));
    } catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} save Exception", e, stack);
      emit(CategorySaveState.error(draft: draft, error: AppError.unknown));
    }
  }

  Future<void> delete() async {
    final draft = state.draft;
    try {
      await _deleteCategoryUseCase(draft);
      emit(CategorySaveState.deleted(draft: draft));
    } on TranslatedException catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} delete TranslatedException", e, stack);
      emit(CategorySaveState.error(draft: draft, error: e.error));
    } catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} delete Exception", e, stack);
      emit(CategorySaveState.error(draft: draft, error: AppError.unknown));
    }
  }
}
