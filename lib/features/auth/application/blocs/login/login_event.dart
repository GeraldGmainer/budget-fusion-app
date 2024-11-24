part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.init() = InitLoginEvent;

  const factory LoginEvent.googleLogin() = GoogleLoginEvent;

  const factory LoginEvent.credentialsLogin(String email, String password) = CredentialsLoginEvent;

  const factory LoginEvent.logout() = LogoutEvent;
}
