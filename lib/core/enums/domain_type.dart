enum DomainType {
  profile,
  profileSetting,
  account,
  category,
  booking;

  static DomainType fromString(String value) {
    return DomainType.values.firstWhere((e) => e.name == value, orElse: () => throw Exception("Invalid domain type: $value"));
  }
}
