import 'package:injectable/injectable.dart';

@lazySingleton
class DatetimeService {
  DateTime now() {
    return DateTime.now();
  }
}
