class FeatureConstants {
  /// short cache time so that multiple domain can share the same of syncAll, in case syncAll request is faster than other domain loading time
  static const Duration syncAllCacheDuration = Duration(seconds: 5);

  /// Sync offline backoff time to ignore all sync requests after certain time of being offline
  static const Duration syncOfflineBackoff = Duration(seconds: 10);

  /// debounce to reduce stream emits
  static const Duration mapperDebounceDuration = Duration(milliseconds: 250);

  ///
  static const queueNetworkRetryDelay = Duration(seconds: 2);

  /// Queue retry delay
  static const Duration queueRetryDelay = Duration(seconds: 5);

  /// Queue retry count
  static const int queueRetryCount = 3;

  static const int descriptionMaxLength = 20;
  static const notFoundIconName = "not_found";
  static const notFoundIconColor = "B2BEB5";

  /// Hide Icon in the pie chart when pie is too small
  static const hideIconInPiePercent = 7.0;
}
