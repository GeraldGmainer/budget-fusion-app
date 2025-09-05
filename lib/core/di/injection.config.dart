// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:budget_fusion_app/app/app_life_cycle_manager.dart' as _i202;
import 'package:budget_fusion_app/core/core.dart' as _i714;
import 'package:budget_fusion_app/core/data/offline_first/coordinator/offline_first_coordinator.dart'
    as _i105;
import 'package:budget_fusion_app/core/data/offline_first/cubits/offline_first_queue_cubit.dart'
    as _i920;
import 'package:budget_fusion_app/core/data/offline_first/data_manager/data_manager_factory.dart'
    as _i654;
import 'package:budget_fusion_app/core/data/offline_first/interfaces/repo.dart'
    as _i38;
import 'package:budget_fusion_app/core/data/offline_first/queue/queue_local_data_source.dart'
    as _i252;
import 'package:budget_fusion_app/core/data/offline_first/queue/queue_log_local_data_source.dart'
    as _i779;
import 'package:budget_fusion_app/core/data/offline_first/queue/queue_logger.dart'
    as _i509;
import 'package:budget_fusion_app/core/data/offline_first/queue/queue_manager.dart'
    as _i1046;
import 'package:budget_fusion_app/core/data/offline_first/realtime/realtime_manager.dart'
    as _i258;
import 'package:budget_fusion_app/core/data/offline_first/sync_manager/sync_cursor_repo.dart'
    as _i225;
import 'package:budget_fusion_app/core/data/offline_first/sync_manager/sync_manager.dart'
    as _i39;
import 'package:budget_fusion_app/core/data/offline_first/sync_manager/sync_remote_source.dart'
    as _i251;
import 'package:budget_fusion_app/core/di/data_manager_module.dart' as _i192;
import 'package:budget_fusion_app/core/di/database_module.dart' as _i752;
import 'package:budget_fusion_app/core/di/injection.dart' as _i87;
import 'package:budget_fusion_app/core/remote_loading/bloc/remote_loading_cubit.dart'
    as _i234;
import 'package:budget_fusion_app/core/remote_loading/service/remote_loading_service.dart'
    as _i247;
import 'package:budget_fusion_app/core/supabase/supabase_auth_cubit.dart'
    as _i78;
import 'package:budget_fusion_app/core/supabase/supabase_auth_manager.dart'
    as _i942;
import 'package:budget_fusion_app/features/auth/bloc/login_cubit.dart' as _i319;
import 'package:budget_fusion_app/features/auth/data/remote_sources/user_remote_source.dart'
    as _i478;
import 'package:budget_fusion_app/features/auth/data/repos/user_repo.dart'
    as _i871;
import 'package:budget_fusion_app/features/booking/bloc/booking_save_cubit.dart'
    as _i863;
import 'package:budget_fusion_app/features/booking/bloc/calculator_cubit.dart'
    as _i500;
import 'package:budget_fusion_app/features/booking/bloc/suggestion_cubit.dart'
    as _i963;
import 'package:budget_fusion_app/features/booking/domain/service/booking_account_service.dart'
    as _i576;
import 'package:budget_fusion_app/features/booking/use_cases/default_account_use_case.dart'
    as _i656;
import 'package:budget_fusion_app/features/booking/use_cases/default_new_date_use_case.dart'
    as _i226;
import 'package:budget_fusion_app/features/booking/use_cases/save_booking_use_case.dart'
    as _i405;
import 'package:budget_fusion_app/features/budget_book/bloc/budget_book_cubit.dart'
    as _i569;
import 'package:budget_fusion_app/features/budget_book/use_cases/filter_and_group_bookings_use_case.dart'
    as _i318;
import 'package:budget_fusion_app/features/budget_book/use_cases/filter_bookings_use_case.dart'
    as _i431;
import 'package:budget_fusion_app/features/budget_book/use_cases/generate_budget_summary_use_case.dart'
    as _i507;
import 'package:budget_fusion_app/features/budget_book/use_cases/generate_budget_transaction_use_case.dart'
    as _i196;
import 'package:budget_fusion_app/features/budget_book/use_cases/reset_budget_book_use_case.dart'
    as _i562;
import 'package:budget_fusion_app/features/budget_book/use_cases/service/budget_page_data_service.dart'
    as _i78;
import 'package:budget_fusion_app/features/budget_book/use_cases/service/summary_data_generator.dart'
    as _i226;
import 'package:budget_fusion_app/features/budget_book/use_cases/service/transaction_data_generator.dart'
    as _i601;
import 'package:budget_fusion_app/features/category/bloc/category_list_cubit.dart'
    as _i788;
import 'package:budget_fusion_app/features/category/bloc/category_save_cubit.dart'
    as _i1005;
