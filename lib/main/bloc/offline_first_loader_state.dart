part of 'offline_first_loader_cubit.dart';

@freezed
class OfflineFirstLoaderState with _$OfflineFirstLoaderState {
  const factory OfflineFirstLoaderState.initial() = _Initial;

  const factory OfflineFirstLoaderState.loading() = _Loading;

  const factory OfflineFirstLoaderState.success() = _Success;

  const factory OfflineFirstLoaderState.error(AppError error) = _Error;
}
