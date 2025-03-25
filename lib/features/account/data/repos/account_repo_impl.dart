import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/account_local_data_source.dart';
import '../data_sources/account_remote_data_source.dart';
import '../dtos/account_dto.dart';

@LazySingleton(as: AccountRepo)
class AccountRepoImpl extends OfflineFirstListRepo<Account, AccountDto> implements AccountRepo {
  AccountRepoImpl(
    DataManagerFactory dmf,
    AccountLocalDataSource lds,
    AccountRemoteDataSource rds,
  ) : super(DomainType.account, dmf, lds, rds);

  @override
  Account toDomain(AccountDto dto) {
    return Account(
      id: dto.id,
      userId: dto.userId,
      name: dto.name,
      iconName: dto.iconName,
      iconColor: dto.iconColor,
      updatedAt: dto.updatedAt,
    );
  }

  @override
  AccountDto toDto(Account entity) {
    return AccountDto(
      id: entity.id,
      userId: entity.userId,
      name: entity.name,
      iconName: entity.iconName,
      iconColor: entity.iconColor,
      updatedAt: entity.updatedAt,
    );
  }
}
