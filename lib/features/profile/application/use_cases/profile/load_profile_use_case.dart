import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/service/profile_domain_service.dart';

@lazySingleton
class LoadProfileUseCase {
  final ProfileDomainService _domainService;

  LoadProfileUseCase(this._domainService);

  Future<void> call({String? profileId}) async {
    await _domainService.loadProfile(profileId: profileId);
  }
}
