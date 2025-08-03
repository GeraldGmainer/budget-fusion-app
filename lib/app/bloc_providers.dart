import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../core/core.dart';
import '../features/auth/auth.dart';
import '../features/booking/booking.dart';
import '../features/budget_book/budget_book.dart';
import '../features/category/category.dart';
import '../features/profile/profile.dart';
import '../main/main.dart';

List<BlocProvider> getBlocProviders() {
  return [
    BlocProvider<MainCubit>(create: (_) => GetIt.I<MainCubit>()),
    BlocProvider<LoginCubit>(create: (_) => GetIt.I<LoginCubit>()),
    BlocProvider<LanguageCubit>(create: (_) => GetIt.I<LanguageCubit>()),
    BlocProvider<BudgetBookCubit>(create: (_) => GetIt.I<BudgetBookCubit>()),
    BlocProvider<CategoryListCubit>(create: (_) => GetIt.I<CategoryListCubit>()),
    BlocProvider<CalculatorCubit>(create: (_) => GetIt.I<CalculatorCubit>()),
    BlocProvider<SuggestionCubit>(create: (_) => GetIt.I<SuggestionCubit>()),
    BlocProvider<OfflineFirstQueueCubit>(create: (_) => GetIt.I<OfflineFirstQueueCubit>()),
    BlocProvider<RemoteLoadingCubit>(create: (_) => GetIt.I<RemoteLoadingCubit>()),
    BlocProvider<OfflineFirstLoaderCubit>(create: (_) => GetIt.I<OfflineFirstLoaderCubit>()),
    ..._dataManagerProviders(),
  ];
}

List<BlocProvider> _dataManagerProviders() {
  return [
    BlocProvider<DataManagerCubit<Account>>(create: (_) => DataManagerCubit(GetIt.I<AccountDataManager>())),
    BlocProvider<DataManagerCubit<Category>>(create: (_) => DataManagerCubit(GetIt.I<CategoryDataManager>())),
    BlocProvider<DataManagerCubit<Booking>>(create: (_) => DataManagerCubit(GetIt.I<BookingDataManager>())),
    BlocProvider<DataManagerCubit<Profile>>(create: (_) => DataManagerCubit(GetIt.I<ProfileDataManager>())),
    BlocProvider<DataManagerCubit<Currency>>(create: (_) => DataManagerCubit(GetIt.I<CurrencyDataManager>())),
  ];
}
