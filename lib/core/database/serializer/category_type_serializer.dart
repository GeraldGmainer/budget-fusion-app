import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/singletons/budget_logger.dart';
import 'package:json_annotation/json_annotation.dart';

class CategoryTypeSerializer implements JsonConverter<CategoryType, String> {
  const CategoryTypeSerializer();

  @override
  CategoryType fromJson(String json) {
    if (json.toLowerCase() == "outcome") {
      return CategoryType.outcome;
    }
    if (json.toLowerCase() == "income") {
      return CategoryType.income;
    }
    BudgetLogger.instance.i("CategoryTypeSerializer: unknown CategoryType: $json");
    throw MappingException(AppError.invalidCategoryType);
  }

  @override
  String toJson(CategoryType type) {
    switch (type) {
      case CategoryType.outcome:
        return "outcome";

      case CategoryType.income:
        return "income";
    }
  }
}
