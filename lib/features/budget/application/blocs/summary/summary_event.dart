part of 'summary_bloc.dart';

@freezed
class SummaryEvent with _$SummaryEvent {
  const factory SummaryEvent.refresh(List<BookingPageData> datas) = _Refresh;
}
