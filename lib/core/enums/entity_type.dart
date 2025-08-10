enum EntityType {
  currency,
  profile,
  account,
  category,
  booking;

  static String _toSnakeCase(String input) => input.replaceAllMapped(RegExp(r'[A-Z]'), (m) => '_${m.group(0)!.toLowerCase()}');

  String get text => _toSnakeCase(name);

  static EntityType fromString(String value) {
    final core = value.trim().split('.').last;
    final norm = core.replaceAll(RegExp(r'[^a-zA-Z]'), '').toLowerCase();
    for (final e in EntityType.values) {
      if (e.name.toLowerCase() == norm) return e;
    }
    throw Exception("Invalid entity type: $value");
  }

  static EntityType? tryParse(String value) {
    final core = value.trim().split('.').last;
    final norm = core.replaceAll(RegExp(r'[^a-zA-Z]'), '').toLowerCase();
    for (final e in EntityType.values) {
      if (e.name.toLowerCase() == norm) return e;
    }
    return null;
  }
}

extension EntityTypeX on EntityType {
  bool get realtimeEnabled {
    switch (this) {
      case EntityType.currency:
        return false;
      default:
        return true;
    }
  }
}
