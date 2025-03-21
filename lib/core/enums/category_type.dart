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
