import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core.dart';
import '../../account/account.dart';
import '../../category/category.dart';
import '../../currency/currency.dart';
import '../dtos/booking_dto.dart';

part 'booking.freezed.dart';

@freezed
abstract class Booking with _$Booking, Entity {
  const Booking._();

  const factory Booking({
    required Uuid id,
    required DateTime date,
    required String? description,
    required Money money,
    required Category category,
    required Account account,
    SyncStatus? syncStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Booking;

  factory Booking.fromDto(BookingDto dto, Account account, Category category, Currency currency) {
    return Booking(
      id: dto.id,
      date: dto.date,
      description: dto.description,
      money: Money(amount: dto.amount, currency: currency),
      category: category,
      account: account,
      syncStatus: dto.syncStatus,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
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
      syncStatus: syncStatus,
      createdAt: createdAt,
      updatedAt: updatedAt,
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
