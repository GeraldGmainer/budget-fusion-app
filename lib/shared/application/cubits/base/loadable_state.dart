import 'package:freezed_annotation/freezed_annotation.dart';

part 'loadable_state.freezed.dart';

@freezed
class LoadableState<T> with _$LoadableState<T> {
  const factory LoadableState.initial() = _Initial<T>;

  const factory LoadableState.loading() = _Loading<T>;

  const factory LoadableState.loaded(T data) = _Loaded<T>;

  const factory LoadableState.error(String message) = _Error<T>;
}

extension AsyncStateX<T> on LoadableState<T> {
  bool get isLoading => maybeWhen(
        loading: () => true,
        orElse: () => false,
      );
}
