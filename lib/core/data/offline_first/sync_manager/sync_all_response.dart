import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_all_response.freezed.dart';
part 'sync_all_response.g.dart';

Map<String, DateTime?> _tsMapFromJson(Map<String, dynamic> json) => json.map((k, v) => MapEntry(k, v == null ? null : DateTime.parse(v as String)));

Map<String, dynamic> _tsMapToJson(Map<String, DateTime?> map) => map.map((k, v) => MapEntry(k, v?.toIso8601String()));

@Freezed(fromJson: true, toJson: true)
abstract class RawDelta with _$RawDelta {
  const factory RawDelta({
    required List<Map<String, dynamic>> upserts,
    required List<String> deletes,
  }) = _RawDelta;

  factory RawDelta.fromJson(Map<String, dynamic> json) => _$RawDeltaFromJson(json);
}

@Freezed(fromJson: true, toJson: true)
abstract class SyncAllResponse with _$SyncAllResponse {
  @JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
  const factory SyncAllResponse({
    required DateTime serverNow,
    required Map<String, RawDelta> deltas,
    @JsonKey(fromJson: _tsMapFromJson, toJson: _tsMapToJson) required Map<String, DateTime?> newTimestamps,
  }) = _SyncAllResponse;

  factory SyncAllResponse.fromJson(Map<String, dynamic> json) => _$SyncAllResponseFromJson(json);
}
