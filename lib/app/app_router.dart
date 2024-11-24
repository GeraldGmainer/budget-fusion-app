import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';

import '../features/auth/auth.dart';
import '../features/settings/settings.dart';
import 'main_page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    BudgetLogger.instance.d("AppRouter, go to ${settings.name}");

    switch (settings.name) {
      case LoginPage.route:
        return MyCustomRoute(
          builder: (context) => LoginPage(),
        );
      case SignUpPage.route:
        return MyCustomRoute(
          builder: (context) => SignUpPage(),
        );
      case ForgotPasswordPage.route:
        return MyCustomRoute(
          builder: (context) => ForgotPasswordPage(),
        );
      case MainPage.route:
        return MyCustomRoute(
          builder: (context) => MainPage(),
        );
      case EditProfilePage.route:
        return MyCustomRoute(
          builder: (context) => EditProfilePage(),
        );
      case ManageWorkspacePage.route:
        return MyCustomRoute(
          builder: (context) => ManageWorkspacePage(),
        );
      case SettingsPage.route:
        return MyCustomRoute(
          builder: (context) => SettingsPage(),
        );
      // case ResetPasswordPage.route:
      //   return MyCustomRoute(
      //     builder: (context) => ResetPasswordPage(),
      //   );
      // case HomePage.route:
      //   return MyCustomRoute(
      //     builder: (context) => HomePage(),
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
