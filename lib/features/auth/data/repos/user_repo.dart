import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../service/user_client.dart';

@lazySingleton
class UserRepo {
  final UserClient _userClient;

  UserRepo(this._userClient);

  Future<SupabaseUser> googleLogin() async {
    final user = await _userClient.googleLogin();
    return SupabaseUser.fromGoTrueUser(user);
  }

  Future<SupabaseUser> credentialsLogin(String email, String password) async {
    final user = await _userClient.credentialsLogin(email, password);
    return SupabaseUser.fromGoTrueUser(user);
  }

  Future<void> signUp(String email, String password) async {
    await _userClient.signUp(email, password);
  }

  Future<void> logout() async {
    await _userClient.logout();
  }
}
