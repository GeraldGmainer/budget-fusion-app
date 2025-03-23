part of 'profile_setting_cubit.dart';

@freezed
class ProfileSettingState with _$ProfileSettingState {
  const factory ProfileSettingState.initial() = _Initial;

  const factory ProfileSettingState.loading() = _Loading;

  const factory ProfileSettingState.loaded(ProfileSetting profile) = _Loaded;

  const factory ProfileSettingState.error(String message) = _Error;
}

extension ProfileSettingsStateExtension on ProfileSettingState {
  bool get isLoading => maybeWhen(
        loading: () => true,
        orElse: () => false,
      );
}
