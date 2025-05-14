import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/account_local_data_source.dart';
import '../data_sources/account_remote_data_source.dart';
import '../dtos/account_dto.dart';

@LazySingleton(as: AccountRepo)
@Singleton(as: AccountRepo)
class AccountRepoImpl extends OfflineFirstListRepo<Account, AccountDto> implements AccountRepo {
  AccountRepoImpl(
    DataManagerFactory dmf,
    AccountLocalDataSource lds,
    AccountRemoteDataSource rds,
  ) : super(DomainType.account, dmf, lds, rds);

  @override
  Stream<List<Account>> watch() {
    return manager.stream.asyncMap((dtos) async {
      return await Future.wait(dtos.map((dto) => toEntity(dto)));
    });
  }

  @override
  Future<Account> toEntity(AccountDto dto) async {
    return Account(
      id: dto.id,
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
      name: entity.name,
      iconName: entity.iconName,
      iconColor: entity.iconColor,
      updatedAt: entity.updatedAt,
    );
  }
}
