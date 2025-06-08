import 'app_error.dart';
import 'translated_exception.dart';

class DecimalParsingException extends TranslatedException {
  DecimalParsingException() : super(AppError.decimalParsing, "Cannot convert to decimal type");
}
