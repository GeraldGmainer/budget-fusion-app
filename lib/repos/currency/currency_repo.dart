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
  Future<List<Currency>> loadAll({Map<String, dynamic>? filters, bool clearStream = false, bool invalidateCache = false}) async {
    final dtos = await _manager.loadAll(filters: filters, invalidateCache: invalidateCache);
    return _toEntities(dtos);
  }

  void dispose() => _manager.dispose();

  Future<void> reset() => _manager.reset();

  @override
  Stream<List<Currency>> watch() => _manager.stream.map((dtos) => _toEntities(dtos));

  List<Currency> _toEntities(List<CurrencyDto> dtos) => dtos.map(Currency.fromDto).toList();
}
