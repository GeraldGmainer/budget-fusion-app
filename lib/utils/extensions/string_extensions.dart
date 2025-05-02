extension NullableStringX on String? {
  bool get isNullOrEmpty => this?.trim().isEmpty ?? true;

  bool get isNotNullOrEmpty => !isNullOrEmpty;
}
