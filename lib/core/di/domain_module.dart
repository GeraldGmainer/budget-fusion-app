import 'package:budget_fusion_app/features/profile/profile.dart';
import 'package:injectable/injectable.dart';

import '../enums/domain_type.dart';
import 'registry/domain_registry.dart';

@module
abstract class DomainModule {
  @LazySingleton()
  // @formatter:off
  DomainRegistry provideDomainDataSourceRegistry(
    ProfileRemoteDataSource profileRDS, ProfileLocalDataSource profileLDS,
    ProfileSettingRemoteDataSource profileSettingRDS, ProfileSettingLocalDataSource profileSettingLDS,
  ) {
    // @formatter:on
    final registry = DomainRegistry();
    registry.register(DomainType.profile, profileRDS, profileLDS);
    registry.register(DomainType.profileSetting, profileSettingRDS, profileSettingLDS);
    return registry;
  }
}
