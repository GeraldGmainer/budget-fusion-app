import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../profile/application/blocs/blocs.dart';
import '../../application/blocs/blocs.dart';

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
    });
    BlocProvider.of<LanguageBloc>(context).add(LanguageEvent.load(context));
  }

  _checkLogin() async {
    final session = supabase.auth.currentSession;
    if (session == null) {
      context.go("/login");
    } else {
      _loadProfile();
    }
  }

  _loadProfile() {
    if (supabase.auth.currentSession != null) {
      context.read<ProfileBloc>().add(ProfileEvent.load(supabase.auth.currentSession!.user));
    }
  }

  _onProfileSuccess(Profile profile) {
    context.go("/main");
  }

  _onError(String message) {
    showErrorSnackBar(context, message);
    context.read<LoginBloc>().add(LoginEvent.logout());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProfileBloc, ProfileState>(
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
