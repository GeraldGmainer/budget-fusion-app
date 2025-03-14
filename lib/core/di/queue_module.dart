import 'package:injectable/injectable.dart';

import '../../features/profile/profile.dart';
import '../core.dart';

@module
abstract class QueueModule {
  @lazySingleton
  List<QueueItemProcessor> provideQueueProcessors(
    ProfileQueueItemProcessor profileProcessor,
  ) {
    return [
      profileProcessor,
    ];
  }
}
