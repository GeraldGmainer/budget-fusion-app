import 'package:injectable/injectable.dart';

import '../../../utils/utils.dart';
import '../../core.dart';
import 'sync_all_response.dart';

@lazySingleton
class SyncRemoteSource extends SupabaseClient {
  Future<SyncAllResponse> syncAll({
    required Map<String, String> cursors,
    required Iterable<EntityType> entities,
  }) async {
    final payload = <String, String>{};
    for (final e in entities) {
      final v = cursors[e.name];
      if (v != null) payload[e.name] = v;
    }

    final stopwatch = Stopwatch()..start();
    _log("call syncAll: ${payload.entries.map((e) => '${e.key}:${e.value.substring(0, 10)}').join(', ')}");
    return execute("syncAll", () async {
      final response = await supabase.rpc('sync_all', params: {'p_last_synced': payload});
      final data = response as Map<String, dynamic>;
      final result = SyncAllResponse.fromJson(data);
      _log('syncAll', stopwatch: stopwatch, dark: true);
      return result;
    });
  }

  _log(String msg, {Stopwatch? stopwatch, bool dark = false}) {
    if (stopwatch != null) {
      EntityLogger.instance.d("SyncRemoteSource", "sync", "$msg -> took ${stopwatch.elapsed.inMilliseconds} ms", darkColor: dark);
    } else {
      EntityLogger.instance.d("SyncRemoteSource", "sync", msg, darkColor: dark);
    }
  }
}
