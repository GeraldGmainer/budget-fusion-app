import 'package:budget_fusion_app/core/core.dart';

abstract class ProfileRepo {
  Future<Profile> getProfile(SupabaseUser user);

  Future<Currency> getCurrency();
}
