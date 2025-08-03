import 'app_error.dart';

class TranslatedException implements Exception {
  final AppError error;
  final String message;
  final Object? e;

  TranslatedException(this.error, this.message, [this.e]);

  @override
  String toString() => "$runtimeType - $error: $message\n$e";
}
