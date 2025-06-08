import 'app_error.dart';
import 'translated_exception.dart';

class NoInternetException extends TranslatedException {
  NoInternetException() : super(AppError.internet, "No internet connection");
}
