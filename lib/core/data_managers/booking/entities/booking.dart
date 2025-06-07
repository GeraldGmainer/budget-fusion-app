import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../enums/category_type.dart';
import '../../../models/entity.dart';
import '../../../models/uuid.dart';
import '../../account/entities/account.dart';
import '../../category/entities/category.dart';
import '../dtos/booking_dto.dart';

part 'booking.freezed.dart';

@freezed
class Booking with _$Booking implements Entity {
  const Booking._();

  const factory Booking({
    required Uuid id,
    required DateTime date,
    required String? description,
    required Decimal amount,
    required Category category,
    required Account account,
    required DateTime updatedAt,
    required bool isSynced,
  }) = _Booking;

  factory Booking.fromDto(BookingDto dto, Account account, Category category, bool isSynced) {
    return Booking(
      id: dto.id,
      date: dto.date,
      description: dto.description,
      amount: dto.amount,
      category: category,
      account: account,
      updatedAt: dto.updatedAt,
      isSynced: isSynced,
    );
  }

  BookingDto toDto() {
    return BookingDto(id: id, date: date, description: description, amount: amount, categoryId: category.id, accountId: account.id, updatedAt: updatedAt);
  }
}

extension BookingListExtension on Iterable<Booking> {
  Decimal get totalAmount => fold(Decimal.zero, (sum, booking) => sum + booking.amount);

  List<Booking> get incomeBookings => where((booking) => booking.category?.categoryType == CategoryType.income).toList();

  List<Booking> get outcomeBookings => where((booking) => booking.category?.categoryType == CategoryType.outcome).toList();

  Decimal totalIncomeAmount() => incomeBookings.totalAmount;

  Decimal totalOutcomeAmount() => outcomeBookings.totalAmount;
}
