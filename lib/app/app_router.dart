import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/auth.dart';
import '../features/settings/ui/pages/settings_page.dart';
import 'main_page/main_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/sign-up',
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => ForgotPasswordPage(),
    ),
    GoRoute(
      path: '/reset-password',
      builder: (context, state) => ResetPasswordPage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => SettingsPage(),
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) => MainPage(),
    ),
  ],
  errorBuilder: (context, state) => const Scaffold(
    body: Center(child: Text('Page not found')),
  ),
);
