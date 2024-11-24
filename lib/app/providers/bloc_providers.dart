import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/auth.dart';
import '../../features/profile/profile.dart';

List<BlocProvider> getBlocProviders() {
  return [
    BlocProvider<LoginBloc>(create: (_) => GetIt.I<LoginBloc>()),
    BlocProvider<ProfileBloc>(create: (_) => GetIt.I<ProfileBloc>()),
    BlocProvider<LanguageBloc>(create: (_) => GetIt.I<LanguageBloc>()),
    // BlocProvider<BookingPeriodBloc>(create: (_) => GetIt.I<BookingPeriodBloc>()),
    // BlocProvider<BookingViewBloc>(create: (_) => GetIt.I<BookingViewBloc>()),
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
