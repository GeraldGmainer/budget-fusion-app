import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_dto.freezed.dart';
part 'category_dto.g.dart';

@freezed
abstract class CategoryDto with _$CategoryDto implements Dto {
  const CategoryDto._();

  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory CategoryDto({
    @UuidSerializer() required Uuid id,
    required String name,
    @CategoryTypeSerializer() required CategoryType categoryType,
    required String iconName,
    required String iconColor,
    @UuidSerializer() required Uuid? parentId,
    @SyncStatusSerializer() required SyncStatus? syncStatus,
    @DateTimeSerializer() required DateTime? createdAt,
    @DateTimeSerializer() required DateTime? updatedAt,
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, dynamic> json) => _$CategoryDtoFromJson(json);
}
