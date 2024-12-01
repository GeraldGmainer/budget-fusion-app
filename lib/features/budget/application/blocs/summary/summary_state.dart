part of 'summary_bloc.dart';

@freezed
class SummaryState with _$SummaryState {
  const factory SummaryState.initial() = _Initial;

  const factory SummaryState.loading({required List<ChartViewData> items, required bool isFirstFetch}) = _Loading;

  const factory SummaryState.loaded({required List<ChartViewData> items}) = _Loaded;

  const factory SummaryState.empty() = _Empty;

  const factory SummaryState.error({required List<ChartViewData> items, required String message}) = _Error;
}
