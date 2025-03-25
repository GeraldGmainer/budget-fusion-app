import 'dart:async';

import 'package:budget_fusion_app/core/constants/app_log_colors.dart';
import 'package:budget_fusion_app/utils/singletons/budget_logger.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../enums/domain_type.dart';
import '../../supabase/supabase.dart';
import 'domain_realtime_event.dart';

@lazySingleton
class RealtimeNotifierService {
  final StreamController<DomainRealtimeEvent> _controller = StreamController.broadcast();

  Stream<DomainRealtimeEvent> get events => _controller.stream;

  void startListeningForDomain(DomainType domain, String table) {
    _log("Starting realtime listener for domain ${AppLogColors.applyColor(domain.name)}");
    supabase
        .channel('public:$table')
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
  }

  void dispose() {
    _controller.close();
  }

  void _log(String msg, {bool darkColor = false}) {
    final color = darkColor ? AppLogColors.realtimeNotifierServiceEnd : AppLogColors.realtimeNotifierServiceStart;
    BudgetLogger.instance.d("${color("Realtime Notifier:".padRight(AppLogColors.serviceCharLength))} $msg", short: true);
  }
}
