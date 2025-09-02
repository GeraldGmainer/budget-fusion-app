import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';

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

  void _loadLocale() {
    final locale = Localizations.localeOf(context);
    BlocProvider.of<LanguageCubit>(context).load(locale);
  }

  Future<void> _checkLogin() async {
    final session = supabase.auth.currentSession;
    if (session == null) {
      Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.login, (_) => false);
    }
  }

  void _onProfileLoaded() {
    // TODO dont navigate to main page here when logged
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.main, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<MainCubit, MainState>(
        listenWhen: (prev, curr) => prev.maybeWhen(initial: (_) => true, orElse: () => false),
        listener: (context, state) => _onProfileLoaded(),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
