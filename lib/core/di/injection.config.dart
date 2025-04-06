// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:budget_fusion_app/core/core.dart' as _i714;
import 'package:budget_fusion_app/core/di/database_module.dart' as _i752;
import 'package:budget_fusion_app/core/di/injection.dart' as _i87;
import 'package:budget_fusion_app/core/offline_first/cache/cache_manager.dart'
    as _i866;
import 'package:budget_fusion_app/core/offline_first/data_managers/data_manager_factory.dart'
    as _i327;
import 'package:budget_fusion_app/core/offline_first/queue/queue_local_data_source.dart'
    as _i76;
import 'package:budget_fusion_app/core/offline_first/queue/queue_manager.dart'
    as _i327;
import 'package:budget_fusion_app/core/offline_first/realtime/realtime_notifier_service.dart'
    as _i371;
import 'package:budget_fusion_app/features/account/data/data_sources/account_local_data_source.dart'
    as _i431;
import 'package:budget_fusion_app/features/account/data/data_sources/account_remote_data_source.dart'
    as _i990;
import 'package:budget_fusion_app/features/account/data/repos/account_repo_impl.dart'
    as _i518;
import 'package:budget_fusion_app/features/auth/application/login/login_cubit.dart'
    as _i991;
import 'package:budget_fusion_app/features/auth/data/remote_sources/user_remote_source.dart'
    as _i478;
import 'package:budget_fusion_app/features/auth/data/repos/user_repo.dart'
    as _i871;
import 'package:budget_fusion_app/features/booking/application/cubits/booking_cubit.dart'
    as _i190;
import 'package:budget_fusion_app/features/booking/application/cubits/save_booking_cubit.dart'
    as _i416;
import 'package:budget_fusion_app/features/booking/application/use_cases/load_bookings_use_case.dart'
    as _i624;
import 'package:budget_fusion_app/features/booking/application/use_cases/save_booking_use_case.dart'
    as _i144;
import 'package:budget_fusion_app/features/booking/application/use_cases/watch_bookings_use_case.dart'
    as _i7;
import 'package:budget_fusion_app/features/booking/data/data_sources/booking_local_data_source.dart'
    as _i423;
import 'package:budget_fusion_app/features/booking/data/data_sources/booking_remote_data_source.dart'
    as _i121;
import 'package:budget_fusion_app/features/booking/data/repos/booking_repo_impl.dart'
    as _i830;
import 'package:budget_fusion_app/features/budget_book/application/budget_book/cubits/budget_book_cubit.dart'
    as _i332;
import 'package:budget_fusion_app/features/budget_book/application/budget_book/use_cases/filter_and_group_bookings_use_case.dart'
    as _i548;
import 'package:budget_fusion_app/features/budget_book/application/budget_book/use_cases/filter_bookings_use_case.dart'
    as _i971;
import 'package:budget_fusion_app/features/budget_book/application/budget_book/use_cases/generate_budget_summary_use_case.dart'
    as _i885;
import 'package:budget_fusion_app/features/budget_book/application/budget_book/use_cases/reset_budget_book_use_case.dart'
    as _i601;
import 'package:budget_fusion_app/features/budget_book/domain/service/budget_page_data_service.dart'
    as _i198;
import 'package:budget_fusion_app/features/budget_book/domain/service/summary_data_generator.dart'
    as _i811;
import 'package:budget_fusion_app/features/category/application/cubits/category_cubit.dart'
    as _i367;
import 'package:budget_fusion_app/features/category/application/use_cases/load_categories_use_case.dart'
    as _i87;
import 'package:budget_fusion_app/features/category/application/use_cases/watch_categories_use_case.dart'
    as _i47;
import 'package:budget_fusion_app/features/category/data/data_sources/category_local_data_source.dart'
    as _i342;
import 'package:budget_fusion_app/features/category/data/data_sources/category_remote_data_source.dart'
    as _i870;
import 'package:budget_fusion_app/features/category/data/repos/category_repo_impl.dart'
    as _i1056;
import 'package:budget_fusion_app/features/profile/application/cubits/language_cubit.dart'
    as _i487;
