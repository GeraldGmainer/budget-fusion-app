import 'package:supabase_flutter/supabase_flutter.dart';

import 'app_error.dart';

class TranslatedException implements Exception {
  final AppError error;
  final String message;
  final Object? cause;

  TranslatedException(this.error, this.message, [this.cause]);

  /// access to original Postgres context if applicable
  Map<String, dynamic>? get postgresContext {
    if (cause is PostgrestException) {
      final pg = cause as PostgrestException;
      return {
        'message': pg.message,
        'code': pg.code,
        'details': pg.details,
        'hint': pg.hint,
      };
    }
    return null;
  }

  @override
  String toString() {
    if (cause == null) {
      return "$runtimeType - $error: $message";
    }
    return "$runtimeType - $error: $message\nCause: $cause";
  }
}
