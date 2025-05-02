import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../features/auth/auth.dart';
import '../features/booking/booking.dart';
import '../features/category/category.dart';
import '../main/main.dart';

// TODO SignUpPage, ForgotPasswordPage, ResetPasswordPage
class AppRouter {
  final Map<String, Widget Function(RouteSettings)> _builders = {
    // core
    AppRoutes.login: (_) => LoginPage(),
    AppRoutes.main: (_) => MainPage(),
    // booking
    AppRoutes.bookingSave: (settings) => BlocProvider<BookingSaveCubit>(
          create: (_) => GetIt.I<BookingSaveCubit>(),
          child: BookingSavePage(model: settings.arguments as Booking?),
        ),
    // category
    AppRoutes.categoryList: (_) => CategoryListPage(),
    AppRoutes.categoryParentSave: (settings) => BlocProvider<CategorySaveCubit>(
          create: (_) => GetIt.I<CategorySaveCubit>(),
          child: CategoryParentSavePage(model: settings.arguments as Category?),
        ),
    AppRoutes.categorySubSave: (settings) => BlocProvider<CategorySaveCubit>(
          create: (_) => GetIt.I<CategorySaveCubit>(),
          child: CategorySubSavePage(model: settings.arguments as Category),
        ),
    //
  };

  Route onGenerateRoute(RouteSettings settings) {
    BudgetLogger.instance.d("AppRouter, go to ${settings.name}");

    final builder = _builders[settings.name];
    if (builder != null) {
      return MyCustomRoute(
        builder: (_) => builder(settings),
        settings: settings,
      );
    }

    return MaterialPageRoute(
      builder: (_) => SplashPage(),
      settings: settings,
    );
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({
    required super.builder,
    super.settings,
  });
}
