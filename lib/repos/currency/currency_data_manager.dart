// TODO read only data manager
import 'package:injectable/injectable.dart';

import '../../core/core.dart';
import 'data_sources/currency_local_data_source.dart';
import 'data_sources/currency_remote_data_source.dart';
import 'dtos/currency_dto.dart';
import 'entities/currency.dart';

@singleton
class CurrencyRepo extends Repo<Currency> with AutoSubscribe<Currency> {
  late final OfflineFirstDataManager<CurrencyDto> _manager;

  CurrencyRepo(DataManagerFactory dmf, CurrencyLocalDataSource lds, CurrencyRemoteDataSource rds)
    : _manager = dmf.createManager<CurrencyDto>(entityType: EntityType.currency, localDataSource: lds, remoteDataSource: rds);

  @override
  Future<List<Currency>> loadAll({Map<String, dynamic>? filters}) async {
    final dtos = await _manager.loadAll(filters: filters);
    return _toEntities(dtos);
  }

  void dispose() => _manager.dispose();

  Future<void> reset() => _manager.reset();

  @override
  Stream<List<Currency>> watch() => _manager.stream.map((dtos) => _toEntities(dtos));

  List<Currency> _toEntities(List<SyncedDto<CurrencyDto>> dtos) => dtos.map((dto) => Currency.fromDto(dto.dto, isSynced: dto.isSynced)).toList();
}
