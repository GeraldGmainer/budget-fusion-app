part of 'booking_view_bloc.dart';

@freezed
class BookingViewState with _$BookingViewState {
  const factory BookingViewState.initial() = _Initial;

  const factory BookingViewState.loading() = _Loading;

  const factory BookingViewState.chartLoaded(List<ChartViewData> charts) = _Loaded;

  const factory BookingViewState.error(String message) = _Error;
}
