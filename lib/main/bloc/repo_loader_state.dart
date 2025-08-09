part of 'repo_loader_cubit.dart';

@freezed
class RepoLoaderState with _$RepoLoaderState {
  const factory RepoLoaderState.initial() = _Initial;

  const factory RepoLoaderState.loading() = _Loading;

  const factory RepoLoaderState.success() = _Success;

  const factory RepoLoaderState.error(AppError error) = _Error;
}
