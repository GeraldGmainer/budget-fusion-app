import 'package:budget_fusion_app/core/core.dart';


abstract class ProfileRepo {
  Stream<Profile> watch();

  Future<void> loadByUserId(Uuid id);

  Future<void> save(Profile entity);

  Future<void> delete(Profile entity);

  Future<void> reset();

  void dispose();
}
