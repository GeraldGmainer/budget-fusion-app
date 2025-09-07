import 'package:budget_fusion_app/utils/utils.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core.dart';

abstract class SupabaseClient {
  static const bool logSession = false;

  ConnectivityService? _cachedConnectivityService;

  ConnectivityService get _connectivityService {
    _cachedConnectivityService ??= GetIt.instance<ConnectivityService>();
    return _cachedConnectivityService!;
  }

  Future<T> execute<T>(String tableName, Future<T> Function() action) async {
    try {
      await checkToken();
      return await action();
    } on AuthException catch (e) {
      final msg = "AuthException in $tableName: ${e.message}";
      BudgetLogger.instance.i(msg);
      throw TranslatedException(AppError.authError, msg, e);
    } on PostgrestException catch (e) {
      final msg = "PostgrestException in $tableName: ${e.message}";
      BudgetLogger.instance.i(msg);
      throw TranslatedException(AppError.postgrestError, msg, e);
    } on NoInternetException {
      throw NoInternetException();
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("Supabase client execute exception", e, stackTrace: stackTrace);
      final msg = "Exception in $tableName";
      throw TranslatedException(AppError.unknown, msg, e);
    }
  }

  Future<void> checkToken() async {
    if (_connectivityService.isOffline) {
      throw NoInternetException();
    }
    if (supabase.auth.currentUser == null || supabase.auth.currentSession == null) {
      throw UnauthenticatedException();
    }
    Session session = supabase.auth.currentSession!;
    if (logSession) {
      _logSession(session);
    }
    if ((session.expiresAt! - 5) < (DateTime.now().millisecondsSinceEpoch / 1000).round()) {
      BudgetLogger.instance.i("REFRESH TOKEN");
      await supabase.auth.refreshSession();
    }
  }

  void _logSession(Session session) {
    DateTime expiresAt = DateTime.fromMillisecondsSinceEpoch(session.expiresAt! * 1000);
    DateTime now = DateTime.now();
    var msg = [
      "session: ",
      "expiresIn: ${session.expiresIn}",
      "expiresAt: ${session.expiresAt == null ? "NULL" : DateTimeConverter.toYYYYMMdd(expiresAt)}",
      "now: ${DateTimeConverter.toYYYYMMdd(now)}",
      "refreshToken: ${session.refreshToken}",
    ];
    BudgetLogger.instance.d(msg.join("\n"));
  }

  String getUserId() {
    if (supabase.auth.currentUser == null) {
      throw UnauthenticatedException();
    }
    return supabase.auth.currentUser!.id;
  }
}
