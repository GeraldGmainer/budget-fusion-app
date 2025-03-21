// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:budget_fusion_app/core/core.dart' as _i714;
import 'package:budget_fusion_app/core/di/database_module.dart' as _i752;
import 'package:budget_fusion_app/core/di/domain_module.dart' as _i538;
import 'package:budget_fusion_app/core/di/injection.dart' as _i87;
import 'package:budget_fusion_app/core/di/registry/domain_registry.dart'
    as _i279;
import 'package:budget_fusion_app/core/offline_first/cache/cache_manager.dart'
    as _i866;
import 'package:budget_fusion_app/core/offline_first/data_managers/data_manager_factory.dart'
    as _i327;
import 'package:budget_fusion_app/core/offline_first/queue/queue_item_processor.dart'
    as _i441;
import 'package:budget_fusion_app/core/offline_first/queue/queue_local_data_source.dart'
    as _i76;
import 'package:budget_fusion_app/core/offline_first/queue/queue_manager.dart'
    as _i327;
import 'package:budget_fusion_app/core/offline_first/realtime/realtime_notifier_service.dart'
    as _i371;
import 'package:budget_fusion_app/features/auth/application/login/login_cubit.dart'
    as _i991;
import 'package:budget_fusion_app/features/auth/data/remote_sources/user_remote_source.dart'
    as _i478;
import 'package:budget_fusion_app/features/auth/data/repos/user_repo.dart'
    as _i871;
import 'package:budget_fusion_app/features/budget_book/application/budget_book/cubits/budget_book_cubit.dart'
    as _i332;
import 'package:budget_fusion_app/features/budget_book/application/budget_book/use_cases/fetch_and_group_budget_book_data_use_case.dart'
    as _i443;
import 'package:budget_fusion_app/features/budget_book/application/budget_book/use_cases/filter_bookings_use_case.dart'
    as _i971;
import 'package:budget_fusion_app/features/budget_book/application/budget_book/use_cases/generate_budget_summary_use_case.dart'
    as _i885;
import 'package:budget_fusion_app/features/profile/application/cubits/language/language_cubit.dart'
    as _i251;
import 'package:budget_fusion_app/features/profile/application/cubits/profile/profile_cubit.dart'
    as _i78;
import 'package:budget_fusion_app/features/profile/application/cubits/profile_settings/profile_settings_cubit.dart'
    as _i819;
import 'package:budget_fusion_app/features/profile/application/use_cases/profile/load_profile_use_case.dart'
    as _i75;
import 'package:budget_fusion_app/features/profile/application/use_cases/profile/watch_profile_use_case.dart'
    as _i373;
import 'package:budget_fusion_app/features/profile/data/adapters/profile_adapter.dart'
    as _i283;
import 'package:budget_fusion_app/features/profile/data/data_sources/profile_local_data_source.dart'
    as _i261;
import 'package:budget_fusion_app/features/profile/data/data_sources/profile_remote_data_source.dart'
    as _i594;
import 'package:budget_fusion_app/features/profile/data/data_sources/profile_settings_remote_data_source.dart'
    as _i576;
import 'package:budget_fusion_app/features/profile/data/repos/profile_repo_impl.dart'
    as _i604;
import 'package:budget_fusion_app/features/profile/data/repos/profile_settings_repo_impl.dart'
    as _i1002;
import 'package:budget_fusion_app/features/profile/domain/service/profile_domain_service.dart'
    as _i582;
import 'package:budget_fusion_app/features/profile/profile.dart' as _i326;
import 'package:budget_fusion_app/main/application/main/main_cubit.dart'
    as _i642;
import 'package:budget_fusion_app/shared/application/use_cases/get_currency_use_case.dart'
    as _i209;
import 'package:budget_fusion_app/shared/application/use_cases/load_aggregated_bookings_use_case.dart'
    as _i618;
