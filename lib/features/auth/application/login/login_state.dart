part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;

  const factory LoginState.loading() = LoginLoadingState;

  const factory LoginState.success(User user) = LoginSuccessState;

  const factory LoginState.error(AppError error) = LoginErrorState;
}
