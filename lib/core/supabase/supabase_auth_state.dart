part of 'supabase_auth_cubit.dart';

@freezed
class SupabaseAuthState with _$SupabaseAuthState {
  const factory SupabaseAuthState.initial() = _Initial;

  const factory SupabaseAuthState.unauthenticated() = AuthUnauthenticated;

  const factory SupabaseAuthState.authenticated(sb.Session session) = AuthAuthenticated;

  const factory SupabaseAuthState.passwordRecovery(sb.Session session) = AuthPasswordRecovery;

  const factory SupabaseAuthState.tokenRefreshed(sb.Session session) = AuthTokenRefreshed;

  const factory SupabaseAuthState.error(String message) = AuthError;
}
