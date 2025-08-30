import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity_meta.freezed.dart';

@freezed
abstract class EntityMeta with _$EntityMeta {
  const factory EntityMeta({
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    @Default(false) bool isPending,
    @Default(false) bool isPendingDelete,
    @Default(0) int attempts,
  }) = _EntityMeta;
}
