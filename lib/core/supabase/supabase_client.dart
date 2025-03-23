import 'package:budget_fusion_app/utils/utils.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core.dart';

abstract class SupabaseClient {
  static const bool logSession = false;

  ConnectivityService? _cachedConnectivityService;

  ConnectivityService get _connectivityService {
    _cachedConnectivityService ??= GetIt.instance<ConnectivityService>();
    return _cachedConnectivityService!;
  }

  Future<T> execute<T>(String functionName, Future<T> Function() action, {String? extraInfo}) async {
    final stopwatch = Stopwatch()..start();
    try {
      _log(functionName);
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
        _log("$functionName $extraInfo took ${stopwatch.elapsed.inMilliseconds} ms", darkColor: true);
      } else {
        _log("$functionName took ${stopwatch.elapsed.inMilliseconds} ms", darkColor: true);
      }
    }
  }

  Future<void> checkToken() async {
    if (_connectivityService.hasNoInternet) {
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

  _log(String msg, {bool darkColor = false}) {
    final color = darkColor ? AnsiColor.fg(34) : AnsiColor.fg(108);
    BudgetLogger.instance.d("${color("RemoteDataSource: ")} $msg", short: true);
  }

  String getUserId() {
    if (supabase.auth.currentUser == null) {
      throw UnauthenticatedException();
    }
    return supabase.auth.currentUser!.id;
  }
}
