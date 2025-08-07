import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data_managers/account/dtos/account_dto.dart';
import '../../../data_managers/booking/dtos/booking_dto.dart';
import '../../../data_managers/category/dtos/category_dto.dart';
import '../../../data_managers/profile/dtos/profile_dto.dart';
import '../offline_first/models/offline_first_dto.dart';

part 'sync_all_response.freezed.dart';
part 'sync_all_response.g.dart';

DateTime? _parseNullable(String? s) => s == null ? null : DateTime.parse(s);

String? _stringifyNullable(DateTime? dt) => dt?.toIso8601String();

@Freezed(genericArgumentFactories: true)
class SyncDelta<T extends OfflineFirstDto> with _$SyncDelta<T> {
  const factory SyncDelta({
    required List<T> upserts,
    required List<String> deletes,
  }) = _SyncDelta<T>;

  factory SyncDelta.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$SyncDeltaFromJson<T>(json, fromJsonT);
}

@freezed
class NewTimestamps with _$NewTimestamps {
  const factory NewTimestamps({
    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable) DateTime? account,

    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable) DateTime? booking,

    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable) DateTime? profile,

    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable) DateTime? category,
  }) = _NewTimestamps;

  factory NewTimestamps.fromJson(Map<String, dynamic> json) => _$NewTimestampsFromJson(json);
}

@freezed
class SyncAllResponse with _$SyncAllResponse {
  const factory SyncAllResponse({
    // TODO use dynamic instead of concrete Dtos?
    @JsonKey(fromJson: _accountDeltaFromJson, toJson: _accountDeltaToJson) required SyncDelta<AccountDto> account,
    @JsonKey(fromJson: _bookingDeltaFromJson, toJson: _bookingDeltaToJson) required SyncDelta<BookingDto> booking,
    @JsonKey(fromJson: _profileDeltaFromJson, toJson: _profileDeltaToJson) required SyncDelta<ProfileDto> profile,
    @JsonKey(fromJson: _categoryDeltaFromJson, toJson: _categoryDeltaToJson) required SyncDelta<CategoryDto> category,
    @JsonKey(name: 'newTimestamps') required NewTimestamps newTimestamps,
  }) = _SyncAllResponse;

  factory SyncAllResponse.fromJson(Map<String, dynamic> json) => _$SyncAllResponseFromJson(json);
}

SyncDelta<AccountDto> _accountDeltaFromJson(Map<String, dynamic> json) => SyncDelta.fromJson(json, (j) => AccountDto.fromJson(j as Map<String, dynamic>));

Map<String, dynamic> _accountDeltaToJson(SyncDelta<AccountDto> delta) => delta.toJson((a) => a.toJson());

SyncDelta<BookingDto> _bookingDeltaFromJson(Map<String, dynamic> json) => SyncDelta.fromJson(json, (j) => BookingDto.fromJson(j as Map<String, dynamic>));

Map<String, dynamic> _bookingDeltaToJson(SyncDelta<BookingDto> delta) => delta.toJson((a) => a.toJson());

SyncDelta<ProfileDto> _profileDeltaFromJson(Map<String, dynamic> json) => SyncDelta.fromJson(json, (j) => ProfileDto.fromJson(j as Map<String, dynamic>));

Map<String, dynamic> _profileDeltaToJson(SyncDelta<ProfileDto> delta) => delta.toJson((a) => a.toJson());

SyncDelta<CategoryDto> _categoryDeltaFromJson(Map<String, dynamic> json) => SyncDelta.fromJson(json, (j) => CategoryDto.fromJson(j as Map<String, dynamic>));

Map<String, dynamic> _categoryDeltaToJson(SyncDelta<CategoryDto> delta) => delta.toJson((a) => a.toJson());
