import '../models/queue_item.dart';

abstract class QueueItemProcessor {
  String get domainKey;

  Future<void> processItem(QueueItem item);
}
