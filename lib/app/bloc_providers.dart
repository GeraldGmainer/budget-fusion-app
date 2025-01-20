import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../features/auth/auth.dart';
import '../features/profile/profile.dart';
import '../main/main.dart';

List<BlocProvider> getBlocProviders() {
  return [
    BlocProvider<MainCubit>(create: (_) => GetIt.I<MainCubit>()),
    BlocProvider<LoginCubit>(create: (_) => GetIt.I<LoginCubit>()),
    BlocProvider<ProfileCubit>(create: (_) => GetIt.I<ProfileCubit>()),
    BlocProvider<ProfileSettingsCubit>(create: (_) => GetIt.I<ProfileSettingsCubit>()),
    BlocProvider<LanguageCubit>(create: (_) => GetIt.I<LanguageCubit>()),
    // BlocProvider<BookingPageBloc>(create: (_) => GetIt.I<BookingPageBloc>()),
  ];
}

// BlocProvider<SignUpBloc>(create: (context) => SignUpBloc(_userRepo)),
// // --
// BlocProvider<BookingCrudBloc>(create: (context) => BookingCrudBloc(_bookingRepo)),
// BlocProvider<CalculatorBloc>(create: (context) => CalculatorBloc()),
// BlocProvider<CategoryListBloc>(create: (context) => CategoryListBloc(_bookingRepo)),
// BlocProvider<CategoryIconBloc>(create: (context) => CategoryIconBloc(_bookingRepo)),
// BlocProvider<CategoryCrudBloc>(create: (context) => CategoryCrudBloc(_bookingRepo)),
// BlocProvider<SuggestionBloc>(create: (context) => SuggestionBloc(_bookingRepo, _userRepo)),
