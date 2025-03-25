import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/account_dto.dart';

@lazySingleton
class AccountRemoteDataSource extends OfflineFirstRemoteDataSource<AccountDto> {
  @override
  String get table => 'accounts';

  @override
  String get columns => 'id, user_id, name, icon_name, icon_color, updated_at';

  @override
  AccountDto toDto(Map<String, dynamic> json) {
    return AccountDto.fromJson(json);
  }
}
