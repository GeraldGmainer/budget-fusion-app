import 'dart:async';

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
    supabase
        .channel('public:$table')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: table,
          callback: (payload) {
            BudgetLogger.instance.d("realtime event for table $table $payload");
            _controller.add(DomainRealtimeEvent(domain: domain));
          },
        )
        .subscribe();
  }

  void dispose() {
    _controller.close();
  }
}
