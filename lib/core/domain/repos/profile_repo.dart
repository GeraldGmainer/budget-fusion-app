import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';

abstract class ProfileRepo {
  Future<Profile> getProfile(SupabaseUser user);

  Future<Currency> getCurrency();
}
