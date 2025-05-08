import 'dart:async';

import 'package:budget_fusion_app/utils/utils.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../enums/domain_type.dart';
import '../../supabase/supabase.dart';
import 'domain_realtime_event.dart';

@lazySingleton
class RealtimeNotifierService {
  final StreamController<DomainRealtimeEvent> _controller = StreamController.broadcast();
  final Map<String, RealtimeChannel> _channels = {};

  Stream<DomainRealtimeEvent> get events => _controller.stream;

  void startListeningForDomain(DomainType domain, String table) {
    _log("Starting realtime listener for domain ${DomainLogger.applyColor(table)}");
    final channelId = 'public:$table';
    if (_channels.containsKey(channelId)) {
      return;
    }
    final channel = supabase
        .channel(channelId)
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: table,
          callback: (payload) {
            _log("Realtime event received for table $table: $payload", darkColor: true);
            _controller.add(DomainRealtimeEvent(domain: domain));
          },
        )
        .subscribe();
    _channels[channelId] = channel;
  }

  Future<void> stopListeningForDomain(DomainType domain, String table) async {
    final channelId = 'public:$table';
    final channel = _channels.remove(channelId);
    if (channel != null) {
      _log("Stopping realtime listener for domain ${DomainLogger.applyColor(table)}");
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
    DomainLogger.instance.d("RealtimeNotifier", "realtime", msg, darkColor: darkColor);
  }
}
