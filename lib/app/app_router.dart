import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/core.dart';
import '../features/auth/auth.dart';
import '../features/booking/booking.dart';
import '../main/main.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.saveBooking,
      builder: (context, state) => SaveBookingPage(model: state.extra as Booking?),
    ),
    // GoRoute(
    //   path: '/sign-up',
    //   builder: (context, state) => SignUpPage(),
    // ),
    // GoRoute(
    //   path: '/forgot-password',
    //   builder: (context, state) => ForgotPasswordPage(),
    // ),
    // GoRoute(
    //   path: '/reset-password',
    //   builder: (context, state) => ResetPasswordPage(),
    // ),
    // GoRoute(
    //   path: '/settings',
    //   builder: (context, state) => SettingsPage(),
    // ),
    GoRoute(
      path: AppRoutes.main,
      builder: (context, state) => MainPage(),
    ),
  ],
  errorBuilder: (context, state) => const Scaffold(
    body: Center(child: Text('Page not found')),
  ),
);
