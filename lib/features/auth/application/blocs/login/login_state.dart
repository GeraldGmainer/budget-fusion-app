part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.init() = LoginInitState;

  const factory LoginState.loading() = LoginLoadingState;

  const factory LoginState.success(SupabaseUser user) = LoginSuccessState;

  const factory LoginState.error(String message) = LoginErrorState;
}
