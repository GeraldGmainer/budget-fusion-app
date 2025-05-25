import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoadBookingsUseCase {
  final BookingRepo _repo;

  LoadBookingsUseCase(this._repo);

  Future<void> call(UserContext userContext) async {
    await _repo.loadAll(filters: {'tenant_id': userContext.tenantId.value, 'profile_id': userContext.profileId.value});
  }
}
