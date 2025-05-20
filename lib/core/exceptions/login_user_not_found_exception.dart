import 'app_error.dart';
import 'translated_exception.dart';

class LoginUserNotFoundException extends TranslatedException {
  LoginUserNotFoundException() : super(AppError.loginUserNotFound);
}
