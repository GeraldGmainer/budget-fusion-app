import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/repos/repos.dart';

part 'login_bloc.freezed.dart';

part 'login_event.dart';

part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepo userRepo;

  LoginBloc(this.userRepo) : super(const LoginState.init()) {
    on<InitLoginEvent>(_onInitLoginEvent);
    on<GoogleLoginEvent>(_onGoogleLoginEvent);
    on<CredentialsLoginEvent>(_onCredentialsLoginEvent);
    on<LogoutEvent>(_onLogoutEvent);
  }

  Future<void> _onInitLoginEvent(InitLoginEvent event, Emitter<LoginState> emit) async {
    emit(const LoginState.init());
  }

  Future<void> _onGoogleLoginEvent(GoogleLoginEvent event, Emitter<LoginState> emit) async {
    emit(const LoginState.loading());
    BudgetLogger.instance.d("login with google");

    if (!ConnectivitySingleton.instance.isConnected()) {
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

  Future<void> _onCredentialsLoginEvent(CredentialsLoginEvent event, Emitter<LoginState> emit) async {
    emit(const LoginState.loading());
    BudgetLogger.instance.d("login with credentials ${event.email}");

    try {
      final user = await userRepo.credentialsLogin(event.email, event.password);
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

  Future<void> _onLogoutEvent(LogoutEvent event, Emitter<LoginState> emit) async {
    try {
      await userRepo.logout();
      emit(const LoginState.init());
    } catch (e) {
      BudgetLogger.instance.e(e);
      if (!e.toString().contains("User not found")) {
        emit(const LoginState.error("login.error.logout"));
      } else {
        emit(const LoginState.init());
      }
    }
  }
}
