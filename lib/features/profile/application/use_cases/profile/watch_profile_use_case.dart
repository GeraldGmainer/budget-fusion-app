import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/profile/domain/service/profile_domain_service.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WatchProfileUseCase {
  final ProfileDomainService _domainService;

  WatchProfileUseCase(this._domainService);

  Stream<Profile> call() {
    return _domainService.watch();
  }
}
