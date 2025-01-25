import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';

@lazySingleton
class WatchProfile {
  final ProfileRepo _repo;

  WatchProfile(this._repo);

  Stream<Profile> call() async* {
    yield* _repo.watchProfile();
  }
}
