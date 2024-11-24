part of 'summary_bloc.dart';

@freezed
class SummaryState with _$SummaryState {
  const factory SummaryState.initial() = _Initial;

  const factory SummaryState.loading() = _Loading;

  const factory SummaryState.loaded(List<ChartViewData> charts) = _Loaded;

  const factory SummaryState.empty() = _Empty;

  const factory SummaryState.error(String message) = _Error;
}
