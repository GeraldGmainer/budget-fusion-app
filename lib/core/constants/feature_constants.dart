import 'dart:math';

import 'package:flutter/foundation.dart';

class FeatureConstants {
  /// use card design
  static const bool useCard = false;

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

  /// Realtime debounce duration to reload data managers
  static const Duration realtimeDebounceDuration = Duration(milliseconds: 250);

  static const int descriptionMaxLength = 20;
  static const notFoundIconName = "not_found";
  static const notFoundIconColor = "B2BEB5";

  /// Hide Icon in the pie chart when pie is too small
  static const hideIconInPiePercent = 7.0;

  /// Max Chars per failed queue item error message, which might be visible in EntityMetaDisplay widet
  static const errorMaxCharLength = 300;

  /// Artificial network delay (for dev/testing).
  static Duration randomNetworkDelay() {
    return kReleaseMode ? Duration.zero : Duration(milliseconds: Random().nextInt(500) + 1000);
  }

  /// enable Sentry logs and monitoring
  static const bool useSentry = true;

  // static const bool useSentry = kReleaseMode

  /// minimum loading time to show loading indicator
  static const Duration loadingIndicatorMinDuration = Duration(milliseconds: 5000);
}
