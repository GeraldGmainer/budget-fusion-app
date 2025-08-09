import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:injectable/injectable.dart';

import '../../../repos/booking/booking.dart';
import '../domain/entities/booking_suggestion.dart';

@injectable
class SuggestionCubit extends ErrorHandledCubit<LoadableState<List<BookingSuggestion>>> {
  final BookingRepo _repo;

  SuggestionCubit(this._repo) : super(const LoadableState.initial());

  Future<void> load() async {
    safeCall(
      call: () {
        emit(LoadableState.loading());
        BudgetLogger.instance.d("${runtimeType.toString()} load suggestions", short: true);
        return _repo.loadSuggestions();
      },
      onSuccess: (data) => emit(LoadableState.loaded(data)),
      onError: (e, appError) => LoadableState.error(appError),
    );
  }
}
