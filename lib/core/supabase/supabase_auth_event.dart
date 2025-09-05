import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

part 'supabase_auth_event.freezed.dart';

enum SupabaseAuthType {
  signedOut,
  signedIn,
  tokenRefreshed,
  passwordRecovery,
  error,
}

@freezed
abstract class SupabaseAuthEvent with _$SupabaseAuthEvent {
  const factory SupabaseAuthEvent({
    required SupabaseAuthType type,
    sb.Session? session,
    String? message,
  }) = _SupabaseAuthEvent;
}
