// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_all_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SyncDeltaImpl<T> _$$SyncDeltaImplFromJson<T extends OfflineFirstDto>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _$SyncDeltaImpl<T>(
  upserts: (json['upserts'] as List<dynamic>).map(fromJsonT).toList(),
  deletes: (json['deletes'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$$SyncDeltaImplToJson<T extends OfflineFirstDto>(
  _$SyncDeltaImpl<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'upserts': instance.upserts.map(toJsonT).toList(),
  'deletes': instance.deletes,
};

_$NewTimestampsImpl _$$NewTimestampsImplFromJson(Map<String, dynamic> json) =>
    _$NewTimestampsImpl(
      account: _parseNullable(json['account'] as String?),
      booking: _parseNullable(json['booking'] as String?),
      profile: _parseNullable(json['profile'] as String?),
      category: _parseNullable(json['category'] as String?),
    );

Map<String, dynamic> _$$NewTimestampsImplToJson(_$NewTimestampsImpl instance) =>
    <String, dynamic>{
      'account': _stringifyNullable(instance.account),
      'booking': _stringifyNullable(instance.booking),
      'profile': _stringifyNullable(instance.profile),
      'category': _stringifyNullable(instance.category),
    };

_$SyncAllResponseImpl _$$SyncAllResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SyncAllResponseImpl(
  account: _accountDeltaFromJson(json['account'] as Map<String, dynamic>),
  booking: _bookingDeltaFromJson(json['booking'] as Map<String, dynamic>),
  profile: _profileDeltaFromJson(json['profile'] as Map<String, dynamic>),
  category: _categoryDeltaFromJson(json['category'] as Map<String, dynamic>),
  newTimestamps: NewTimestamps.fromJson(
    json['newTimestamps'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$SyncAllResponseImplToJson(
  _$SyncAllResponseImpl instance,
) => <String, dynamic>{
  'account': _accountDeltaToJson(instance.account),
  'booking': _bookingDeltaToJson(instance.booking),
  'profile': _profileDeltaToJson(instance.profile),
  'category': _categoryDeltaToJson(instance.category),
  'newTimestamps': instance.newTimestamps,
};
