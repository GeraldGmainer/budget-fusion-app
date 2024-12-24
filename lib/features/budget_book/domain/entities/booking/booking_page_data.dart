import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'booking_page_data.freezed.dart';

@freezed
class BookingPageData with _$BookingPageData {
  const BookingPageData._();

  const factory BookingPageData({
    required BookingDateRange dateRange,
    required Decimal income,
    required Decimal outcome,
    required List<CategoryGroup> categoryGroups,
  }) = _BookingPageData;

  Decimal get balance {
    return income - outcome;
  }
}
