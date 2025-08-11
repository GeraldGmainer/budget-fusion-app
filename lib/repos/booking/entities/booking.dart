import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core.dart';
import '../../account/account.dart';
import '../../category/category.dart';
import '../../currency/currency.dart';
import '../dtos/booking_dto.dart';

part 'booking.freezed.dart';

@freezed
class Booking with _$Booking implements Entity {
  const Booking._();

  const factory Booking({
    required Uuid id,
    required DateTime date,
    required String? description,
    required Money money,
    required Category category,
    required Account account,
    required bool isSynced,
    required DateTime? createdAt,
    required DateTime? updatedAt,
    required DateTime? deletedAt,
  }) = _Booking;

  factory Booking.fromDto(BookingDto dto, Account account, Category category, Currency currency, bool isSynced) {
    return Booking(
      id: dto.id,
      date: dto.date,
      description: dto.description,
      money: Money(amount: dto.amount, currency: currency),
      category: category,
      account: account,
      isSynced: isSynced,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      deletedAt: dto.deletedAt,
    );
  }

  BookingDto toDto() {
    return BookingDto(
      id: id,
      date: date,
      description: description,
      amount: amount,
      categoryId: category.id,
      accountId: account.id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }

  Decimal get amount => money.amount;
}

extension BookingMoneyX on Iterable<Booking> {
  Money get totalMoney => isEmpty ? Money.zero() : fold(Money.zero(), (sum, b) => sum + b.money);

  List<Booking> get incomeBookings => where((b) => b.category.categoryType == CategoryType.income).toList();

  List<Booking> get outcomeBookings => where((b) => b.category.categoryType == CategoryType.outcome).toList();

  Money totalIncomeMoney() => incomeBookings.totalMoney;

  Money totalOutcomeMoney() => outcomeBookings.totalMoney;
}
