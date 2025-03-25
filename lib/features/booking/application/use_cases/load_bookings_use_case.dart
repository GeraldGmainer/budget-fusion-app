import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoadBookingsUseCase {
  final BookingRepo _repo;

  LoadBookingsUseCase(this._repo);

  Future<void> call() async {
    await _repo.loadAll();
  }
}