import 'package:budget_fusion_app/features/profile/data/data_sources/profile_local_data_source.dart'
    as _i261;
import 'package:budget_fusion_app/features/profile/data/data_sources/profile_remote_data_source.dart'
    as _i594;
import 'package:budget_fusion_app/features/profile/data/data_sources/profile_setting_local_data_source.dart'
    as _i652;
import 'package:budget_fusion_app/features/profile/data/data_sources/profile_setting_remote_data_source.dart'
    as _i146;
import 'package:budget_fusion_app/features/profile/data/repos/profile_repo_impl.dart'
    as _i604;
import 'package:budget_fusion_app/features/profile/data/repos/profile_setting_repo_impl.dart'
    as _i52;
import 'package:budget_fusion_app/main/application/main/main_cubit.dart'
    as _i642;
import 'package:budget_fusion_app/shared/application/cubits/account_cubit.dart'
    as _i8;
import 'package:budget_fusion_app/shared/application/cubits/profile_cubit.dart'
    as _i837;
import 'package:budget_fusion_app/shared/application/cubits/profile_setting_cubit.dart'
    as _i110;
import 'package:budget_fusion_app/shared/application/use_cases/load_accounts_use_case.dart'
    as _i565;
import 'package:budget_fusion_app/shared/application/use_cases/load_profile_setting_use_case.dart'
    as _i757;
import 'package:budget_fusion_app/shared/application/use_cases/load_profile_use_case.dart'
    as _i324;
import 'package:budget_fusion_app/shared/application/use_cases/watch_accounts_use_case.dart'
    as _i515;
import 'package:budget_fusion_app/shared/application/use_cases/watch_bookings_use_case.dart'
    as _i856;
import 'package:budget_fusion_app/shared/application/use_cases/watch_profile_setting_use_case.dart'
    as _i151;
import 'package:budget_fusion_app/shared/application/use_cases/watch_profile_use_case.dart'
    as _i712;
import 'package:budget_fusion_app/shared/domain/aggregator/profile_setting_aggregator.dart'
    as _i1029;
import 'package:budget_fusion_app/shared/shared.dart' as _i332;
import 'package:budget_fusion_app/utils/service/connectivity_service.dart'
    as _i702;
