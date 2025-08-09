class FeatureConstants {
  /// short cache time so that multiple domain can share the same of syncAll, in case syncAll request is faster than other domain loading time
  static const Duration syncAllCacheDuration = Duration(seconds: 5);

  /// debounce to reduce stream emits
  static const Duration mapperDebounceDuration = Duration(milliseconds: 250);
  static const int descriptionMaxLength = 20;
  static const notFoundIconName = "not_found";
  static const notFoundIconColor = "B2BEB5";
  static const hideIconInPiePercent = 7.0;
}
