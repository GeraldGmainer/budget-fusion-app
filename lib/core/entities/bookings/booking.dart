import 'package:budget_fusion_app/utils/utils.dart';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enums/category_type.dart';
import '../accounts/account.dart';
import '../base/entity.dart';
import '../categories/category.dart';

part 'booking.freezed.dart';

@freezed
class Booking with _$Booking implements Entity {
  const Booking._();

  const factory Booking({
    required Uuid id,
    required Uuid userId,
    required DateTime date,
    required String? description,
    required Decimal amount,
    required Category? category,
    required Account? account,
    required DateTime updatedAt,
  }) = _Booking;
}

extension BookingListExtension on Iterable<Booking> {
  Decimal get totalAmount => fold(Decimal.zero, (sum, booking) => sum + booking.amount);

  List<Booking> get incomeBookings => where((booking) => booking.category?.categoryType == CategoryType.income).toList();

  List<Booking> get outcomeBookings => where((booking) => booking.category?.categoryType == CategoryType.outcome).toList();

  Decimal totalIncomeAmount() => incomeBookings.totalAmount;

  Decimal totalOutcomeAmount() => outcomeBookings.totalAmount;
}
