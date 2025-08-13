import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../utils/utils.dart';
import '../../core.dart';
import 'sync_all_response.dart';

@lazySingleton
class SyncRemoteSource extends SupabaseClient {
  Future<SyncAllResponse> syncAll({
    required Map<String, String> cursors,
    required Iterable<EntityType> entities,
    Set<String> excludeIds = const {},
  }) async {
    final payload = <String, String>{};
    for (final e in entities) {
      final v = cursors[e.name];
      if (v != null) payload[e.name] = v;
    }

    final stopwatch = Stopwatch()..start();
    _log("call syncAll: ${payload.entries.map((e) => '${e.key}:${e.value.substring(0, 10)}').join(', ')}");
    return execute("syncAll", () async {
      final excludeJson = excludeIds.toList();
      if (excludeIds.isNotEmpty) {
        _log("exclude IDs: $excludeJson");
      }
      final response = await supabase.rpc('sync_all', params: {'p_last_synced': payload, 'p_exclude_ids': excludeJson});
      final data = response as Map<String, dynamic>;
      final result = SyncAllResponse.fromJson(data);
      result.deltas.forEach((key, value) {
        if (key == EntityType.booking.name) {
          BudgetLogger.instance.i(value.upserts);
          BudgetLogger.instance.i(value.deletes);
        }
      });

      final kB = (utf8.encode(jsonEncode(data)).length / 1024).toStringAsFixed(1);
      _log('syncAll response size is ${EntityLogger.bold("${kB}kB")} and', stopwatch: stopwatch, dark: true);
      return result;
    });
  }

  _log(String msg, {Stopwatch? stopwatch, bool dark = false}) {
    if (stopwatch != null) {
      EntityLogger.instance.d("SyncRemoteSource", "sync", "$msg took ${stopwatch.elapsed.inMilliseconds} ms", darkColor: dark);
    } else {
      EntityLogger.instance.d("SyncRemoteSource", "sync", msg, darkColor: dark);
    }
  }
}
