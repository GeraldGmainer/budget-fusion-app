// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:budget_fusion_app/core/di/injection.dart' as _i87;
import 'package:budget_fusion_app/core/service/connectivity_service.dart'
    as _i834;
import 'package:budget_fusion_app/features/budgeting/accounts/data/data_sources/account_remote_source.dart'
    as _i989;
import 'package:budget_fusion_app/features/budgeting/accounts/data/data_sources/data_sources.dart'
    as _i396;
import 'package:budget_fusion_app/features/budgeting/accounts/data/repos/account_repo_impl.dart'
    as _i570;
import 'package:budget_fusion_app/features/budgeting/bookings/data/data_sources/booking_remote_source.dart'
    as _i977;
import 'package:budget_fusion_app/features/budgeting/bookings/data/data_sources/data_sources.dart'
    as _i62;
import 'package:budget_fusion_app/features/budgeting/bookings/data/repos/booking_repo_impl.dart'
    as _i1035;
import 'package:budget_fusion_app/features/budgeting/categories/data/data_sources/category_remote_source.dart'
    as _i453;
import 'package:budget_fusion_app/features/budgeting/categories/data/data_sources/data_sources.dart'
    as _i254;
import 'package:budget_fusion_app/features/budgeting/categories/data/repos/category_repo_impl.dart'
    as _i81;
import 'package:budget_fusion_app/features/budgeting/home/application/blocs/booking_period/booking_period_bloc.dart'
    as _i371;
import 'package:budget_fusion_app/features/budgeting/home/application/blocs/booking_view/booking_view_bloc.dart'
    as _i465;
import 'package:budget_fusion_app/features/budgeting/home/domain/use_cases/budget_book_aggregator.dart'
    as _i688;
import 'package:budget_fusion_app/features/budgeting/home/domain/use_cases/chart_data_service.dart'
    as _i809;
import 'package:budget_fusion_app/features/budgeting/home/home.dart' as _i597;
import 'package:budget_fusion_app/features/budgeting/shared/shared.dart'
    as _i841;
import 'package:budget_fusion_app/features/user/auth/application/blocs/login/login_bloc.dart'
    as _i134;
import 'package:budget_fusion_app/features/user/auth/data/repos/repos.dart'
    as _i89;
import 'package:budget_fusion_app/features/user/auth/data/repos/user_repo.dart'
    as _i660;
import 'package:budget_fusion_app/features/user/auth/data/service/user_client.dart'
    as _i461;
import 'package:budget_fusion_app/features/user/profile/application/blocs/language/language_bloc.dart'
    as _i578;
import 'package:budget_fusion_app/features/user/profile/data/data_sources/data_source.dart'
    as _i634;
import 'package:budget_fusion_app/features/user/profile/data/data_sources/profile_remote_source.dart'
    as _i263;
import 'package:budget_fusion_app/features/user/profile/data/repos/profile_repo_impl.dart'
    as _i292;
import 'package:budget_fusion_app/shared/application/blocs/profile/profile_bloc.dart'
    as _i401;
import 'package:budget_fusion_app/shared/domain/repos/repos.dart' as _i147;
import 'package:budget_fusion_app/shared/shared.dart' as _i332;
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
    gh.factory<_i578.LanguageBloc>(() => _i578.LanguageBloc());
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i461.UserClient>(() => _i461.UserClient());
    gh.lazySingleton<_i263.ProfileRemoteSource>(
        () => _i263.ProfileRemoteSource());
    gh.lazySingleton<_i977.BookingRemoteSource>(
        () => _i977.BookingRemoteSource());
    gh.lazySingleton<_i989.AccountRemoteSource>(
        () => _i989.AccountRemoteSource());
    gh.lazySingleton<_i453.CategoryRemoteSource>(
        () => _i453.CategoryRemoteSource());
    gh.lazySingleton<_i660.UserRepo>(
        () => _i660.UserRepo(gh<_i461.UserClient>()));
    gh.lazySingleton<_i332.ProfileRepo>(
        () => _i292.ProfileRepoImpl(gh<_i634.ProfileRemoteSource>()));
    gh.factory<_i401.ProfileBloc>(
        () => _i401.ProfileBloc(gh<_i147.ProfileRepo>()));
    gh.lazySingleton<_i809.ChartDataService>(
        () => _i809.ChartDataService(gh<_i332.ProfileRepo>()));
    gh.lazySingleton<_i834.ConnectivityService>(
        () => _i834.ConnectivityService(gh<_i895.Connectivity>()));
    gh.factory<_i134.LoginBloc>(() => _i134.LoginBloc(gh<_i89.UserRepo>()));
    gh.lazySingleton<_i841.CategoryRepo>(
        () => _i81.CategoryRepoImpl(gh<_i254.CategoryRemoteSource>()));
    gh.lazySingleton<_i841.AccountRepo>(
        () => _i570.AccountRepoImpl(gh<_i396.AccountRemoteSource>()));
    gh.lazySingleton<_i841.BookingRepo>(() => _i1035.BookingRepoImpl(
          gh<_i62.BookingRemoteSource>(),
          gh<_i841.CategoryRepo>(),
          gh<_i841.AccountRepo>(),
        ));
    gh.factory<_i465.BookingViewBloc>(
        () => _i465.BookingViewBloc(gh<_i597.ChartDataService>()));
    gh.lazySingleton<_i688.BudgetBookAggregator>(
        () => _i688.BudgetBookAggregator(bookingRepo: gh<_i841.BookingRepo>()));
    gh.factory<_i371.BookingPeriodBloc>(
        () => _i371.BookingPeriodBloc(gh<_i597.BudgetBookAggregator>()));
    return this;
  }
}

class _$RegisterModule extends _i87.RegisterModule {}