import 'package:budget_fusion_app/features/category/use_cases/load_category_list_use_case.dart'
    as _i455;
import 'package:budget_fusion_app/features/profile/bloc/language_cubit.dart'
    as _i801;
import 'package:budget_fusion_app/main/bloc/main_cubit.dart' as _i976;
import 'package:budget_fusion_app/repos/account/account.dart' as _i500;
import 'package:budget_fusion_app/repos/account/account_repo.dart' as _i564;
import 'package:budget_fusion_app/repos/account/data_sources/account_local_data_source.dart'
    as _i1071;
import 'package:budget_fusion_app/repos/account/data_sources/account_remote_data_source.dart'
    as _i722;
import 'package:budget_fusion_app/repos/booking/booking.dart' as _i269;
import 'package:budget_fusion_app/repos/booking/booking_repo.dart' as _i427;
import 'package:budget_fusion_app/repos/booking/data_sources/booking_local_data_source.dart'
    as _i125;
import 'package:budget_fusion_app/repos/booking/data_sources/booking_remote_data_source.dart'
    as _i1026;
import 'package:budget_fusion_app/repos/booking/mappers/booking_mapper.dart'
    as _i1048;
import 'package:budget_fusion_app/repos/category/category.dart' as _i531;
import 'package:budget_fusion_app/repos/category/category_repo.dart' as _i28;
import 'package:budget_fusion_app/repos/category/data_sources/category_local_data_source.dart'
    as _i871;
import 'package:budget_fusion_app/repos/category/data_sources/category_remote_data_source.dart'
    as _i110;
import 'package:budget_fusion_app/repos/category/mappers/category_mapper.dart'
    as _i536;
import 'package:budget_fusion_app/repos/currency/currency.dart' as _i881;
import 'package:budget_fusion_app/repos/currency/currency_repo.dart' as _i864;
import 'package:budget_fusion_app/repos/currency/data_sources/currency_local_data_source.dart'
    as _i692;
import 'package:budget_fusion_app/repos/currency/data_sources/currency_remote_data_source.dart'
    as _i678;
import 'package:budget_fusion_app/repos/profile/data_sources/profile_local_data_source.dart'
    as _i372;
import 'package:budget_fusion_app/repos/profile/data_sources/profile_remote_data_source.dart'
    as _i755;
import 'package:budget_fusion_app/repos/profile/profile.dart' as _i421;
import 'package:budget_fusion_app/repos/profile/profile_repo.dart' as _i1018;
import 'package:budget_fusion_app/utils/service/connectivity_service.dart'
    as _i702;
