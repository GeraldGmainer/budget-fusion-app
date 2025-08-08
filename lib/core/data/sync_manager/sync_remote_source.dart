import 'package:injectable/injectable.dart';

import '../../../utils/utils.dart';
import '../../core.dart';
import 'sync_all_response.dart';

@lazySingleton
class SyncRemoteSource extends SupabaseClient {
  Future<SyncAllResponse> syncAll(Map<String, String> cursors) async {
    final stopwatch = Stopwatch()..start();
    _log("call syncAll: ${cursors.entries.map((e) => '${e.key}:${e.value.substring(0, 10)}').join(', ')}");
    return execute("syncAll", () async {
      final response = await supabase.rpc('sync_all', params: {'p_last_synced': cursors});
      final data = response as Map<String, dynamic>;
      final result = SyncAllResponse.fromJson(data);
      final counts = <EntityType, int>{
        EntityType.account: result.account.upserts.length + result.account.deletes.length,
        EntityType.category: result.category.upserts.length + result.category.deletes.length,
        EntityType.booking: result.booking.upserts.length + result.booking.deletes.length,
        EntityType.profile: result.profile.upserts.length + result.profile.deletes.length,
        EntityType.currency: result.currency.upserts.length + result.currency.deletes.length,
      };
      _log('syncAll result: ${counts.entries.map((e) => '${e.key.name}: ${e.value}').join(', ')}', stopwatch: stopwatch, dark: true);
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
