import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/core.dart';
import '../../../../utils/utils.dart';
import '../../data/repos/user_repo.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final UserRepo userRepo;
  final ConnectivityService _connectivityService;

  LoginCubit(this.userRepo, this._connectivityService) : super(const LoginState.initial());

  void init() {
    emit(const LoginState.initial());
  }

  Future<void> loginGoogle() async {
    emit(const LoginState.loading());
    BudgetLogger.instance.d("login with google");

    if (_connectivityService.hasNoInternet) {
      emit(const LoginState.error("error.internet"));
      return;
    }

    try {
      final user = await userRepo.googleLogin();
      emit(LoginState.success(user));
    } on TranslatedException catch (e, stackTrace) {
      BudgetLogger.instance.e("LoginBloc GoogleLoginEvent Exception", e, stackTrace);
      emit(LoginState.error(e.message));
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("LoginBloc GoogleLoginEvent Exception", e, stackTrace);
      emit(const LoginState.error("error.default"));
    }
  }

  Future<void> loginCredentials(String email, String password) async {
    emit(const LoginState.loading());
    BudgetLogger.instance.d("login with credentials $email");

    try {
      final user = await userRepo.credentialsLogin(email, password);
      emit(LoginState.success(user));
    } on TranslatedException catch (e, stackTrace) {
      BudgetLogger.instance.e("LoginBloc CredentialsLoginEvent Exception", e, stackTrace);
      emit(LoginState.error(e.message));
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("LoginBloc CredentialsLoginEvent Exception", e, stackTrace);
      final errorMessage = e.toString().contains("Invalid login credentials") ? "login.error.incorrect_credentials" : "error.default";
      emit(LoginState.error(errorMessage));
    }
  }

  Future<void> logout() async {
    try {
      await userRepo.logout();
      emit(const LoginState.initial());
    } catch (e) {
      BudgetLogger.instance.i(e);
      if (!e.toString().contains("User not found")) {
        emit(const LoginState.error("login.error.logout"));
      } else {
        emit(const LoginState.initial());
      }
    }
  }
}
