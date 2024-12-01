part of 'calendar_bloc.dart';

@freezed
class CalendarEvent with _$CalendarEvent {
  const factory CalendarEvent.load(List<BookingPageData> periods) = _Load;
}