import 'package:budget_fusion_app/utils/service/datetime_service.dart' as _i25;
import 'package:budget_fusion_app/utils/utils.dart' as _i428;
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:sqflite/sqflite.dart' as _i779;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final databaseModule = _$DatabaseModule();
    final registerModule = _$RegisterModule();
    final dataManagerModule = _$DataManagerModule();
    await gh.factoryAsync<_i779.Database>(
      () => databaseModule.provideDatabase(),
      preResolve: true,
    );
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPrefs,
      preResolve: true,
    );
    gh.factory<_i500.CalculatorCubit>(() => _i500.CalculatorCubit());
    gh.factory<_i801.LanguageCubit>(() => _i801.LanguageCubit());
    gh.factory<_i976.MainCubit>(() => _i976.MainCubit());
    gh.singleton<_i942.SupabaseAuthManager>(() => _i942.SupabaseAuthManager());
    gh.lazySingleton<_i110.CategoryRemoteDataSource>(
      () => _i110.CategoryRemoteDataSource(),
    );
    gh.lazySingleton<_i536.CategoryMapper>(() => _i536.CategoryMapper());
    gh.lazySingleton<_i1026.BookingRemoteDataSource>(
      () => _i1026.BookingRemoteDataSource(),
    );
    gh.lazySingleton<_i1048.BookingMapper>(() => _i1048.BookingMapper());
    gh.lazySingleton<_i755.ProfileRemoteDataSource>(
      () => _i755.ProfileRemoteDataSource(),
    );
    gh.lazySingleton<_i722.AccountRemoteDataSource>(
      () => _i722.AccountRemoteDataSource(),
    );
    gh.lazySingleton<_i678.CurrencyRemoteDataSource>(
      () => _i678.CurrencyRemoteDataSource(),
    );
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i247.RemoteLoadingService>(
      () => _i247.RemoteLoadingService(),
    );
    gh.lazySingleton<_i478.UserRemoteSource>(() => _i478.UserRemoteSource());
    gh.lazySingleton<_i226.DefaultNewDateUseCase>(
      () => _i226.DefaultNewDateUseCase(),
    );
    gh.lazySingleton<_i431.FilterBookingsUseCase>(
      () => _i431.FilterBookingsUseCase(),
    );
    gh.lazySingleton<_i601.TransactionDataGenerator>(
      () => _i601.TransactionDataGenerator(),
    );
    gh.lazySingleton<_i226.SummaryDataGenerator>(
      () => _i226.SummaryDataGenerator(),
    );
    gh.lazySingleton<_i25.DatetimeService>(() => _i25.DatetimeService());
    gh.lazySingleton<_i258.RealtimeManager>(() => _i258.RealtimeManager());
    gh.lazySingleton<_i251.SyncRemoteSource>(() => _i251.SyncRemoteSource());
    gh.lazySingleton<_i225.SyncCursorRepo>(
      () => _i225.SyncCursorRepo(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i871.UserRepo>(
      () => _i871.UserRepo(gh<_i478.UserRemoteSource>()),
    );
    gh.lazySingleton<_i78.BudgetPageDataService>(
      () => _i78.BudgetPageDataService(gh<_i428.DatetimeService>()),
    );
    gh.factory<_i234.RemoteLoadingCubit>(
      () => _i234.RemoteLoadingCubit(gh<_i247.RemoteLoadingService>()),
    );
    gh.factory<_i78.SupabaseAuthCubit>(
      () => _i78.SupabaseAuthCubit(gh<_i942.SupabaseAuthManager>()),
    );
    gh.lazySingleton<_i39.SyncManager>(
      () => _i39.SyncManager(
        gh<_i714.SyncCursorRepo>(),
        gh<_i251.SyncRemoteSource>(),
        gh<_i714.RemoteLoadingService>(),
      ),
    );
    gh.lazySingleton<_i702.ConnectivityService>(
      () => _i702.ConnectivityService(gh<_i895.Connectivity>()),
    );
    gh.factory<_i319.LoginCubit>(
      () => _i319.LoginCubit(
        gh<_i871.UserRepo>(),
        gh<_i428.ConnectivityService>(),
      ),
    );
    gh.lazySingleton<_i196.GenerateBudgetTransactionUseCase>(
      () => _i196.GenerateBudgetTransactionUseCase(
        gh<_i601.TransactionDataGenerator>(),
      ),
    );
    gh.lazySingleton<_i871.CategoryLocalDataSource>(
      () => _i871.CategoryLocalDataSource(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i125.BookingLocalDataSource>(
      () => _i125.BookingLocalDataSource(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i372.ProfileLocalDataSource>(
      () => _i372.ProfileLocalDataSource(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i1071.AccountLocalDataSource>(
      () => _i1071.AccountLocalDataSource(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i692.CurrencyLocalDataSource>(
      () => _i692.CurrencyLocalDataSource(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i779.QueueLogLocalDataSource>(
      () => _i779.QueueLogLocalDataSource(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i252.QueueLocalDataSource>(
      () => _i252.QueueLocalDataSource(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i318.FilterAndGroupBookingsUseCase>(
      () =>
          _i318.FilterAndGroupBookingsUseCase(gh<_i78.BudgetPageDataService>()),
    );
    gh.lazySingleton<_i509.QueueLogger>(
      () => _i509.QueueLogger(gh<_i779.QueueLogLocalDataSource>()),
    );
    gh.lazySingleton<_i1046.QueueManager>(
      () => _i1046.QueueManager(
        gh<_i252.QueueLocalDataSource>(),
        gh<_i714.RemoteLoadingService>(),
        gh<_i509.QueueLogger>(),
        gh<_i39.SyncManager>(),
      ),
    );
    gh.lazySingleton<_i654.DataManagerFactory>(
      () => _i654.DataManagerFactory(
        gh<_i1046.QueueManager>(),
        gh<_i258.RealtimeManager>(),
        gh<_i39.SyncManager>(),
      ),
    );
    gh.singleton<_i864.CurrencyRepo>(
      () => _i864.CurrencyRepo(
        gh<_i714.DataManagerFactory>(),
        gh<_i692.CurrencyLocalDataSource>(),
        gh<_i678.CurrencyRemoteDataSource>(),
      ),
    );
    gh.factory<_i920.OfflineFirstQueueCubit>(
      () => _i920.OfflineFirstQueueCubit(
        gh<_i1046.QueueManager>(),
        gh<_i509.QueueLogger>(),
      ),
    );
    gh.singleton<_i1018.ProfileRepo>(
      () => _i1018.ProfileRepo(
        gh<_i714.DataManagerFactory>(),
        gh<_i372.ProfileLocalDataSource>(),
        gh<_i755.ProfileRemoteDataSource>(),
        gh<_i881.CurrencyRepo>(),
      ),
    );
    gh.singleton<_i28.CategoryRepo>(
      () => _i28.CategoryRepo(
        gh<_i714.DataManagerFactory>(),
        gh<_i871.CategoryLocalDataSource>(),
        gh<_i110.CategoryRemoteDataSource>(),
        gh<_i536.CategoryMapper>(),
      ),
    );
    gh.singleton<_i564.AccountRepo>(
      () => _i564.AccountRepo(
        gh<_i714.DataManagerFactory>(),
        gh<_i1071.AccountLocalDataSource>(),
        gh<_i722.AccountRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i507.GenerateBudgetSummaryUseCase>(
      () => _i507.GenerateBudgetSummaryUseCase(
        gh<_i531.CategoryRepo>(),
        gh<_i226.SummaryDataGenerator>(),
      ),
    );
    gh.factory<_i1005.CategorySaveCubit>(
      () => _i1005.CategorySaveCubit(gh<_i531.CategoryRepo>()),
    );
    gh.lazySingleton<_i455.LoadCategoryListUseCase>(
      () => _i455.LoadCategoryListUseCase(
        gh<_i531.CategoryRepo>(),
        gh<_i714.QueueManager>(),
      ),
    );
    gh.singleton<_i427.BookingRepo>(
      () => _i427.BookingRepo(
        gh<_i714.DataManagerFactory>(),
        gh<_i125.BookingLocalDataSource>(),
        gh<_i1026.BookingRemoteDataSource>(),
        gh<_i1048.BookingMapper>(),
        gh<_i500.AccountRepo>(),
        gh<_i531.CategoryRepo>(),
        gh<_i421.ProfileRepo>(),
      ),
    );
    gh.singleton<List<_i714.Repo<dynamic>>>(
      () => dataManagerModule.repos(
        gh<_i881.CurrencyRepo>(),
        gh<_i421.ProfileRepo>(),
        gh<_i531.CategoryRepo>(),
        gh<_i500.AccountRepo>(),
        gh<_i269.BookingRepo>(),
      ),
    );
    gh.lazySingleton<_i562.ResetBudgetBookUseCase>(
      () => _i562.ResetBudgetBookUseCase(
        gh<_i531.CategoryRepo>(),
        gh<_i500.AccountRepo>(),
        gh<_i269.BookingRepo>(),
        gh<_i714.QueueManager>(),
      ),
    );
    gh.lazySingleton<_i576.BookingAccountService>(
      () => _i576.BookingAccountService(gh<_i500.AccountRepo>()),
    );
    gh.lazySingleton<_i105.OfflineFirstCoordinator>(
      () => _i105.OfflineFirstCoordinator(
        gh<_i1046.QueueManager>(),
        gh<_i39.SyncManager>(),
        gh<_i258.RealtimeManager>(),
        gh<List<_i38.Repo<dynamic>>>(),
        gh<_i428.ConnectivityService>(),
        gh<_i942.SupabaseAuthManager>(),
      ),
    );
    gh.factory<_i788.CategoryListCubit>(
      () => _i788.CategoryListCubit(gh<_i455.LoadCategoryListUseCase>()),
    );
    gh.singleton<_i202.AppLifecycleManager>(
      () => _i202.AppLifecycleManager(
        gh<_i702.ConnectivityService>(),
        gh<_i714.OfflineFirstCoordinator>(),
        gh<_i714.SupabaseAuthManager>(),
      ),
    );
    gh.lazySingleton<_i656.DefaultAccountUseCase>(
      () => _i656.DefaultAccountUseCase(gh<_i576.BookingAccountService>()),
    );
    gh.factory<_i569.BudgetBookCubit>(
      () => _i569.BudgetBookCubit(
        gh<_i507.GenerateBudgetSummaryUseCase>(),
        gh<_i318.FilterAndGroupBookingsUseCase>(),
        gh<_i269.BookingRepo>(),
        gh<_i562.ResetBudgetBookUseCase>(),
        gh<_i196.GenerateBudgetTransactionUseCase>(),
      ),
    );
    gh.factory<_i963.SuggestionCubit>(
      () => _i963.SuggestionCubit(gh<_i269.BookingRepo>()),
    );
    gh.lazySingleton<_i405.SaveBookingUseCase>(
      () => _i405.SaveBookingUseCase(
        gh<_i269.BookingRepo>(),
        gh<_i421.ProfileRepo>(),
      ),
    );
    gh.factory<_i863.BookingSaveCubit>(
      () => _i863.BookingSaveCubit(
        gh<_i405.SaveBookingUseCase>(),
        gh<_i656.DefaultAccountUseCase>(),
        gh<_i269.BookingRepo>(),
        gh<_i226.DefaultNewDateUseCase>(),
      ),
    );
    return this;
  }
}

class _$DatabaseModule extends _i752.DatabaseModule {}

class _$RegisterModule extends _i87.RegisterModule {}

class _$DataManagerModule extends _i192.DataManagerModule {}
