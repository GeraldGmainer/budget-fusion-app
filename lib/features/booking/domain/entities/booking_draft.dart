import 'package:budget_fusion_app/core/core.dart';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../repos/account/account.dart';
import '../../../../repos/booking/booking.dart';
import '../../../../repos/category/category.dart';
import '../../../../repos/currency/currency.dart';

part 'booking_draft.freezed.dart';

@freezed
class BookingDraft with _$BookingDraft {
  const BookingDraft._();

  factory BookingDraft({
    Uuid? id,
    required DateTime date,
    String? description,
    required Decimal amount,
    Category? category,
    Account? account,
    @Default(CategoryType.outcome) CategoryType categoryType,
    SyncMeta? syncMeta,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) = _BookingDraft;

  bool get isCreating => id == null;

  Booking toBooking(Currency currency) {
    return Booking(
      id: id ?? Uuid.generate(),
      date: date,
      description: description,
      money: Money(amount: amount, currency: currency),
      category: category!,
      account: account!,
      isSynced: false,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }

  factory BookingDraft.fromBooking(Booking booking) {
    return BookingDraft(
      id: booking.id,
      date: booking.date,
      description: booking.description,
      amount: booking.amount,
      category: booking.category,
      account: booking.account,
      categoryType: booking.category.categoryType,
      createdAt: booking.createdAt,
      updatedAt: booking.updatedAt,
      deletedAt: booking.deletedAt,
    );
  }
}
