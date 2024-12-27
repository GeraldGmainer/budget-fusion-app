// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:budget_fusion_app/app/main_page/bloc/main_bloc.dart' as _i809;
import 'package:budget_fusion_app/core/cache/cache_manager.dart' as _i1026;
import 'package:budget_fusion_app/core/core.dart' as _i714;
import 'package:budget_fusion_app/core/di/injection.dart' as _i87;
import 'package:budget_fusion_app/core/service/connectivity_service.dart'
    as _i834;
import 'package:budget_fusion_app/features/accounts/data/data_sources/account_remote_source.dart'
    as _i664;
import 'package:budget_fusion_app/features/accounts/data/data_sources/data_sources.dart'
    as _i636;
import 'package:budget_fusion_app/features/accounts/data/repos/account_repo_impl.dart'
    as _i352;
import 'package:budget_fusion_app/features/auth/application/blocs/login/login_bloc.dart'
    as _i983;
import 'package:budget_fusion_app/features/auth/data/repos/repos.dart' as _i706;
import 'package:budget_fusion_app/features/auth/data/repos/user_repo.dart'
    as _i871;
import 'package:budget_fusion_app/features/auth/data/service/user_client.dart'
    as _i778;
import 'package:budget_fusion_app/features/bookings/data/data_sources/booking_remote_source.dart'
    as _i173;
import 'package:budget_fusion_app/features/bookings/data/data_sources/data_sources.dart'
    as _i729;
import 'package:budget_fusion_app/features/bookings/data/repos/booking_repo_impl.dart'
    as _i1073;
import 'package:budget_fusion_app/features/budget_book/application/blocs/booking_page/booking_page_bloc.dart'
    as _i862;
import 'package:budget_fusion_app/features/budget_book/domain/domain.dart'
    as _i351;
import 'package:budget_fusion_app/features/budget_book/domain/services/booking_filter_service.dart'
    as _i188;
import 'package:budget_fusion_app/features/budget_book/domain/services/booking_page_converter.dart'
    as _i821;
import 'package:budget_fusion_app/features/budget_book/domain/services/booking_pagination_service.dart'
    as _i25;
import 'package:budget_fusion_app/features/budget_book/domain/use_cases/booking_page_data_loader.dart'
    as _i49;
import 'package:budget_fusion_app/features/budget_book/domain/use_cases/filter_bookings_use_case.dart'
    as _i575;
import 'package:budget_fusion_app/features/budget_book/domain/use_cases/summary_aggregator.dart'
    as _i624;
import 'package:budget_fusion_app/features/categories/data/data_sources/category_remote_source.dart'
    as _i555;
import 'package:budget_fusion_app/features/categories/data/data_sources/data_sources.dart'
    as _i123;
import 'package:budget_fusion_app/features/categories/data/repos/category_repo_impl.dart'
    as _i760;
import 'package:budget_fusion_app/features/profile/application/blocs/language/language_bloc.dart'
    as _i1012;
import 'package:budget_fusion_app/features/profile/data/data_sources/data_source.dart'
    as _i1053;
import 'package:budget_fusion_app/features/profile/data/data_sources/profile_remote_source.dart'
    as _i323;
import 'package:budget_fusion_app/features/profile/data/repos/profile_repo_impl.dart'
    as _i604;
import 'package:budget_fusion_app/shared/application/blocs/profile/profile_bloc.dart'
    as _i401;
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
    gh.factory<_i809.MainBloc>(() => _i809.MainBloc());
    gh.factory<_i1012.LanguageBloc>(() => _i1012.LanguageBloc());
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i1026.CacheManager>(() => _i1026.CacheManager());
    gh.lazySingleton<_i173.BookingRemoteSource>(
        () => _i173.BookingRemoteSource());
    gh.lazySingleton<_i778.UserClient>(() => _i778.UserClient());
    gh.lazySingleton<_i323.ProfileRemoteSource>(
        () => _i323.ProfileRemoteSource());
    gh.lazySingleton<_i664.AccountRemoteSource>(
        () => _i664.AccountRemoteSource());
    gh.lazySingleton<_i188.BookingFilterService>(
        () => _i188.BookingFilterService());
    gh.lazySingleton<_i25.BookingPaginationService>(
        () => _i25.BookingPaginationService());
    gh.lazySingleton<_i821.BookingPageConverter>(
        () => _i821.BookingPageConverter());
    gh.lazySingleton<_i555.CategoryRemoteSource>(
        () => _i555.CategoryRemoteSource());
    gh.lazySingleton<_i714.CategoryRepo>(
        () => _i760.CategoryRepoImpl(gh<_i123.CategoryRemoteSource>()));
    gh.lazySingleton<_i714.ProfileRepo>(
        () => _i604.ProfileRepoImpl(gh<_i1053.ProfileRemoteSource>()));
    gh.factory<_i401.ProfileBloc>(
        () => _i401.ProfileBloc(gh<_i714.ProfileRepo>()));
    gh.lazySingleton<_i624.SummaryAggregator>(
        () => _i624.SummaryAggregator(gh<_i714.ProfileRepo>()));
    gh.lazySingleton<_i575.FilterBookingsUseCase>(
        () => _i575.FilterBookingsUseCase(gh<_i351.BookingFilterService>()));
    gh.lazySingleton<_i834.ConnectivityService>(
        () => _i834.ConnectivityService(gh<_i895.Connectivity>()));
    gh.lazySingleton<_i871.UserRepo>(
        () => _i871.UserRepo(gh<_i778.UserClient>()));
    gh.lazySingleton<_i714.AccountRepo>(
        () => _i352.AccountRepoImpl(gh<_i636.AccountRemoteSource>()));
    gh.lazySingleton<_i714.BookingRepo>(() => _i1073.BookingRepoImpl(
          gh<_i729.BookingRemoteSource>(),
          gh<_i714.CategoryRepo>(),
          gh<_i714.AccountRepo>(),
        ));
    gh.factory<_i983.LoginBloc>(() => _i983.LoginBloc(gh<_i706.UserRepo>()));
    gh.lazySingleton<_i49.BookingPageDataLoader>(
        () => _i49.BookingPageDataLoader(
              gh<_i351.BookingPageConverter>(),
              gh<_i351.BookingPaginationService>(),
              gh<_i714.BookingRepo>(),
            ));
    gh.factory<_i862.BookingPageBloc>(() => _i862.BookingPageBloc(
          gh<_i351.BookingPageDataLoader>(),
          gh<_i351.SummaryAggregator>(),
          gh<_i351.FilterBookingsUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i87.RegisterModule {}
