import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../domain/entities/category_draft.dart';

part 'category_save_cubit.freezed.dart';
part 'category_save_state.dart';

@injectable
class CategorySaveCubit extends ErrorHandledCubit<CategorySaveState> {
  final CategoryDataManager _manager;

  CategorySaveCubit(this._manager) : super(CategorySaveState.initial(draft: CategoryDraft.initial()));

  Future<void> init(CategoryDraft draft) => safeRun(
    action: () async => emit(CategorySaveState.draftUpdate(draft: draft, initialDraft: draft)),
    onError: (e, appError) => CategorySaveState.error(draft: state.draft, error: appError),
  );

  void updateDraft(CategoryDraft Function(CategoryDraft) update) {
    emit(state.copyWith(draft: update(state.draft)));
  }

  Future<void> refresh() => safeRun(
    action: () async {
      final id = state.draft.id;
      if (id == null) {
        BudgetLogger.instance.e("${runtimeType.toString()} RefreshException", "CategoryDraft ID is NULL");
        return;
      }
      final category = await _manager.loadById(id);
      if (category == null) {
        BudgetLogger.instance.e("${runtimeType.toString()} RefreshException", "found Category by ID is NULL");
        return;
      }
      final newDraft = CategoryDraft.fromCategory(category);
      emit(CategorySaveState.draftUpdate(draft: newDraft, initialDraft: newDraft));
    },
    onError: (e, appError) => CategorySaveState.error(draft: state.draft, error: appError),
  );

  Future<void> save() => safeRun(
    action: () async {
      final CategoryDraft draft = state.draft;
      emit(CategorySaveState.loading(draft: draft));
      await _manager.save(draft.toCategory());
      emit(CategorySaveState.saved(draft: draft));
    },
    onError: (e, appError) => CategorySaveState.error(draft: state.draft, error: appError),
  );

  Future<void> delete() => safeRun(
    action: () async {
      final draft = state.draft;
      await _manager.delete(draft.toCategory());
      emit(CategorySaveState.deleted(draft: draft));
    },
    onError: (e, appError) => CategorySaveState.error(draft: state.draft, error: appError),
  );
}
