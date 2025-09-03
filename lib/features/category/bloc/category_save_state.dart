part of 'category_save_cubit.dart';

@freezed
abstract class CategorySaveState with _$CategorySaveState {
  factory CategorySaveState.initial({required CategoryDraft draft}) = _Initial;

  factory CategorySaveState.draftUpdate({required CategoryDraft draft, required CategoryDraft initialDraft}) = _DraftUpdate;

  const factory CategorySaveState.loading({required CategoryDraft draft}) = _Loading;

  const factory CategorySaveState.saved({required CategoryDraft draft}) = _Loaded;

  const factory CategorySaveState.deleted({required CategoryDraft draft}) = _Deleted;

  const factory CategorySaveState.error({required CategoryDraft draft, required AppError error}) = _Error;
}

extension CategorySaveStateX on CategorySaveState {
  CategoryDraft? get initialDraft => whenOrNull(draftUpdate: (_, CategoryDraft initialDraft) => initialDraft);
}
