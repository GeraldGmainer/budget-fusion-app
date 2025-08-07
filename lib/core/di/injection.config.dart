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
import 'package:budget_fusion_app/core/data_managers/account/account_data_manager.dart'
    as _i818;
import 'package:budget_fusion_app/core/data_managers/account/data_sources/account_local_data_source.dart'
    as _i835;
import 'package:budget_fusion_app/core/data_managers/account/data_sources/account_remote_data_source.dart'
    as _i817;
import 'package:budget_fusion_app/core/data_managers/booking/booking_data_manager.dart'
    as _i219;
import 'package:budget_fusion_app/core/data_managers/booking/data_sources/booking_local_data_source.dart'
    as _i745;
import 'package:budget_fusion_app/core/data_managers/booking/data_sources/booking_remote_data_source.dart'
    as _i983;
import 'package:budget_fusion_app/core/data_managers/booking/mappers/booking_mapper.dart'
    as _i162;
import 'package:budget_fusion_app/core/data_managers/category/category_data_manager.dart'
    as _i841;
import 'package:budget_fusion_app/core/data_managers/category/data_sources/category_local_data_source.dart'
    as _i219;
import 'package:budget_fusion_app/core/data_managers/category/data_sources/category_remote_data_source.dart'
    as _i828;
import 'package:budget_fusion_app/core/data_managers/category/mappers/category_mapper.dart'
    as _i699;
import 'package:budget_fusion_app/core/data_managers/currency/currency_data_manager.dart'
    as _i616;
import 'package:budget_fusion_app/core/data_managers/currency/data_sources/currency_local_data_source.dart'
    as _i409;
import 'package:budget_fusion_app/core/data_managers/currency/data_sources/currency_remote_data_source.dart'
    as _i112;
import 'package:budget_fusion_app/core/data_managers/profile/data_sources/profile_local_data_source.dart'
    as _i627;
import 'package:budget_fusion_app/core/data_managers/profile/data_sources/profile_remote_data_source.dart'
    as _i412;
import 'package:budget_fusion_app/core/data_managers/profile/profile_data_manager.dart'
    as _i824;
import 'package:budget_fusion_app/core/di/data_manager_module.dart' as _i192;
import 'package:budget_fusion_app/core/di/database_module.dart' as _i752;
import 'package:budget_fusion_app/core/di/injection.dart' as _i87;
import 'package:budget_fusion_app/core/offline_first/cache/cache_manager.dart'
    as _i866;
import 'package:budget_fusion_app/core/offline_first/cubits/offline_first_queue_cubit.dart'
    as _i810;
import 'package:budget_fusion_app/core/offline_first/data_manager/data_manager_factory.dart'
    as _i657;
import 'package:budget_fusion_app/core/offline_first/queue/queue_local_data_source.dart'
    as _i76;
import 'package:budget_fusion_app/core/offline_first/queue/queue_manager.dart'
    as _i327;
import 'package:budget_fusion_app/core/offline_first/realtime/realtime_notifier_service.dart'
    as _i371;
import 'package:budget_fusion_app/core/offline_first/sync_manager/sync_cursor_repo.dart'
    as _i136;
import 'package:budget_fusion_app/core/offline_first/sync_manager/sync_manager.dart'
    as _i32;
import 'package:budget_fusion_app/core/offline_first/sync_manager/sync_remote_source.dart'
    as _i398;
import 'package:budget_fusion_app/core/remote_loading/bloc/remote_loading_cubit.dart'
    as _i234;
