import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/auth.dart';
import '../../features/budget/budget.dart';
import '../../features/profile/profile.dart';
import '../main_page/bloc/main_bloc.dart';

List<BlocProvider> getBlocProviders() {
  return [
    BlocProvider<MainBloc>(create: (_) => GetIt.I<MainBloc>()),
    BlocProvider<LoginBloc>(create: (_) => GetIt.I<LoginBloc>()),
    BlocProvider<ProfileBloc>(create: (_) => GetIt.I<ProfileBloc>()),
    BlocProvider<LanguageBloc>(create: (_) => GetIt.I<LanguageBloc>()),
    BlocProvider<BalancesBloc>(create: (_) => GetIt.I<BalancesBloc>()),
    BlocProvider<CalendarBloc>(create: (_) => GetIt.I<CalendarBloc>()),
    BlocProvider<SummaryBloc>(create: (_) => GetIt.I<SummaryBloc>()),
    BlocProvider<TransactionsBloc>(create: (_) => GetIt.I<TransactionsBloc>()),
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
