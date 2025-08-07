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
import 'package:budget_fusion_app/core/data/offline_first/cache/cache_manager.dart'
    as _i944;
import 'package:budget_fusion_app/core/data/offline_first/cubits/offline_first_queue_cubit.dart'
    as _i920;
import 'package:budget_fusion_app/core/data/offline_first/data_manager/data_manager_factory.dart'
    as _i654;
import 'package:budget_fusion_app/core/data/offline_first/queue/queue_local_data_source.dart'
    as _i252;
import 'package:budget_fusion_app/core/data/offline_first/queue/queue_manager.dart'
    as _i1046;
import 'package:budget_fusion_app/core/data/offline_first/realtime/realtime_notifier_service.dart'
    as _i342;
import 'package:budget_fusion_app/core/data/sync_manager/sync_cursor_repo.dart'
    as _i705;
import 'package:budget_fusion_app/core/data/sync_manager/sync_manager.dart'
    as _i777;
import 'package:budget_fusion_app/core/data/sync_manager/sync_remote_source.dart'
    as _i467;
import 'package:budget_fusion_app/core/di/data_manager_module.dart' as _i192;
import 'package:budget_fusion_app/core/di/database_module.dart' as _i752;
import 'package:budget_fusion_app/core/di/injection.dart' as _i87;
import 'package:budget_fusion_app/core/remote_loading/bloc/remote_loading_cubit.dart'
    as _i234;
import 'package:budget_fusion_app/core/remote_loading/service/remote_loading_service.dart'
    as _i247;
import 'package:budget_fusion_app/data_managers/account/account.dart' as _i633;
import 'package:budget_fusion_app/data_managers/account/account_data_manager.dart'
    as _i598;
import 'package:budget_fusion_app/data_managers/account/data_sources/account_local_data_source.dart'
    as _i832;
import 'package:budget_fusion_app/data_managers/account/data_sources/account_remote_data_source.dart'
    as _i309;
import 'package:budget_fusion_app/data_managers/booking/booking.dart' as _i714;
import 'package:budget_fusion_app/data_managers/booking/booking_data_manager.dart'
    as _i674;
import 'package:budget_fusion_app/data_managers/booking/data_sources/booking_local_data_source.dart'
    as _i1064;
import 'package:budget_fusion_app/data_managers/booking/data_sources/booking_remote_data_source.dart'
    as _i888;
import 'package:budget_fusion_app/data_managers/booking/mappers/booking_mapper.dart'
    as _i771;
import 'package:budget_fusion_app/data_managers/category/category.dart'
    as _i243;
import 'package:budget_fusion_app/data_managers/category/category_data_manager.dart'
    as _i411;
import 'package:budget_fusion_app/data_managers/category/data_sources/category_local_data_source.dart'
    as _i600;
import 'package:budget_fusion_app/data_managers/category/data_sources/category_remote_data_source.dart'
    as _i1002;
import 'package:budget_fusion_app/data_managers/category/mappers/category_mapper.dart'
    as _i306;
import 'package:budget_fusion_app/data_managers/currency/currency.dart'
    as _i999;
import 'package:budget_fusion_app/data_managers/currency/currency_data_manager.dart'
    as _i102;
import 'package:budget_fusion_app/data_managers/currency/data_sources/currency_local_data_source.dart'
    as _i1002;
import 'package:budget_fusion_app/data_managers/currency/data_sources/currency_remote_data_source.dart'
    as _i390;
import 'package:budget_fusion_app/data_managers/profile/data_sources/profile_local_data_source.dart'
    as _i772;
import 'package:budget_fusion_app/data_managers/profile/data_sources/profile_remote_data_source.dart'
    as _i705;
