part of 'summary_bloc.dart';

@freezed
class SummaryEvent with _$SummaryEvent {
  const factory SummaryEvent.load(List<BookingPeriod> periods) = _Load;
}
