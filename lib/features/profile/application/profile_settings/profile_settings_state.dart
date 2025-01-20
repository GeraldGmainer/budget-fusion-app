part of 'profile_settings_cubit.dart';

@freezed
class ProfileSettingsState with _$ProfileSettingsState {
  const factory ProfileSettingsState.initial() = _Initial;

  const factory ProfileSettingsState.loading() = _Loading;

  const factory ProfileSettingsState.loaded(ProfileSettings profile) = _Loaded;

  const factory ProfileSettingsState.error(String message) = _Error;
}

extension ProfileSettingsStateExtension on ProfileSettingsState {
  bool get isLoading => maybeWhen(
        loading: () => true,
        orElse: () => false,
      );
}
