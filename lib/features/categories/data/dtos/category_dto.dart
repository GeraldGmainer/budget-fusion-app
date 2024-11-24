import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_dto.freezed.dart';
part 'category_dto.g.dart';

@freezed
class CategoryDto with _$CategoryDto {
  const CategoryDto._();

  const factory CategoryDto({
    required int id,
    required String name,
    @JsonKey(name: 'icon_name') required String iconName,
    @JsonKey(name: 'icon_color') required String iconColor,
    @JsonKey(name: 'category_type') required String categoryType,
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, dynamic> json) => _$CategoryDtoFromJson(json);

  Category toDomain() {
    return Category(
      id: id,
      name: name,
      iconName: iconName,
      iconColor: iconColor,
      categoryType: categoryType == "income" ? CategoryType.income : CategoryType.outcome,
    );
  }
}
