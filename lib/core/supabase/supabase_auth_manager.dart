import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

import 'supabase_auth_event.dart';

@singleton
class SupabaseAuthManager {
  late final BehaviorSubject<SupabaseAuthEvent> _subject;
  StreamSubscription? _sbSub;

  ValueStream<SupabaseAuthEvent> get stream => _subject.stream;

  SupabaseAuthEvent? get latest => _subject.valueOrNull;

  Future<void> init() async {
    final client = sb.Supabase.instance.client;
    final current = client.auth.currentSession;
    final seed = SupabaseAuthEvent(type: current == null ? SupabaseAuthType.signedOut : SupabaseAuthType.signedIn, session: current);
    _subject = BehaviorSubject<SupabaseAuthEvent>.seeded(seed);

    _sbSub = client.auth.onAuthStateChange
        .map((evt) {
          final event = evt.event;
          final session = evt.session;
          if (event == sb.AuthChangeEvent.initialSession) {
            return SupabaseAuthEvent(type: session == null ? SupabaseAuthType.signedOut : SupabaseAuthType.signedIn, session: session);
          } else if (event == sb.AuthChangeEvent.signedOut) {
            return const SupabaseAuthEvent(type: SupabaseAuthType.signedOut);
          } else if (event == sb.AuthChangeEvent.signedIn && session != null) {
            return SupabaseAuthEvent(type: SupabaseAuthType.signedIn, session: session);
          } else if (event == sb.AuthChangeEvent.tokenRefreshed && session != null) {
            return SupabaseAuthEvent(type: SupabaseAuthType.tokenRefreshed, session: session);
          } else if (event == sb.AuthChangeEvent.passwordRecovery && session != null) {
            return SupabaseAuthEvent(type: SupabaseAuthType.passwordRecovery, session: session);
          }
          return null;
        })
        .where((e) => e != null)
        .cast<SupabaseAuthEvent>()
        .distinct((a, b) => a.type == b.type && a.session?.user.id == b.session?.user.id)
        .listen(_subject.add);
  }

  Future<void> dispose() async {
    await _sbSub?.cancel();
    await _subject.close();
  }
}
