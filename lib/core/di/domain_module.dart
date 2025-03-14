import 'package:injectable/injectable.dart';

import '../../features/profile/profile.dart';
import '../enums/domain_type.dart';
import 'registry/domain_registry.dart';

@module
abstract class DomainModule {
  @LazySingleton()
  DomainRegistry provideDomainDataSourceRegistry(
    ProfileRemoteDataSource profileRemoteDataSource,
    ProfileLocalDataSource profileLocalDataSource,
    ProfileAdapter profileAdapter,
  ) {
    final registry = DomainRegistry();
    registry.register(DomainType.profile, profileRemoteDataSource, profileLocalDataSource, profileAdapter);
    return registry;
  }
}
