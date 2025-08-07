import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/account_dto.dart';

@lazySingleton
class AccountLocalDataSource extends OfflineFirstLocalDataSource<AccountDto> {
  AccountLocalDataSource(super.db);

  @override
  String get table => "account";

  @override
  String? get defaultOrderBy => "name ASC";

  @override
  AccountDto fromJson(Map<String, dynamic> json) => AccountDto.fromJson(json);
}