import 'package:budget_fusion_app/utils/service/datetime_service.dart' as _i25;
import 'package:budget_fusion_app/utils/utils.dart' as _i428;
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sqflite/sqflite.dart' as _i779;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final databaseModule = _$DatabaseModule();
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i779.Database>(
      () => databaseModule.provideDatabase(),
      preResolve: true,
    );
    gh.factory<_i487.LanguageCubit>(() => _i487.LanguageCubit());
    gh.factory<_i642.MainCubit>(() => _i642.MainCubit());
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i866.CacheManager>(() => _i866.CacheManager());
    gh.lazySingleton<_i371.RealtimeNotifierService>(
        () => _i371.RealtimeNotifierService());
    gh.lazySingleton<_i870.CategoryRemoteDataSource>(
        () => _i870.CategoryRemoteDataSource());
    gh.lazySingleton<_i478.UserRemoteSource>(() => _i478.UserRemoteSource());
    gh.lazySingleton<_i121.BookingRemoteDataSource>(
        () => _i121.BookingRemoteDataSource());
    gh.lazySingleton<_i146.ProfileSettingRemoteDataSource>(
        () => _i146.ProfileSettingRemoteDataSource());
    gh.lazySingleton<_i594.ProfileRemoteDataSource>(
        () => _i594.ProfileRemoteDataSource());
    gh.lazySingleton<_i990.AccountRemoteDataSource>(
        () => _i990.AccountRemoteDataSource());
    gh.lazySingleton<_i971.FilterBookingsUseCase>(
        () => _i971.FilterBookingsUseCase());
    gh.lazySingleton<_i811.SummaryDataGenerator>(
        () => _i811.SummaryDataGenerator());
    gh.lazySingleton<_i25.DatetimeService>(() => _i25.DatetimeService());
    gh.lazySingleton<_i144.SaveBookingUseCase>(
        () => _i144.SaveBookingUseCase());
    gh.lazySingleton<_i871.UserRepo>(
        () => _i871.UserRepo(gh<_i478.UserRemoteSource>()));
    gh.lazySingleton<_i702.ConnectivityService>(
        () => _i702.ConnectivityService(gh<_i895.Connectivity>()));
    gh.factory<_i991.LoginCubit>(() => _i991.LoginCubit(
          gh<_i871.UserRepo>(),
          gh<_i428.ConnectivityService>(),
        ));
    gh.factory<_i416.SaveBookingCubit>(
        () => _i416.SaveBookingCubit(gh<_i144.SaveBookingUseCase>()));
    gh.lazySingleton<_i76.QueueLocalDataSource>(
        () => _i76.QueueLocalDataSource(gh<_i779.Database>()));
    gh.lazySingleton<_i342.CategoryLocalDataSource>(
        () => _i342.CategoryLocalDataSource(gh<_i779.Database>()));
    gh.lazySingleton<_i423.BookingLocalDataSource>(
        () => _i423.BookingLocalDataSource(gh<_i779.Database>()));
    gh.lazySingleton<_i652.ProfileSettingLocalDataSource>(
        () => _i652.ProfileSettingLocalDataSource(gh<_i779.Database>()));
    gh.lazySingleton<_i261.ProfileLocalDataSource>(
        () => _i261.ProfileLocalDataSource(gh<_i779.Database>()));
    gh.lazySingleton<_i431.AccountLocalDataSource>(
        () => _i431.AccountLocalDataSource(gh<_i779.Database>()));
    gh.lazySingleton<_i327.QueueManager>(
        () => _i327.QueueManager(gh<_i76.QueueLocalDataSource>()));
    gh.lazySingleton<_i327.DataManagerFactory>(() => _i327.DataManagerFactory(
          gh<_i714.CacheManager>(),
          gh<_i714.QueueManager>(),
          gh<_i371.RealtimeNotifierService>(),
        ));
    gh.lazySingleton<_i714.AccountRepo>(() => _i518.AccountRepoImpl(
          gh<_i714.DataManagerFactory>(),
          gh<_i431.AccountLocalDataSource>(),
          gh<_i990.AccountRemoteDataSource>(),
        ));
    gh.lazySingleton<_i714.ProfileSettingRepo>(
        () => _i52.ProfileSettingRepoImpl(
              gh<_i714.DataManagerFactory>(),
              gh<_i652.ProfileSettingLocalDataSource>(),
              gh<_i146.ProfileSettingRemoteDataSource>(),
            ));
    gh.lazySingleton<_i885.GenerateBudgetSummaryUseCase>(
        () => _i885.GenerateBudgetSummaryUseCase(
              gh<_i714.ProfileSettingRepo>(),
              gh<_i811.SummaryDataGenerator>(),
            ));
    gh.lazySingleton<_i565.LoadAccountsUseCase>(
        () => _i565.LoadAccountsUseCase(gh<_i714.AccountRepo>()));
    gh.lazySingleton<_i515.WatchAccountsUseCase>(
        () => _i515.WatchAccountsUseCase(gh<_i714.AccountRepo>()));
    gh.lazySingleton<_i714.CategoryRepo>(() => _i1056.CategoryRepoImpl(
          gh<_i714.DataManagerFactory>(),
          gh<_i342.CategoryLocalDataSource>(),
          gh<_i870.CategoryRemoteDataSource>(),
        ));
    gh.lazySingleton<_i714.ProfileRepo>(() => _i604.ProfileRepoImpl(
          gh<_i714.DataManagerFactory>(),
          gh<_i261.ProfileLocalDataSource>(),
          gh<_i594.ProfileRemoteDataSource>(),
        ));
    gh.lazySingleton<_i324.LoadProfileUseCase>(
        () => _i324.LoadProfileUseCase(gh<_i714.ProfileRepo>()));
    gh.lazySingleton<_i712.WatchProfileUseCase>(
        () => _i712.WatchProfileUseCase(gh<_i714.ProfileRepo>()));
    gh.lazySingleton<_i714.BookingRepo>(() => _i830.BookingRepoImpl(
          gh<_i714.DataManagerFactory>(),
          gh<_i423.BookingLocalDataSource>(),
          gh<_i121.BookingRemoteDataSource>(),
          gh<_i714.AccountRepo>(),
          gh<_i714.CategoryRepo>(),
        ));
    gh.lazySingleton<_i1029.ProfileSettingAggregator>(
        () => _i1029.ProfileSettingAggregator(gh<_i714.ProfileSettingRepo>()));
    gh.lazySingleton<_i757.LoadProfileSettingUseCase>(
        () => _i757.LoadProfileSettingUseCase(gh<_i714.ProfileSettingRepo>()));
    gh.factory<_i151.WatchProfileSettingUseCase>(
        () => _i151.WatchProfileSettingUseCase(gh<_i714.ProfileSettingRepo>()));
    gh.lazySingleton<_i47.WatchCategoriesUseCase>(
        () => _i47.WatchCategoriesUseCase(gh<_i714.CategoryRepo>()));
    gh.lazySingleton<_i87.LoadCategoriesUseCase>(
        () => _i87.LoadCategoriesUseCase(gh<_i714.CategoryRepo>()));
    gh.lazySingleton<_i7.WatchCategoriesUseCase>(
        () => _i7.WatchCategoriesUseCase(gh<_i714.CategoryRepo>()));
    gh.lazySingleton<_i601.ResetBudgetBookUseCase>(
        () => _i601.ResetBudgetBookUseCase(
              gh<_i714.BookingRepo>(),
              gh<_i714.CategoryRepo>(),
              gh<_i714.AccountRepo>(),
            ));
    gh.factory<_i837.ProfileCubit>(() => _i837.ProfileCubit(
          gh<_i332.WatchProfileUseCase>(),
          gh<_i332.LoadProfileUseCase>(),
        ));
    gh.lazySingleton<_i624.LoadBookingsUseCase>(
        () => _i624.LoadBookingsUseCase(gh<_i714.BookingRepo>()));
    gh.factory<_i367.CategoryCubit>(() => _i367.CategoryCubit(
          gh<_i47.WatchCategoriesUseCase>(),
          gh<_i87.LoadCategoriesUseCase>(),
        ));
    gh.factory<_i8.AccountCubit>(() => _i8.AccountCubit(
          gh<_i515.WatchAccountsUseCase>(),
          gh<_i565.LoadAccountsUseCase>(),
        ));
    gh.factory<_i110.ProfileSettingCubit>(() => _i110.ProfileSettingCubit(
          gh<_i332.WatchProfileSettingUseCase>(),
          gh<_i332.LoadProfileSettingUseCase>(),
        ));
    gh.lazySingleton<_i198.BudgetPageDataService>(
        () => _i198.BudgetPageDataService(
              gh<_i714.CategoryRepo>(),
              gh<_i428.DatetimeService>(),
            ));
    gh.factory<_i856.WatchBookingsUseCase>(
        () => _i856.WatchBookingsUseCase(gh<_i714.BookingRepo>()));
    gh.factory<_i190.BookingCubit>(() => _i190.BookingCubit(
          gh<_i332.WatchBookingsUseCase>(),
          gh<_i624.LoadBookingsUseCase>(),
        ));
    gh.lazySingleton<_i548.FilterAndGroupBookingsUseCase>(() =>
        _i548.FilterAndGroupBookingsUseCase(gh<_i198.BudgetPageDataService>()));
    gh.factory<_i332.BudgetBookCubit>(() => _i332.BudgetBookCubit(
          gh<_i885.GenerateBudgetSummaryUseCase>(),
          gh<_i548.FilterAndGroupBookingsUseCase>(),
          gh<_i332.WatchBookingsUseCase>(),
          gh<_i601.ResetBudgetBookUseCase>(),
        ));
    return this;
  }
}

class _$DatabaseModule extends _i752.DatabaseModule {}

class _$RegisterModule extends _i87.RegisterModule {}
