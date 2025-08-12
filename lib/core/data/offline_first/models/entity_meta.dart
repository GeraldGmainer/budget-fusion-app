import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity_meta.freezed.dart';

@freezed
class EntityMeta with _$EntityMeta {
  const factory EntityMeta({
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    @Default(false) bool isPending,
    @Default(false) bool isFailed,
    @Default(0) int attempts,
  }) = _EntityMeta;
}
