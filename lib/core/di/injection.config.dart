// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:budget_fusion_app/core/cache/cache_manager.dart' as _i1026;
import 'package:budget_fusion_app/core/core.dart' as _i714;
import 'package:budget_fusion_app/core/di/database_module.dart' as _i752;
import 'package:budget_fusion_app/core/di/injection.dart' as _i87;
import 'package:budget_fusion_app/core/queue/queue_manager.dart' as _i872;
import 'package:budget_fusion_app/core/sync/sync_manager.dart' as _i589;
import 'package:budget_fusion_app/features/auth/application/login/login_cubit.dart'
    as _i991;
import 'package:budget_fusion_app/features/auth/data/remote_sources/user_remote_source.dart'
    as _i478;
import 'package:budget_fusion_app/features/auth/data/repos/user_repo.dart'
    as _i871;
import 'package:budget_fusion_app/features/profile/application/cubits/language/language_cubit.dart'
    as _i251;
import 'package:budget_fusion_app/features/profile/application/cubits/profile/profile_cubit.dart'
    as _i78;
import 'package:budget_fusion_app/features/profile/application/cubits/profile_settings/profile_settings_cubit.dart'
    as _i819;
import 'package:budget_fusion_app/features/profile/application/use_cases/profile/load_profile.dart'
    as _i976;
import 'package:budget_fusion_app/features/profile/application/use_cases/profile/watch_profile.dart'
    as _i694;
import 'package:budget_fusion_app/features/profile/data/adapters/profile_adapter.dart'
    as _i283;
import 'package:budget_fusion_app/features/profile/data/data_sources/profile_local_source.dart'
    as _i179;
import 'package:budget_fusion_app/features/profile/data/data_sources/profile_remote_source.dart'
    as _i323;
import 'package:budget_fusion_app/features/profile/data/data_sources/profile_settings_remote_source.dart'
    as _i131;
import 'package:budget_fusion_app/features/profile/data/repos/profile_repo_impl.dart'
    as _i604;
import 'package:budget_fusion_app/features/profile/data/repos/profile_settings_repo_impl.dart'
    as _i1002;
import 'package:budget_fusion_app/main/application/main/main_cubit.dart'
    as _i642;
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
    gh.factory<_i283.ProfileAdapter>(() => _i283.ProfileAdapter());
    gh.factory<_i642.MainCubit>(() => _i642.MainCubit());
    await gh.factoryAsync<_i779.Database>(
      () => databaseModule.provideDatabase(),
      preResolve: true,
    );
    gh.factory<_i251.LanguageCubit>(() => _i251.LanguageCubit());
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i1026.CacheManager>(() => _i1026.CacheManager());
    gh.lazySingleton<_i872.QueueManager>(() => _i872.QueueManager());
    gh.lazySingleton<_i589.SyncManager>(() => _i589.SyncManager());
    gh.lazySingleton<_i478.UserRemoteSource>(() => _i478.UserRemoteSource());
    gh.lazySingleton<_i323.ProfileRemoteSource>(
        () => _i323.ProfileRemoteSource());
    gh.lazySingleton<_i131.ProfileSettingsRemoteSource>(
        () => _i131.ProfileSettingsRemoteSource());
    gh.lazySingleton<_i714.ProfileSettingsRepo>(() =>
        _i1002.ProfileSettingsRepoImpl(
            gh<_i131.ProfileSettingsRemoteSource>()));
    gh.lazySingleton<_i871.UserRepo>(
        () => _i871.UserRepo(gh<_i478.UserRemoteSource>()));
    gh.lazySingleton<_i702.ConnectivityService>(
        () => _i702.ConnectivityService(gh<_i895.Connectivity>()));
    gh.factory<_i991.LoginCubit>(() => _i991.LoginCubit(
          gh<_i871.UserRepo>(),
          gh<_i428.ConnectivityService>(),
        ));
    gh.lazySingleton<_i179.ProfileLocalSource>(
        () => _i179.ProfileLocalSource(gh<_i779.Database>()));
    gh.factory<_i819.ProfileSettingsCubit>(
        () => _i819.ProfileSettingsCubit(gh<_i714.ProfileSettingsRepo>()));
    gh.lazySingleton<_i714.ProfileRepo>(() => _i604.ProfileRepoImpl(
          gh<_i179.ProfileLocalSource>(),
          gh<_i323.ProfileRemoteSource>(),
          gh<_i714.CacheManager>(),
          gh<_i714.QueueManager>(),
          gh<_i714.SyncManager>(),
          gh<_i283.ProfileAdapter>(),
        ));
    gh.lazySingleton<_i694.WatchProfile>(
        () => _i694.WatchProfile(gh<_i714.ProfileRepo>()));
    gh.lazySingleton<_i976.LoadProfile>(
        () => _i976.LoadProfile(gh<_i714.ProfileRepo>()));
    gh.factory<_i78.ProfileCubit>(() => _i78.ProfileCubit(
          gh<_i694.WatchProfile>(),
          gh<_i976.LoadProfile>(),
        ));
    return this;
  }
}

class _$DatabaseModule extends _i752.DatabaseModule {}

class _$RegisterModule extends _i87.RegisterModule {}
