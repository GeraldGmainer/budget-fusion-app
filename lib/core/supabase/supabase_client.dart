import 'package:budget_fusion_app/utils/utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core.dart';

abstract class SupabaseClient {
  static const bool logSession = false;

  Future<T> execute<T>(String functionName, Future<T> Function() action, {String? extraInfo}) async {
    final stopwatch = Stopwatch()..start();
    try {
      await checkToken();
      return await action();
    } on AuthException catch (e, stackTrace) {
      BudgetLogger.instance.e("AuthException in $functionName: ${e.message}", e, stackTrace);
      throw TranslatedException("error.auth_error");
    } on PostgrestException catch (e, stackTrace) {
      BudgetLogger.instance.e("PostgrestException in $functionName: ${e.message}", e, stackTrace);
      throw TranslatedException("error.postgrest_error");
    } on NoInternetException {
      throw NoInternetException();
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("Exception in $functionName", e, stackTrace);
      throw TranslatedException("error.default");
    } finally {
      stopwatch.stop();
      if (extraInfo != null && extraInfo.isNotEmpty) {
        BudgetLogger.instance.d("$functionName $extraInfo took ${stopwatch.elapsed.inMilliseconds} ms", short: true);
      } else {
        BudgetLogger.instance.d("$functionName took ${stopwatch.elapsed.inMilliseconds} ms", short: true);
      }
    }
  }

  Future<void> checkToken() async {
    if (!ConnectivitySingleton.instance.isConnected()) {
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

  int getProfileId() {
    if (supabase.auth.currentUser == null) {
      throw UnauthenticatedException();
    }
    final User user = supabase.auth.currentUser!;
    if (user.userMetadata == null || user.userMetadata!.isEmpty || user.userMetadata!["profile_id"] == null) {
      throw TranslatedException("error.auth_error");
    }

    return user.userMetadata!["profile_id"]! as int;
  }
}
