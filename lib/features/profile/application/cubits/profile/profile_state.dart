part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.loading() = _Loading;

  const factory ProfileState.loaded(Profile profile) = _Loaded;

  const factory ProfileState.error(String message) = _Error;
}

extension ProfileStateExtension on ProfileState {
  bool get isLoading => maybeWhen(
        loading: () => true,
        orElse: () => false,
      );
}
