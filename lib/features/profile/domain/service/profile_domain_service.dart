import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProfileDomainService {
  final ProfileRepo _profileRepo;

  ProfileDomainService(this._profileRepo);

  Future<Profile> loadProfile({String? profileId}) async {
    final id = profileId ?? supabase.auth.currentSession!.user.profileId!;
    await _profileRepo.loadById(id);
    final dto = await _profileRepo.watch().first;
    return dto.toDomain();
  }

  Stream<Profile> watch() {
    return _profileRepo.watch().map((dto) => dto.toDomain());
  }
}
