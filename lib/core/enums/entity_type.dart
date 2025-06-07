enum EntityType {
  profile,
  profileSetting,
  account,
  category,
  booking;

  static String _toSnakeCase(String input) => input.replaceAllMapped(RegExp(r'[A-Z]'), (m) => '_${m.group(0)!.toLowerCase()}');

  String get text => _toSnakeCase(name);

  static EntityType fromString(String value) {
    return EntityType.values.firstWhere((e) => e.name == value, orElse: () => throw Exception("Invalid entity type: $value"));
  }
}
