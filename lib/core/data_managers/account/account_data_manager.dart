import 'package:injectable/injectable.dart';

import '../../core.dart';
import 'data_sources/account_local_data_source.dart';
import 'data_sources/account_remote_data_source.dart';
import 'dtos/account_dto.dart';

@lazySingleton
class AccountDataManager extends DataManager<Account> with AutoSubscribe<Account> {
  late final OfflineFirstDataManager<AccountDto> _manager;

  AccountDataManager(DataManagerFactory dmf, AccountLocalDataSource lds, AccountRemoteDataSource rds)
    : _manager = dmf.createManager<AccountDto>(entityType: EntityType.account, localDataSource: lds, remoteDataSource: rds);

  @override
  Future<List<Account>> loadAll({Map<String, dynamic>? filters}) async {
    final dtos = await _manager.loadAll(filters: filters);
    return _toEntities(dtos);
  }

  void dispose() => _manager.dispose();

  Future<void> reset() => _manager.reset();

  @override
  Stream<List<Account>> watch() => _manager.stream.map((dtos) => _toEntities(dtos));

  List<Account> _toEntities(List<AccountDto> dtos) {
    return dtos.map((dto) => Account.fromDto(dto)).toList();
  }
}
