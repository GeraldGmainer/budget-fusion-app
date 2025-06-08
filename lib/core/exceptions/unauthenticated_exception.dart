import 'app_error.dart';
import 'translated_exception.dart';

class UnauthenticatedException extends TranslatedException {
  UnauthenticatedException() : super(AppError.unauthenticated, "User is not authenticated");
}
