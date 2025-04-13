import 'package:budget_fusion_app/core/core.dart';
import 'package:json_annotation/json_annotation.dart';

class CategoryTypeSerializer implements JsonConverter<CategoryType, String> {
  const CategoryTypeSerializer();

  @override
  CategoryType fromJson(String json) {
    if (json.toUpperCase() == "OUTCOME") {
      return CategoryType.outcome;
    }
    if (json.toUpperCase() == "INCOME") {
      return CategoryType.income;
    }
    throw Exception("CategoryTypeSerializer: unknown CategoryType: $json");
  }

  @override
  String toJson(CategoryType object) {
    switch (object) {
      case CategoryType.outcome:
        return "OUTCOME";

      case CategoryType.income:
        return "INCOME";
    }
  }
}
