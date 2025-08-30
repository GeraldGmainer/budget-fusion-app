// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_all_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RawDelta _$RawDeltaFromJson(Map<String, dynamic> json) => _RawDelta(
  upserts: (json['upserts'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  deletes: (json['deletes'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$RawDeltaToJson(_RawDelta instance) => <String, dynamic>{
  'upserts': instance.upserts,
  'deletes': instance.deletes,
};

_SyncAllResponse _$SyncAllResponseFromJson(Map<String, dynamic> json) =>
    _SyncAllResponse(
      serverNow: DateTime.parse(json['serverNow'] as String),
      deltas: (json['deltas'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, RawDelta.fromJson(e as Map<String, dynamic>)),
      ),
      newTimestamps: _tsMapFromJson(
        json['newTimestamps'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$SyncAllResponseToJson(_SyncAllResponse instance) =>
    <String, dynamic>{
      'serverNow': instance.serverNow.toIso8601String(),
      'deltas': instance.deltas,
      'newTimestamps': _tsMapToJson(instance.newTimestamps),
    };