import 'package:budget_fusion_app/data_managers/profile/profile.dart' as _i715;
import 'package:budget_fusion_app/data_managers/profile/profile_data_manager.dart'
    as _i1066;
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
import 'package:budget_fusion_app/main/bloc/offline_first_loader_cubit.dart'
    as _i655;
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
    gh.lazySingleton<_i467.SyncRemoteSource>(() => _i467.SyncRemoteSource());
    gh.lazySingleton<_i944.CacheManager>(() => _i944.CacheManager());
    gh.lazySingleton<_i342.RealtimeNotifierService>(
      () => _i342.RealtimeNotifierService(),
    );
    gh.lazySingleton<_i1002.CategoryRemoteDataSource>(
      () => _i1002.CategoryRemoteDataSource(),
    );
    gh.lazySingleton<_i306.CategoryMapper>(() => _i306.CategoryMapper());
    gh.lazySingleton<_i888.BookingRemoteDataSource>(
      () => _i888.BookingRemoteDataSource(),
    );
    gh.lazySingleton<_i771.BookingMapper>(() => _i771.BookingMapper());
    gh.lazySingleton<_i705.ProfileRemoteDataSource>(
      () => _i705.ProfileRemoteDataSource(),
    );
    gh.lazySingleton<_i309.AccountRemoteDataSource>(
      () => _i309.AccountRemoteDataSource(),
    );
    gh.lazySingleton<_i390.CurrencyRemoteDataSource>(
      () => _i390.CurrencyRemoteDataSource(),
    );
    gh.lazySingleton<_i705.SyncCursorRepo>(
      () => _i705.SyncCursorRepo(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i871.UserRepo>(
      () => _i871.UserRepo(gh<_i478.UserRemoteSource>()),
    );
    gh.lazySingleton<_i78.BudgetPageDataService>(
      () => _i78.BudgetPageDataService(gh<_i428.DatetimeService>()),
    );
    gh.lazySingleton<_i777.SyncManager>(
      () => _i777.SyncManager(
        gh<_i705.SyncCursorRepo>(),
        gh<_i467.SyncRemoteSource>(),
      ),
    );
    gh.factory<_i234.RemoteLoadingCubit>(
      () => _i234.RemoteLoadingCubit(gh<_i247.RemoteLoadingService>()),
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
    gh.lazySingleton<_i252.QueueLocalDataSource>(
      () => _i252.QueueLocalDataSource(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i600.CategoryLocalDataSource>(
      () => _i600.CategoryLocalDataSource(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i1064.BookingLocalDataSource>(
      () => _i1064.BookingLocalDataSource(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i772.ProfileLocalDataSource>(
      () => _i772.ProfileLocalDataSource(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i832.AccountLocalDataSource>(
      () => _i832.AccountLocalDataSource(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i1002.CurrencyLocalDataSource>(
      () => _i1002.CurrencyLocalDataSource(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i318.FilterAndGroupBookingsUseCase>(
      () =>
          _i318.FilterAndGroupBookingsUseCase(gh<_i78.BudgetPageDataService>()),
    );
    gh.lazySingleton<_i1046.QueueManager>(
      () => _i1046.QueueManager(
        gh<_i252.QueueLocalDataSource>(),
        gh<_i714.RemoteLoadingService>(),
      ),
    );
    gh.lazySingleton<_i654.DataManagerFactory>(
      () => _i654.DataManagerFactory(
        gh<_i944.CacheManager>(),
        gh<_i1046.QueueManager>(),
        gh<_i342.RealtimeNotifierService>(),
        gh<_i247.RemoteLoadingService>(),
        gh<_i777.SyncManager>(),
      ),
    );
    gh.singleton<_i411.CategoryDataManager>(
      () => _i411.CategoryDataManager(
        gh<_i714.DataManagerFactory>(),
        gh<_i600.CategoryLocalDataSource>(),
        gh<_i1002.CategoryRemoteDataSource>(),
        gh<_i306.CategoryMapper>(),
      ),
    );
    gh.factory<_i1005.CategorySaveCubit>(
      () => _i1005.CategorySaveCubit(gh<_i243.CategoryDataManager>()),
    );
    gh.lazySingleton<_i455.LoadCategoryListUseCase>(
      () => _i455.LoadCategoryListUseCase(gh<_i243.CategoryDataManager>()),
    );
    gh.factory<_i788.CategoryListCubit>(
      () => _i788.CategoryListCubit(gh<_i455.LoadCategoryListUseCase>()),
    );
    gh.singleton<_i598.AccountDataManager>(
      () => _i598.AccountDataManager(
        gh<_i714.DataManagerFactory>(),
        gh<_i832.AccountLocalDataSource>(),
        gh<_i309.AccountRemoteDataSource>(),
      ),
    );
    gh.singleton<_i102.CurrencyDataManager>(
      () => _i102.CurrencyDataManager(
        gh<_i714.DataManagerFactory>(),
        gh<_i1002.CurrencyLocalDataSource>(),
        gh<_i390.CurrencyRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i576.BookingAccountService>(
      () => _i576.BookingAccountService(gh<_i633.AccountDataManager>()),
    );
    gh.factory<_i920.OfflineFirstQueueCubit>(
      () => _i920.OfflineFirstQueueCubit(gh<_i1046.QueueManager>()),
    );
    gh.lazySingleton<_i507.GenerateBudgetSummaryUseCase>(
      () => _i507.GenerateBudgetSummaryUseCase(
        gh<_i243.CategoryDataManager>(),
        gh<_i226.SummaryDataGenerator>(),
      ),
    );
    gh.singleton<_i1066.ProfileDataManager>(
      () => _i1066.ProfileDataManager(
        gh<_i714.DataManagerFactory>(),
        gh<_i772.ProfileLocalDataSource>(),
        gh<_i705.ProfileRemoteDataSource>(),
        gh<_i999.CurrencyDataManager>(),
      ),
    );
    gh.lazySingleton<_i656.DefaultAccountUseCase>(
      () => _i656.DefaultAccountUseCase(gh<_i576.BookingAccountService>()),
    );
    gh.singleton<_i674.BookingDataManager>(
      () => _i674.BookingDataManager(
        gh<_i714.DataManagerFactory>(),
        gh<_i1064.BookingLocalDataSource>(),
        gh<_i888.BookingRemoteDataSource>(),
        gh<_i771.BookingMapper>(),
        gh<_i633.AccountDataManager>(),
        gh<_i243.CategoryDataManager>(),
        gh<_i715.ProfileDataManager>(),
      ),
    );
    gh.lazySingleton<_i562.ResetBudgetBookUseCase>(
      () => _i562.ResetBudgetBookUseCase(
        gh<_i243.CategoryDataManager>(),
        gh<_i633.AccountDataManager>(),
        gh<_i714.BookingDataManager>(),
        gh<_i715.ProfileDataManager>(),
      ),
    );
    gh.lazySingleton<_i405.SaveBookingUseCase>(
      () => _i405.SaveBookingUseCase(
        gh<_i714.BookingDataManager>(),
        gh<_i715.ProfileDataManager>(),
      ),
    );
    gh.singleton<List<_i714.DataManager<dynamic>>>(
      () => dataManagerModule.managers(
        gh<_i715.ProfileDataManager>(),
        gh<_i999.CurrencyDataManager>(),
        gh<_i243.CategoryDataManager>(),
        gh<_i633.AccountDataManager>(),
        gh<_i714.BookingDataManager>(),
      ),
    );
    gh.factory<_i863.BookingSaveCubit>(
      () => _i863.BookingSaveCubit(
        gh<_i405.SaveBookingUseCase>(),
        gh<_i656.DefaultAccountUseCase>(),
        gh<_i714.BookingDataManager>(),
        gh<_i226.DefaultNewDateUseCase>(),
      ),
    );
    gh.factory<_i655.OfflineFirstLoaderCubit>(
      () => _i655.OfflineFirstLoaderCubit(
        gh<_i714.QueueManager>(),
        gh<_i243.CategoryDataManager>(),
        gh<_i633.AccountDataManager>(),
        gh<_i714.BookingDataManager>(),
        gh<_i715.ProfileDataManager>(),
      ),
    );
    gh.factory<_i569.BudgetBookCubit>(
      () => _i569.BudgetBookCubit(
        gh<_i507.GenerateBudgetSummaryUseCase>(),
        gh<_i318.FilterAndGroupBookingsUseCase>(),
        gh<_i714.BookingDataManager>(),
        gh<_i562.ResetBudgetBookUseCase>(),
        gh<_i196.GenerateBudgetTransactionUseCase>(),
      ),
    );
    gh.factory<_i963.SuggestionCubit>(
      () => _i963.SuggestionCubit(gh<_i714.BookingDataManager>()),
    );
    gh.singleton<_i202.AppLifecycleManager>(
      () => _i202.AppLifecycleManager(gh<List<_i714.DataManager<dynamic>>>()),
    );
    return this;
  }
}

class _$DatabaseModule extends _i752.DatabaseModule {}

class _$RegisterModule extends _i87.RegisterModule {}

class _$DataManagerModule extends _i192.DataManagerModule {}
