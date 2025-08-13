import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_dto.freezed.dart';

part 'category_dto.g.dart';

@freezed
class CategoryDto with _$CategoryDto implements Dto {
  const CategoryDto._();

  const factory CategoryDto({
    @UuidSerializer() required Uuid id,
    required String name,
    @JsonKey(name: 'category_type') @CategoryTypeSerializer() required CategoryType categoryType,
    @JsonKey(name: 'icon_name') required String iconName,
    @JsonKey(name: 'icon_color') required String iconColor,
    @JsonKey(name: 'parent_id') @UuidSerializer() required Uuid? parentId,
    @SyncStatusSerializer() @JsonKey(name: 'sync_status') required SyncStatus? syncStatus,
    @DateTimeSerializer() @JsonKey(name: 'created_at') required DateTime? createdAt,
    @DateTimeSerializer() @JsonKey(name: 'updated_at') required DateTime? updatedAt,
    @DateTimeSerializer() @JsonKey(name: 'deleted_at') required DateTime? deletedAt,
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, dynamic> json) => _$CategoryDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$$CategoryDtoImplToJson(this as _$CategoryDtoImpl);
}
