import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:injectable/injectable.dart';

import '../dtos/currency_dto.dart';
import '../dtos/profile_setting_dto.dart';

@LazySingleton(as: ProfileSettingRepo)
class ProfileSettingRepoImpl extends OfflineFirstSingleRepo<ProfileSetting, ProfileSettingDto> implements ProfileSettingRepo {
  ProfileSettingRepoImpl(DataManagerFactory dataManagerFactory) : super(dataManagerFactory, DomainType.profileSetting);

  @override
  Future<void> loadById(Uuid profileId) async {
    manager.loadAll(filters: {'profile_id': profileId.value});
  }

  @override
  ProfileSetting toDomain(ProfileSettingDto dto) {
    return ProfileSetting(
      id: dto.id,
      profileId: dto.profileId,
      currency: dto.currency.toDomain(),
      updatedAt: dto.updatedAt,
    );
  }

  @override
  ProfileSettingDto toDto(ProfileSetting entity) {
    return ProfileSettingDto(
      id: entity.id,
      profileId: entity.profileId,
      currencyId: entity.currency.id,
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
