import 'package:injectable/injectable.dart';

import '../data_sources/booking_local_data_source.dart';
import '../dtos/booking_suggestion_dto.dart';

@lazySingleton
class SuggestionRepo {
  final BookingLocalDataSource _dataSource;

  SuggestionRepo(this._dataSource);

  Future<List<BookingSuggestionDto>> getSuggestions() async {
    return await _dataSource.getSuggestions();
  }
}
