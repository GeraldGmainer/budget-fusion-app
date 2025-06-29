import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core.dart';
import '../dtos/booking_dto.dart';

part 'booking.freezed.dart';

@freezed
class Booking with _$Booking implements SyncEntity {
  const Booking._();

  const factory Booking({
    required Uuid id,
    required DateTime date,
    required String? description,
    required Money money,
    required Category category,
    required Account account,
    required SyncMeta syncMeta,
  }) = _Booking;

  factory Booking.fromDto(BookingDto dto, Account account, Category category, Currency currency, bool isSynced) {
    return Booking(
      id: dto.id,
      date: dto.date,
      description: dto.description,
      money: Money(amount: dto.amount, currency: currency),
      category: category,
      account: account,
      syncMeta: dto.syncMeta,
    );
  }

  BookingDto toDto() {
    return BookingDto(id: id, date: date, description: description, amount: amount, categoryId: category.id, accountId: account.id, syncMeta: syncMeta);
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
