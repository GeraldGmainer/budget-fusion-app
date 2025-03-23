import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/auth/auth.dart';
import 'package:budget_fusion_app/features/profile/profile.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkLogin();
      _loadLocale();
    });
  }

  _loadLocale() {
    final locale = Localizations.localeOf(context);
    BlocProvider.of<LanguageCubit>(context).load(locale);
  }

  _checkLogin() async {
    final session = supabase.auth.currentSession;
    if (session == null) {
      context.go(AppRoutes.login);
    } else {
      _loadProfile();
    }
  }

  _loadProfile() {
    context.read<ProfileCubit>().load();
    context.read<ProfileSettingCubit>().load();
  }

  _onProfileSuccess(Profile profile) {
    context.go(AppRoutes.main);
  }

  _onError(String message) {
    showErrorSnackBar(context, message);
    context.read<LoginCubit>().logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          state.whenOrNull(
            loaded: _onProfileSuccess,
            error: _onError,
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            error: (message) => ErrorText(message: message, onReload: _loadProfile),
            orElse: () => Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
