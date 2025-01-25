import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../../utils/utils.dart';
import '../../../features/auth/auth.dart';
import '../../../features/profile/profile.dart';
import '../../../shared/shared.dart';

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
    context.read<ProfileSettingsCubit>().load();
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
