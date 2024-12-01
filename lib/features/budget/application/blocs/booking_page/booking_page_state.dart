part of 'booking_page_bloc.dart';

@freezed
class BookingPageState with _$BookingPageState {
  const factory BookingPageState.initial() = _Initial;

  const factory BookingPageState.loading({required List<BookingPageData> items, required bool isFirstFetch}) = _Loading;

  const factory BookingPageState.loaded({required List<BookingPageData> items}) = _Loaded;

  const factory BookingPageState.error({required List<BookingPageData> items, required String message}) = _Error;
}
