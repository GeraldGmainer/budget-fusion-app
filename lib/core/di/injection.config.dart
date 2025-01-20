// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:budget_fusion_app/core/core.dart' as _i714;
import 'package:budget_fusion_app/core/di/injection.dart' as _i87;
import 'package:budget_fusion_app/features/auth/application/login/login_cubit.dart'
    as _i991;
import 'package:budget_fusion_app/features/auth/data/remote_sources/user_remote_source.dart'
    as _i478;
import 'package:budget_fusion_app/features/auth/data/repos/user_repo.dart'
    as _i871;
import 'package:budget_fusion_app/features/profile/application/language/language_cubit.dart'
    as _i752;
import 'package:budget_fusion_app/features/profile/application/profile/profile_cubit.dart'
    as _i304;
import 'package:budget_fusion_app/features/profile/application/profile_settings/profile_settings_cubit.dart'
    as _i877;
import 'package:budget_fusion_app/features/profile/data/data_sources/profile_remote_source.dart'
    as _i323;
import 'package:budget_fusion_app/features/profile/data/repos/profile_repo_impl.dart'
    as _i604;
import 'package:budget_fusion_app/main/application/main/main_cubit.dart'
    as _i642;
import 'package:budget_fusion_app/utils/service/connectivity_service.dart'
    as _i702;
import 'package:budget_fusion_app/utils/utils.dart' as _i428;
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i752.LanguageCubit>(() => _i752.LanguageCubit());
    gh.factory<_i642.MainCubit>(() => _i642.MainCubit());
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i478.UserRemoteSource>(() => _i478.UserRemoteSource());
    gh.lazySingleton<_i323.ProfileRemoteSource>(
        () => _i323.ProfileRemoteSource());
    gh.lazySingleton<_i871.UserRepo>(
        () => _i871.UserRepo(gh<_i478.UserRemoteSource>()));
    gh.lazySingleton<_i702.ConnectivityService>(
        () => _i702.ConnectivityService(gh<_i895.Connectivity>()));
    gh.factory<_i991.LoginCubit>(() => _i991.LoginCubit(
          gh<_i871.UserRepo>(),
          gh<_i428.ConnectivityService>(),
        ));
    gh.lazySingleton<_i714.ProfileRepo>(
        () => _i604.ProfileRepoImpl(gh<_i323.ProfileRemoteSource>()));
    gh.factory<_i877.ProfileSettingsCubit>(
        () => _i877.ProfileSettingsCubit(gh<_i714.ProfileRepo>()));
    gh.factory<_i304.ProfileCubit>(
        () => _i304.ProfileCubit(gh<_i714.ProfileRepo>()));
    return this;
  }
}

class _$RegisterModule extends _i87.RegisterModule {}
