import 'package:budget_fusion_app/core/core.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

enum CategoryType {
  income,
  outcome;

  static CategoryType fromString(String value) {
    return CategoryType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => throw MappingException(AppError.invalidCategoryType, "CategoryType.fromString: unknown CategoryType: $value"),
    );
  }
}

extension CategoryTypeExtensions on CategoryType {
  String get label {
    switch (this) {
      case CategoryType.income:
        return "booking.enums.categoryType.income";
      case CategoryType.outcome:
        return "booking.enums.categoryType.outcome";
    }
  }

  Color get color {
    switch (this) {
      case CategoryType.income:
        return AppColors.incomeColor;
      case CategoryType.outcome:
        return AppColors.outcomeColor;
    }
  }

  IconData get icon {
    switch (this) {
      case CategoryType.income:
        return CommunityMaterialIcons.cash_plus;
      case CategoryType.outcome:
        return CommunityMaterialIcons.cash_minus;
    }
  }
}
