import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../features/auth/auth.dart';
import '../features/booking/booking.dart';
import '../features/category/category.dart';
import '../features/settings/settings.dart';
import '../main/main.dart';
import '../repos/booking/booking.dart';

// TODO SignUpPage, ForgotPasswordPage, ResetPasswordPage
class AppRouter {
  final Map<String, RouteFactory> _routes = {
    AppRoutes.login: (settings) => DefaultRoute(builder: (_) => LoginPage(), settings: settings),
    AppRoutes.main: (settings) => DefaultRoute(builder: (_) => MainPage(), settings: settings),
    AppRoutes.bookingSave:
        (settings) => SlideRightRoute(
          builder: (_) => BlocProvider<BookingSaveCubit>(create: (_) => GetIt.I<BookingSaveCubit>(), child: BookingSavePage(model: settings.arguments as Booking?)),
          settings: settings,
        ),
    AppRoutes.categoryList: (settings) => DefaultRoute(builder: (_) => CategoryListPage(), settings: settings),
    AppRoutes.categoryParentSave:
        (settings) => SlideRightRoute(
          builder:
              (_) => BlocProvider<CategorySaveCubit>(
                create: (_) => GetIt.I<CategorySaveCubit>(),
                child: CategoryParentSavePage(draft: settings.arguments as CategoryDraft),
              ),
          settings: settings,
        ),
    AppRoutes.categorySubSave:
        (settings) => SlideRightRoute(
          builder:
              (_) => BlocProvider<CategorySaveCubit>(
                create: (_) => GetIt.I<CategorySaveCubit>(),
                child: CategorySubSavePage(draft: settings.arguments as CategoryDraft),
              ),
          settings: settings,
        ),
    AppRoutes.categoryIconColorPicker:
        (settings) => SlideUpRoute(
          builder: (_) {
            final draft = settings.arguments as CategoryDraft;
            return IconColorPickerDialog(initialIconName: draft.iconName, initialIconColor: draft.iconColor);
          },
          settings: settings,
        ),
    AppRoutes.settings: (settings) => DefaultRoute(builder: (_) => SettingsPage(), settings: settings),
  };

  Route onGenerateRoute(RouteSettings settings) {
    BudgetLogger.instance.d("AppRouter, go to ${settings.name}");
    final routeFactory = _routes[settings.name];
    if (routeFactory != null) {
      return routeFactory(settings)!;
    }
    return MaterialPageRoute(builder: (_) => SplashPage(), settings: settings);
  }
}

class DefaultRoute<T> extends MaterialPageRoute<T> {
  DefaultRoute({required super.builder, super.settings});
}

class SlideUpRoute<T> extends MaterialPageRoute<T> {
  SlideUpRoute({required super.builder, super.settings});

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    if (isFirst) return child;
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).chain(CurveTween(curve: Curves.ease)).animate(animation),
      child: child,
    );
  }
}

class SlideRightRoute<T> extends MaterialPageRoute<T> {
  SlideRightRoute({required super.builder, super.settings});

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    if (isFirst) return child;
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).chain(CurveTween(curve: Curves.ease)).animate(animation),
      child: child,
    );
  }
}
