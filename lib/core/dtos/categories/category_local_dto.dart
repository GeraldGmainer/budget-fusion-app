import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_local_dto.freezed.dart';
part 'category_local_dto.g.dart';

@freezed
class CategoryLocalDto with _$CategoryLocalDto implements OfflineFirstLocalDto {
  const CategoryLocalDto._();

  const factory CategoryLocalDto({
    required String id,
    required String name,
    required String categoryType,
    required String iconName,
    required String iconColor,
    required DateTime updatedAt,
  }) = _CategoryLocalDto;

  factory CategoryLocalDto.fromJson(Map<String, dynamic> json) => _$CategoryLocalDtoFromJson(json);

  factory CategoryLocalDto.fromMap(Map<String, Object?> row) {
    return CategoryLocalDto(
      id: row['id'] as String,
      name: row['name'] as String,
      categoryType: row['category_type'] as String,
      iconName: row['icon_name'] as String,
      iconColor: row['icon_color'] as String,
      updatedAt: DateTime.parse(row['updated_at'] as String),
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'category_type': categoryType,
      'icon_name': iconName,
      'icon_color': iconColor,
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  Category toDomain() {
    return Category(
      id: Uuid(id),
      name: name,
      categoryType: CategoryType.fromString(categoryType),
      iconName: iconName,
      iconColor: iconColor,
    );
  }
}
