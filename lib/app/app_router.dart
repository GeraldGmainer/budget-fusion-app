import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../features/auth/auth.dart';
import '../features/booking/booking.dart';
import '../features/category/category.dart';
import '../main/main.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    BudgetLogger.instance.d("AppRouter, go to ${settings.name}");

    switch (settings.name) {
      case AppRoutes.login:
        return MyCustomRoute(
          builder: (context) => LoginPage(),
          settings: RouteSettings(name: AppRoutes.login),
        );
      case AppRoutes.main:
        return MyCustomRoute(
          builder: (context) => MainPage(),
          settings: RouteSettings(name: AppRoutes.main),
        );
      case AppRoutes.bookingSave:
        return MyCustomRoute(
          builder: (context) => BlocProvider<BookingSaveCubit>(
            create: (_) => GetIt.I<BookingSaveCubit>(),
            child: BookingSavePage(model: settings.arguments as Booking?),
          ),
          settings: RouteSettings(name: AppRoutes.bookingSave),
        );
      case AppRoutes.categoryList:
        return MyCustomRoute(
          builder: (context) => CategoryListPage(),
          settings: RouteSettings(name: AppRoutes.categoryList),
        );
      case AppRoutes.categoryParentSave:
        return MyCustomRoute(
          builder: (context) => BlocProvider<CategorySaveCubit>(
            create: (_) => GetIt.I<CategorySaveCubit>(),
            child: CategoryParentSavePage(model: settings.arguments as Category?),
          ),
          settings: RouteSettings(name: AppRoutes.categoryParentSave),
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
      default:
        return MaterialPageRoute(
          builder: (context) => SplashPage(),
        );
    }
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({
    required super.builder,
    super.settings,
  });
}
