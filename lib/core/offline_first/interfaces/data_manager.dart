import 'dart:async';

import '../../../app/stream_life_cycle.dart';

abstract class DataManager<T> {
  Future<List<T>> loadAll({Map<String, dynamic>? filters});

  Stream<List<T>> watch();

  Future<List<T>> getAll() => watch().first;
}

mixin AutoSubscribe<T> on DataManager<T> implements StreamLifecycle {
  late final StreamSubscription<List<T>> _sub;

  @override
  void setupStreams() {
    // kick off the watch() stream so it fires its local + remote sync
    _sub = watch().listen((_) {});
  }

  @override
  Future<void> disposeStreams() async {
    await _sub.cancel();
  }
}