import 'package:budget_fusion_app/core/remote_loading/service/remote_loading_service.dart'
    as _i247;
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
    gh.lazySingleton<_i828.CategoryRemoteDataSource>(
      () => _i828.CategoryRemoteDataSource(),
    );
    gh.lazySingleton<_i699.CategoryMapper>(() => _i699.CategoryMapper());
    gh.lazySingleton<_i983.BookingRemoteDataSource>(
      () => _i983.BookingRemoteDataSource(),
    );
    gh.lazySingleton<_i162.BookingMapper>(() => _i162.BookingMapper());
    gh.lazySingleton<_i412.ProfileRemoteDataSource>(
      () => _i412.ProfileRemoteDataSource(),
    );
    gh.lazySingleton<_i817.AccountRemoteDataSource>(
      () => _i817.AccountRemoteDataSource(),
    );
    gh.lazySingleton<_i112.CurrencyRemoteDataSource>(
      () => _i112.CurrencyRemoteDataSource(),
    );
    gh.lazySingleton<_i247.RemoteLoadingService>(
      () => _i247.RemoteLoadingService(),
    );
    gh.lazySingleton<_i866.CacheManager>(() => _i866.CacheManager());
    gh.lazySingleton<_i371.RealtimeNotifierService>(
      () => _i371.RealtimeNotifierService(),
    );
    gh.lazySingleton<_i398.SyncRemoteSource>(() => _i398.SyncRemoteSource());
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
    gh.lazySingleton<_i136.SyncCursorRepo>(
      () => _i136.SyncCursorRepo(gh<_i460.SharedPreferences>()),
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
    gh.lazySingleton<_i219.CategoryLocalDataSource>(
      () => _i219.CategoryLocalDataSource(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i745.BookingLocalDataSource>(
      () => _i745.BookingLocalDataSource(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i627.ProfileLocalDataSource>(
      () => _i627.ProfileLocalDataSource(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i835.AccountLocalDataSource>(
      () => _i835.AccountLocalDataSource(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i409.CurrencyLocalDataSource>(
      () => _i409.CurrencyLocalDataSource(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i76.QueueLocalDataSource>(
      () => _i76.QueueLocalDataSource(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i32.SyncManager>(
      () => _i32.SyncManager(
        gh<_i136.SyncCursorRepo>(),
        gh<_i398.SyncRemoteSource>(),
      ),
    );
    gh.lazySingleton<_i318.FilterAndGroupBookingsUseCase>(
      () =>
          _i318.FilterAndGroupBookingsUseCase(gh<_i78.BudgetPageDataService>()),
    );
    gh.lazySingleton<_i327.QueueManager>(
      () => _i327.QueueManager(
        gh<_i76.QueueLocalDataSource>(),
        gh<_i714.RemoteLoadingService>(),
      ),
    );
    gh.factory<_i810.OfflineFirstQueueCubit>(
      () => _i810.OfflineFirstQueueCubit(gh<_i714.QueueManager>()),
    );
    gh.lazySingleton<_i657.DataManagerFactory>(
      () => _i657.DataManagerFactory(
        gh<_i714.CacheManager>(),
        gh<_i714.QueueManager>(),
        gh<_i371.RealtimeNotifierService>(),
        gh<_i714.RemoteLoadingService>(),
        gh<_i32.SyncManager>(),
      ),
    );
    gh.singleton<_i616.CurrencyDataManager>(
      () => _i616.CurrencyDataManager(
        gh<_i714.DataManagerFactory>(),
        gh<_i409.CurrencyLocalDataSource>(),
        gh<_i112.CurrencyRemoteDataSource>(),
      ),
    );
    gh.singleton<_i818.AccountDataManager>(
      () => _i818.AccountDataManager(
        gh<_i714.DataManagerFactory>(),
        gh<_i835.AccountLocalDataSource>(),
        gh<_i817.AccountRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i576.BookingAccountService>(
      () => _i576.BookingAccountService(gh<_i714.AccountDataManager>()),
    );
    gh.singleton<_i841.CategoryDataManager>(
      () => _i841.CategoryDataManager(
        gh<_i714.DataManagerFactory>(),
        gh<_i219.CategoryLocalDataSource>(),
        gh<_i828.CategoryRemoteDataSource>(),
        gh<_i699.CategoryMapper>(),
      ),
    );
    gh.singleton<_i824.ProfileDataManager>(
      () => _i824.ProfileDataManager(
        gh<_i714.DataManagerFactory>(),
        gh<_i627.ProfileLocalDataSource>(),
        gh<_i412.ProfileRemoteDataSource>(),
        gh<_i714.CurrencyDataManager>(),
      ),
    );
    gh.lazySingleton<_i656.DefaultAccountUseCase>(
      () => _i656.DefaultAccountUseCase(gh<_i576.BookingAccountService>()),
    );
    gh.lazySingleton<_i455.LoadCategoryListUseCase>(
      () => _i455.LoadCategoryListUseCase(gh<_i714.CategoryDataManager>()),
    );
    gh.factory<_i1005.CategorySaveCubit>(
      () => _i1005.CategorySaveCubit(gh<_i714.CategoryDataManager>()),
    );
    gh.singleton<_i219.BookingDataManager>(
      () => _i219.BookingDataManager(
        gh<_i714.DataManagerFactory>(),
        gh<_i745.BookingLocalDataSource>(),
        gh<_i983.BookingRemoteDataSource>(),
        gh<_i162.BookingMapper>(),
        gh<_i714.AccountDataManager>(),
        gh<_i714.CategoryDataManager>(),
        gh<_i714.ProfileDataManager>(),
      ),
    );
    gh.lazySingleton<_i507.GenerateBudgetSummaryUseCase>(
      () => _i507.GenerateBudgetSummaryUseCase(
        gh<_i714.CategoryDataManager>(),
        gh<_i226.SummaryDataGenerator>(),
      ),
    );
    gh.singleton<List<_i714.DataManager<dynamic>>>(
      () => dataManagerModule.managers(
        gh<_i714.ProfileDataManager>(),
        gh<_i714.CurrencyDataManager>(),
        gh<_i714.CategoryDataManager>(),
        gh<_i714.AccountDataManager>(),
        gh<_i714.BookingDataManager>(),
      ),
    );
    gh.lazySingleton<_i405.SaveBookingUseCase>(
      () => _i405.SaveBookingUseCase(
        gh<_i714.BookingDataManager>(),
        gh<_i714.ProfileDataManager>(),
      ),
    );
    gh.factory<_i788.CategoryListCubit>(
      () => _i788.CategoryListCubit(gh<_i455.LoadCategoryListUseCase>()),
    );
    gh.factory<_i963.SuggestionCubit>(
      () => _i963.SuggestionCubit(gh<_i714.BookingDataManager>()),
    );
    gh.factory<_i655.OfflineFirstLoaderCubit>(
      () => _i655.OfflineFirstLoaderCubit(
        gh<_i714.QueueManager>(),
        gh<_i714.CategoryDataManager>(),
        gh<_i714.AccountDataManager>(),
        gh<_i714.BookingDataManager>(),
        gh<_i714.ProfileDataManager>(),
      ),
    );
    gh.singleton<_i202.AppLifecycleManager>(
      () => _i202.AppLifecycleManager(gh<List<_i714.DataManager<dynamic>>>()),
    );
    gh.lazySingleton<_i562.ResetBudgetBookUseCase>(
      () => _i562.ResetBudgetBookUseCase(
        gh<_i714.CategoryDataManager>(),
        gh<_i714.AccountDataManager>(),
        gh<_i714.BookingDataManager>(),
        gh<_i714.ProfileDataManager>(),
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
    gh.factory<_i569.BudgetBookCubit>(
      () => _i569.BudgetBookCubit(
        gh<_i507.GenerateBudgetSummaryUseCase>(),
        gh<_i318.FilterAndGroupBookingsUseCase>(),
        gh<_i714.BookingDataManager>(),
        gh<_i562.ResetBudgetBookUseCase>(),
        gh<_i196.GenerateBudgetTransactionUseCase>(),
      ),
    );
    return this;
  }
}

class _$DatabaseModule extends _i752.DatabaseModule {}

class _$RegisterModule extends _i87.RegisterModule {}

class _$DataManagerModule extends _i192.DataManagerModule {}
