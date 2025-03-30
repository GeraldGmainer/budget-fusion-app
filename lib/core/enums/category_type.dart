import 'package:budget_fusion_app/core/core.dart';
import 'package:flutter/material.dart';

enum CategoryType {
  income,
  outcome;

  static CategoryType fromString(String value) {
    return CategoryType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => throw Exception("Invalid category type: $value"),
    );
  }
}

extension CategoryTypeExtensions on CategoryType {
  String get text {
    switch (this) {
      case CategoryType.income:
        return "booking.income_type";
      case CategoryType.outcome:
        return "booking.outcome_type";
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
}
