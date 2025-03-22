import 'package:injectable/injectable.dart';

import '../../features/profile/data/profile_queue_item_processor.dart';
import '../offline_first/queue/queue_item_processor.dart';

// TODO remove that
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
