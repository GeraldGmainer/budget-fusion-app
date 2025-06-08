import 'dart:async';

import 'package:budget_fusion_app/utils/utils.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../enums/entity_type.dart';
import '../../supabase/supabase.dart';
import 'entity_realtime_event.dart';

@lazySingleton
class RealtimeNotifierService {
  final StreamController<EntityRealtimeEvent> _controller = StreamController.broadcast();
  final Map<String, RealtimeChannel> _channels = {};

  Stream<EntityRealtimeEvent> get events => _controller.stream;

  void startListeningForEntity(EntityType entity, String table) {
    _log("Starting realtime listener for entity ${EntityLogger.applyColor(table)}");
    final channelId = 'public:$table';
    if (_channels.containsKey(channelId)) {
      return;
    }
    final channel =
        supabase
            .channel(channelId)
            .onPostgresChanges(
              event: PostgresChangeEvent.all,
              schema: 'public',
              table: table,
              callback: (payload) {
                _log("Realtime event received for table $table: $payload", darkColor: true);
                _controller.add(EntityRealtimeEvent(entity: entity));
              },
            )
            .subscribe();
    _channels[channelId] = channel;
  }

  Future<void> stopListeningForEntity(EntityType entity, String table) async {
    final channelId = 'public:$table';
    final channel = _channels.remove(channelId);
    if (channel != null) {
      _log("Stopping realtime listener for entity ${EntityLogger.applyColor(table)}");
      await supabase.removeChannel(channel);
    }
  }

  void dispose() {
    for (var c in _channels.values) {
      supabase.removeChannel(c);
    }
    _controller.close();
  }

  void _log(String msg, {bool darkColor = false}) {
    EntityLogger.instance.d("RealtimeNotifier", "realtime", msg, darkColor: darkColor);
  }
}
