import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../serializer/category_type_serializer.dart';

part 'category_dto.freezed.dart';
part 'category_dto.g.dart';

@freezed
class CategoryDto with _$CategoryDto implements OfflineFirstDto {
  const CategoryDto._();

  const factory CategoryDto({
    @UuidSerializer() required Uuid id,
    @JsonKey(name: 'user_id') @UuidSerializer() required Uuid userId,
    required String name,
    @JsonKey(name: 'category_type') @CategoryTypeSerializer() required CategoryType categoryType,
    @JsonKey(name: 'icon_name') required String iconName,
    @JsonKey(name: 'icon_color') required String iconColor,
    @JsonKey(name: 'parent_id') @UuidSerializer() required Uuid? parentId,
    @JsonKey(name: 'updated_at') @DateTimeSerializer() required DateTime updatedAt,
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, dynamic> json) => _$CategoryDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$$CategoryDtoImplToJson(this as _$CategoryDtoImpl);
}
