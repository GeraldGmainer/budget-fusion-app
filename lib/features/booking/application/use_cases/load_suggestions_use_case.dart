import 'package:injectable/injectable.dart';

import '../../data/dtos/booking_suggestion_dto.dart';
import '../../data/repos/suggestion_repo.dart';

@lazySingleton
class LoadSuggestionsUseCase {
  final SuggestionRepo _repo;

  LoadSuggestionsUseCase(this._repo);

  Future<List<BookingSuggestionDto>> call() async {
    return await _repo.getSuggestions();
  }
}
