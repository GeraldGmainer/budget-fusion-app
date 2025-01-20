part of 'language_cubit.dart';

@freezed
class LanguageState with _$LanguageState {
  const factory LanguageState.initial() = _Initial;

  const factory LanguageState.loaded(Locale locale) = _Loaded;
}
