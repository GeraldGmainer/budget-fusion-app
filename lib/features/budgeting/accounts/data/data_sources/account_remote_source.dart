import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';

@lazySingleton
class AccountRemoteSource extends SupabaseClient {
  Future<List<AccountDto>> fetchAllAccounts() async {
    return execute("fetchAllAccounts", () async {
      final response = await supabase.from('accounts').select('id, name, icon_name, icon_color').order('name', ascending: true);
      return List.from(response).map((item) => AccountDto.fromJson(item)).toList();
    });
  }
}
