import 'package:budget_fusion_app/core/core.dart';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _BookingDraft;

  bool get isCreating => id == null;

  Booking toBooking() {
    return Booking(
      id: id ?? Uuid.generate(),
      date: date,
      description: description,
      amount: amount,
      category: category!,
      account: account!,
      updatedAt: DateTime.now(),
      isSynced: false,
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
      categoryType: booking.category?.categoryType ?? CategoryType.outcome,
    );
  }
}
