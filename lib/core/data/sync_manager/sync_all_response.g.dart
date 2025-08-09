// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_all_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RawDeltaImpl _$$RawDeltaImplFromJson(Map<String, dynamic> json) =>
    _$RawDeltaImpl(
      upserts:
          (json['upserts'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
      deletes:
          (json['deletes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$RawDeltaImplToJson(_$RawDeltaImpl instance) =>
    <String, dynamic>{'upserts': instance.upserts, 'deletes': instance.deletes};

_$SyncAllResponseImpl _$$SyncAllResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SyncAllResponseImpl(
  serverNow: DateTime.parse(json['serverNow'] as String),
  deltas: (json['deltas'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, RawDelta.fromJson(e as Map<String, dynamic>)),
  ),
  newTimestamps: _tsMapFromJson(json['newTimestamps'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$SyncAllResponseImplToJson(
  _$SyncAllResponseImpl instance,
) => <String, dynamic>{
  'serverNow': instance.serverNow.toIso8601String(),
  'deltas': instance.deltas,
  'newTimestamps': _tsMapToJson(instance.newTimestamps),
};
