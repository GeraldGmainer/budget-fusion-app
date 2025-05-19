import 'app_error.dart';

class TranslatedException implements Exception {
  final AppError error;

  TranslatedException(this.error);

  @override
  String toString() => "$runtimeType: $error";
}
