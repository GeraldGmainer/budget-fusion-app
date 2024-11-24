import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/data_sources.dart';

@LazySingleton(as: AccountRepo)
class AccountRepoImpl implements AccountRepo {
  static const Duration cacheDuration = Duration(minutes: 30);
  final _cache = InMemoryCache<List<Account>>(cacheDuration: cacheDuration);
  final AccountRemoteSource _accountRemoteSource;

  AccountRepoImpl(this._accountRemoteSource);

  @override
  Future<List<Account>> getAccounts() {
    return _cache.fetch(_fetchCategoriesFromRemote);
  }

  Future<List<Account>> _fetchCategoriesFromRemote() async {
    final dtos = await _accountRemoteSource.fetchAllAccounts();
    return dtos.map((dto) => dto.toDomain()).toList();
  }
}