import 'package:budget_fusion_app/utils/service/connectivity_service.dart'
    as _i702;
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
    final domainModule = _$DomainModule();
    await gh.factoryAsync<_i779.Database>(
      () => databaseModule.provideDatabase(),
      preResolve: true,
    );
    gh.factory<_i251.LanguageCubit>(() => _i251.LanguageCubit());
    gh.factory<_i642.MainCubit>(() => _i642.MainCubit());
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i866.CacheManager>(() => _i866.CacheManager());
    gh.lazySingleton<_i371.RealtimeNotifierService>(
        () => _i371.RealtimeNotifierService());
    gh.lazySingleton<_i478.UserRemoteSource>(() => _i478.UserRemoteSource());
    gh.lazySingleton<_i283.ProfileAdapter>(() => _i283.ProfileAdapter());
    gh.lazySingleton<_i576.ProfileSettingsRemoteDataSource>(
        () => _i576.ProfileSettingsRemoteDataSource());
    gh.lazySingleton<_i594.ProfileRemoteDataSource>(
        () => _i594.ProfileRemoteDataSource());
    gh.lazySingleton<_i971.FilterBookingsUseCase>(
        () => _i971.FilterBookingsUseCase());
    gh.lazySingleton<_i885.GenerateBudgetSummaryUseCase>(
        () => _i885.GenerateBudgetSummaryUseCase());
    gh.lazySingleton<_i443.FetchAndGroupBudgetBookDataUseCase>(
        () => _i443.FetchAndGroupBudgetBookDataUseCase());
    gh.lazySingleton<_i714.ProfileSettingsRepo>(() =>
        _i1002.ProfileSettingsRepoImpl(
            gh<_i576.ProfileSettingsRemoteDataSource>()));
    gh.lazySingleton<_i871.UserRepo>(
        () => _i871.UserRepo(gh<_i478.UserRemoteSource>()));
    gh.lazySingleton<_i261.ProfileLocalDataSource>(
        () => _i261.ProfileLocalDataSource(gh<_i779.Database>()));
    gh.lazySingleton<_i209.GetCurrencyUseCase>(
        () => _i209.GetCurrencyUseCase(gh<_i714.ProfileSettingsRepo>()));
    gh.lazySingleton<_i279.DomainRegistry>(
        () => domainModule.provideDomainDataSourceRegistry(
              gh<_i326.ProfileRemoteDataSource>(),
              gh<_i326.ProfileLocalDataSource>(),
              gh<_i326.ProfileAdapter>(),
            ));
    gh.lazySingleton<_i702.ConnectivityService>(
        () => _i702.ConnectivityService(gh<_i895.Connectivity>()));
    gh.factory<_i991.LoginCubit>(() => _i991.LoginCubit(
          gh<_i871.UserRepo>(),
          gh<_i428.ConnectivityService>(),
        ));
    gh.lazySingleton<_i76.QueueLocalDataSource>(
        () => _i76.QueueLocalDataSource(gh<_i779.Database>()));
    gh.factory<_i332.BudgetBookCubit>(() => _i332.BudgetBookCubit(
          gh<_i443.FetchAndGroupBudgetBookDataUseCase>(),
          gh<_i885.GenerateBudgetSummaryUseCase>(),
          gh<_i209.GetCurrencyUseCase>(),
          gh<_i971.FilterBookingsUseCase>(),
        ));
    gh.factory<_i618.LoadAggregatedBookingsUseCase>(
        () => _i618.LoadAggregatedBookingsUseCase(
              gh<_i714.BookingRepo>(),
              gh<_i714.CategoryRepo>(),
              gh<_i714.AccountRepo>(),
            ));
    gh.factory<_i819.ProfileSettingsCubit>(
        () => _i819.ProfileSettingsCubit(gh<_i714.ProfileSettingsRepo>()));
    gh.lazySingleton<_i327.QueueManager>(() => _i327.QueueManager(
          localDataSource: gh<_i76.QueueLocalDataSource>(),
          processors: gh<List<_i441.QueueItemProcessor>>(),
        ));
    gh.lazySingleton<_i327.DataManagerFactory>(() => _i327.DataManagerFactory(
          gh<_i714.CacheManager>(),
          gh<_i714.QueueManager>(),
          gh<_i714.DomainRegistry>(),
          gh<_i371.RealtimeNotifierService>(),
        ));
    gh.lazySingleton<_i714.ProfileRepo>(
        () => _i604.ProfileRepoImpl(gh<_i714.DataManagerFactory>()));
    gh.lazySingleton<_i582.ProfileDomainService>(
        () => _i582.ProfileDomainService(gh<_i714.ProfileRepo>()));
    gh.lazySingleton<_i373.WatchProfileUseCase>(
        () => _i373.WatchProfileUseCase(gh<_i582.ProfileDomainService>()));
    gh.lazySingleton<_i75.LoadProfileUseCase>(
        () => _i75.LoadProfileUseCase(gh<_i582.ProfileDomainService>()));
    gh.factory<_i78.ProfileCubit>(() => _i78.ProfileCubit(
          gh<_i373.WatchProfileUseCase>(),
          gh<_i75.LoadProfileUseCase>(),
        ));
    return this;
  }
}

class _$DatabaseModule extends _i752.DatabaseModule {}

class _$RegisterModule extends _i87.RegisterModule {}

class _$DomainModule extends _i538.DomainModule {}
