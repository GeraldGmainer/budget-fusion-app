import 'package:budget_fusion_app/features/category/category.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../core/core.dart';
import '../features/auth/auth.dart';
import '../features/booking/booking.dart';
import '../features/budget_book/budget_book.dart';
import '../features/profile/profile.dart';
import '../main/main.dart';

List<BlocProvider> getBlocProviders() {
  return [
    BlocProvider<MainCubit>(create: (_) => GetIt.I<MainCubit>()),
    BlocProvider<LoginCubit>(create: (_) => GetIt.I<LoginCubit>()),
    BlocProvider<ProfileCubit>(create: (_) => GetIt.I<ProfileCubit>()),
    BlocProvider<ProfileSettingCubit>(create: (_) => GetIt.I<ProfileSettingCubit>()),
    BlocProvider<LanguageCubit>(create: (_) => GetIt.I<LanguageCubit>()),
    BlocProvider<BudgetBookCubit>(create: (_) => GetIt.I<BudgetBookCubit>()),
    BlocProvider<AccountCubit>(create: (_) => GetIt.I<AccountCubit>()),
    BlocProvider<CategoryCubit>(create: (_) => GetIt.I<CategoryCubit>()),
    BlocProvider<BookingCubit>(create: (_) => GetIt.I<BookingCubit>()),
    BlocProvider<CalculatorCubit>(create: (_) => GetIt.I<CalculatorCubit>()),
    BlocProvider<SuggestionCubit>(create: (_) => GetIt.I<SuggestionCubit>()),
    BlocProvider<OfflineFirstQueueCubit>(create: (_) => GetIt.I<OfflineFirstQueueCubit>()),
    BlocProvider<RemoteLoadingCubit>(create: (_) => GetIt.I<RemoteLoadingCubit>()),
    BlocProvider<CategorySaveCubit>(create: (_) => GetIt.I<CategorySaveCubit>()),
  ];
}

// BlocProvider<SignUpBloc>(create: (context) => SignUpBloc(_userRepo)),
