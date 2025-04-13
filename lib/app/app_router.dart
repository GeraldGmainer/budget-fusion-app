import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/booking/booking.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';

import '../features/auth/auth.dart';
import '../main/main.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    BudgetLogger.instance.d("AppRouter, go to ${settings.name}");

    switch (settings.name) {
      case AppRoutes.login:
        return MyCustomRoute(
          builder: (context) => LoginPage(),
        );
      case AppRoutes.main:
        return MyCustomRoute(
          builder: (context) => MainPage(),
        );
      case AppRoutes.saveBooking:
        return MyCustomRoute(
          builder: (context) => SaveBookingPage(model: settings.arguments as Booking?),
        );

      // case SignUpPage.route:
      //   return MyCustomRoute(
      //     builder: (context) => SignUpPage(),
      //   );
      // case ForgotPasswordPage.route:
      //   return MyCustomRoute(
      //     builder: (context) => ForgotPasswordPage(),
      //   );
      // case ResetPasswordPage.route:
      //   return MyCustomRoute(
      //     builder: (context) => ResetPasswordPage(),
      //   );
      // case SettingsPage.route:
      //   return MyCustomRoute(
      //     builder: (context) => SettingsPage(),
      //   );
      // case BookingCrudPage.route:
      //   return MyCustomRoute(
      //     builder: (context) => BookingCrudPage(model: settings.arguments as BookingModel),
      //   );
      // case CategoryCrudPage.route:
      //   return MyCustomRoute(
      //     builder: (context) => CategoryCrudPage(model: settings.arguments as CategoryModel),
      //   );
      // case BookingListPage.route:
      //   return MyCustomRoute(
      //     builder: (context) => BookingListPage(pageModel: settings.arguments as BookingListPageModel),
      //   );
      // case CategoryListPage.route:
      //   return MyCustomRoute(
      //     builder: (context) => CategoryListPage(),
      //   );
      default:
        return MaterialPageRoute(
          builder: (context) => SplashPage(),
        );
    }
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({required super.builder, super.settings});
}
