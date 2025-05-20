import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/core.dart';

@lazySingleton
class UserRemoteSource {
  static const String callbackUrl = "com.gmainer.budgetbook://login-callback";

  Future<User> googleLogin() async {
    final bool success = await supabase.auth.signInWithOAuth(OAuthProvider.google, redirectTo: callbackUrl);
    if (success && supabase.auth.currentUser != null) {
      return supabase.auth.currentUser!;
    }
    throw LoginUserNotFoundException();
  }

  Future<User> credentialsLogin(String email, String password) async {
    final AuthResponse response = await supabase.auth.signInWithPassword(email: email, password: password);
    if (response.user != null) {
      return response.user!;
    }
    throw LoginUserNotFoundException();
  }

  Future<void> signUp(String email, String password) async {
    await supabase.auth.signUp(email: email, password: password, emailRedirectTo: callbackUrl);
  }

  Future<void> logout() async {
    await supabase.auth.signOut();
  }
}
