part of 'language_bloc.dart';

@freezed
class LanguageEvent with _$LanguageEvent {
  const factory LanguageEvent.load(BuildContext context) = _Load;

  const factory LanguageEvent.set(Locale locale) = _Set;
}
