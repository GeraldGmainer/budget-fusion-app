import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../remote_sources/user_remote_source.dart';

@lazySingleton
class UserRepo {
  final UserRemoteSource _userRemoteSource;

  UserRepo(this._userRemoteSource);

  Future<User> googleLogin() async {
    return await _userRemoteSource.googleLogin();
  }

  Future<User> credentialsLogin(String email, String password) async {
    return await _userRemoteSource.credentialsLogin(email, password);
  }

  Future<void> signUp(String email, String password) async {
    await _userRemoteSource.signUp(email, password);
  }

  Future<void> logout() async {
    await _userRemoteSource.logout();
  }
}
