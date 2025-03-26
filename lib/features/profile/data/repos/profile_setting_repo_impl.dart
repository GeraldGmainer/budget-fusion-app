import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/profile_setting_local_data_source.dart';
import '../data_sources/profile_setting_remote_data_source.dart';
import '../dtos/currency_dto.dart';
import '../dtos/profile_setting_dto.dart';

@LazySingleton(as: ProfileSettingRepo)
class ProfileSettingRepoImpl extends OfflineFirstSingleRepo<ProfileSetting, ProfileSettingDto> implements ProfileSettingRepo {
  ProfileSettingRepoImpl(
    DataManagerFactory dmf,
    ProfileSettingLocalDataSource lds,
    ProfileSettingRemoteDataSource rds,
  ) : super(DomainType.profileSetting, dmf, lds, rds);

  @override
  Future<void> loadByUserId(Uuid userId) async {
    manager.loadAll(filters: {'user_id': userId.value});
  }

  @override
  Stream<ProfileSetting> watch() {
    return manager.stream.map((dtos) => _toDomain(dtos.first));
  }

  ProfileSetting _toDomain(ProfileSettingDto dto) {
    return ProfileSetting(
      id: dto.id,
      userId: dto.userId,
      currency: dto.currency.toDomain(),
      updatedAt: dto.updatedAt,
    );
  }

  @override
  ProfileSettingDto toDto(ProfileSetting entity) {
    return ProfileSettingDto(
      id: entity.id,
      userId: entity.userId,
      currency: CurrencyDto(
        id: entity.currency.id,
        name: entity.currency.name,
        decimalPrecision: entity.currency.decimalPrecision,
        unitPositionFront: entity.currency.unitPositionFront,
        symbol: entity.currency.symbol,
        uiOrder: entity.currency.uiOrder,
      ),
      updatedAt: entity.updatedAt,
    );
  }
}
