part of 'entity_meta_cubit.dart';

@freezed
class EntityMetaState with _$EntityMetaState {
  const factory EntityMetaState.loading() = _Loading;

  const factory EntityMetaState.created() = _Created;

  const factory EntityMetaState.upserted(EntityMeta meta) = _Upserted;

  const factory EntityMetaState.deleted() = _Deleted;

  const factory EntityMetaState.error({required String message, required QueueTaskType taskType}) = _Error;
}
