// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileDto {

@UuidSerializer() Uuid get id;@JsonKey(name: 'first_name') String? get firstName;@JsonKey(name: 'last_name') String? get lastName;@JsonKey(name: 'avatar_url') String? get avatarUrl;@JsonKey(name: 'settings')@ProfileSettingDtoConverter() ProfileSettingDto get settingDto;@SyncStatusSerializer()@JsonKey(name: 'sync_status') SyncStatus? get syncStatus;@DateTimeSerializer()@JsonKey(name: 'created_at') DateTime? get createdAt;@DateTimeSerializer()@JsonKey(name: 'updated_at') DateTime? get updatedAt;@DateTimeSerializer()@JsonKey(name: 'deleted_at') DateTime? get deletedAt;
/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileDtoCopyWith<ProfileDto> get copyWith => _$ProfileDtoCopyWithImpl<ProfileDto>(this as ProfileDto, _$identity);

  /// Serializes this ProfileDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileDto&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.settingDto, settingDto) || other.settingDto == settingDto)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,avatarUrl,settingDto,syncStatus,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'ProfileDto(id: $id, firstName: $firstName, lastName: $lastName, avatarUrl: $avatarUrl, settingDto: $settingDto, syncStatus: $syncStatus, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $ProfileDtoCopyWith<$Res>  {
  factory $ProfileDtoCopyWith(ProfileDto value, $Res Function(ProfileDto) _then) = _$ProfileDtoCopyWithImpl;
@useResult
$Res call({
@UuidSerializer() Uuid id,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'settings')@ProfileSettingDtoConverter() ProfileSettingDto settingDto,@SyncStatusSerializer()@JsonKey(name: 'sync_status') SyncStatus? syncStatus,@DateTimeSerializer()@JsonKey(name: 'created_at') DateTime? createdAt,@DateTimeSerializer()@JsonKey(name: 'updated_at') DateTime? updatedAt,@DateTimeSerializer()@JsonKey(name: 'deleted_at') DateTime? deletedAt
});


$ProfileSettingDtoCopyWith<$Res> get settingDto;

}
/// @nodoc
class _$ProfileDtoCopyWithImpl<$Res>
    implements $ProfileDtoCopyWith<$Res> {
  _$ProfileDtoCopyWithImpl(this._self, this._then);

  final ProfileDto _self;
  final $Res Function(ProfileDto) _then;

/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = freezed,Object? lastName = freezed,Object? avatarUrl = freezed,Object? settingDto = null,Object? syncStatus = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Uuid,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,settingDto: null == settingDto ? _self.settingDto : settingDto // ignore: cast_nullable_to_non_nullable
as ProfileSettingDto,syncStatus: freezed == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileSettingDtoCopyWith<$Res> get settingDto {
  
  return $ProfileSettingDtoCopyWith<$Res>(_self.settingDto, (value) {
    return _then(_self.copyWith(settingDto: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileDto].
extension ProfileDtoPatterns on ProfileDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileDto value)  $default,){
final _that = this;
switch (_that) {
case _ProfileDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@UuidSerializer()  Uuid id, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'settings')@ProfileSettingDtoConverter()  ProfileSettingDto settingDto, @SyncStatusSerializer()@JsonKey(name: 'sync_status')  SyncStatus? syncStatus, @DateTimeSerializer()@JsonKey(name: 'created_at')  DateTime? createdAt, @DateTimeSerializer()@JsonKey(name: 'updated_at')  DateTime? updatedAt, @DateTimeSerializer()@JsonKey(name: 'deleted_at')  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileDto() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.avatarUrl,_that.settingDto,_that.syncStatus,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@UuidSerializer()  Uuid id, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'settings')@ProfileSettingDtoConverter()  ProfileSettingDto settingDto, @SyncStatusSerializer()@JsonKey(name: 'sync_status')  SyncStatus? syncStatus, @DateTimeSerializer()@JsonKey(name: 'created_at')  DateTime? createdAt, @DateTimeSerializer()@JsonKey(name: 'updated_at')  DateTime? updatedAt, @DateTimeSerializer()@JsonKey(name: 'deleted_at')  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _ProfileDto():
return $default(_that.id,_that.firstName,_that.lastName,_that.avatarUrl,_that.settingDto,_that.syncStatus,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@UuidSerializer()  Uuid id, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'settings')@ProfileSettingDtoConverter()  ProfileSettingDto settingDto, @SyncStatusSerializer()@JsonKey(name: 'sync_status')  SyncStatus? syncStatus, @DateTimeSerializer()@JsonKey(name: 'created_at')  DateTime? createdAt, @DateTimeSerializer()@JsonKey(name: 'updated_at')  DateTime? updatedAt, @DateTimeSerializer()@JsonKey(name: 'deleted_at')  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _ProfileDto() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.avatarUrl,_that.settingDto,_that.syncStatus,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileDto extends ProfileDto {
  const _ProfileDto({@UuidSerializer() required this.id, @JsonKey(name: 'first_name') this.firstName, @JsonKey(name: 'last_name') this.lastName, @JsonKey(name: 'avatar_url') this.avatarUrl, @JsonKey(name: 'settings')@ProfileSettingDtoConverter() required this.settingDto, @SyncStatusSerializer()@JsonKey(name: 'sync_status') required this.syncStatus, @DateTimeSerializer()@JsonKey(name: 'created_at') required this.createdAt, @DateTimeSerializer()@JsonKey(name: 'updated_at') required this.updatedAt, @DateTimeSerializer()@JsonKey(name: 'deleted_at') required this.deletedAt}): super._();
  factory _ProfileDto.fromJson(Map<String, dynamic> json) => _$ProfileDtoFromJson(json);

@override@UuidSerializer() final  Uuid id;
@override@JsonKey(name: 'first_name') final  String? firstName;
@override@JsonKey(name: 'last_name') final  String? lastName;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
@override@JsonKey(name: 'settings')@ProfileSettingDtoConverter() final  ProfileSettingDto settingDto;
@override@SyncStatusSerializer()@JsonKey(name: 'sync_status') final  SyncStatus? syncStatus;
@override@DateTimeSerializer()@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@DateTimeSerializer()@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override@DateTimeSerializer()@JsonKey(name: 'deleted_at') final  DateTime? deletedAt;

/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileDtoCopyWith<_ProfileDto> get copyWith => __$ProfileDtoCopyWithImpl<_ProfileDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileDto&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.settingDto, settingDto) || other.settingDto == settingDto)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,avatarUrl,settingDto,syncStatus,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'ProfileDto(id: $id, firstName: $firstName, lastName: $lastName, avatarUrl: $avatarUrl, settingDto: $settingDto, syncStatus: $syncStatus, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$ProfileDtoCopyWith<$Res> implements $ProfileDtoCopyWith<$Res> {
  factory _$ProfileDtoCopyWith(_ProfileDto value, $Res Function(_ProfileDto) _then) = __$ProfileDtoCopyWithImpl;
@override @useResult
$Res call({
@UuidSerializer() Uuid id,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'settings')@ProfileSettingDtoConverter() ProfileSettingDto settingDto,@SyncStatusSerializer()@JsonKey(name: 'sync_status') SyncStatus? syncStatus,@DateTimeSerializer()@JsonKey(name: 'created_at') DateTime? createdAt,@DateTimeSerializer()@JsonKey(name: 'updated_at') DateTime? updatedAt,@DateTimeSerializer()@JsonKey(name: 'deleted_at') DateTime? deletedAt
});


@override $ProfileSettingDtoCopyWith<$Res> get settingDto;

}
/// @nodoc
class __$ProfileDtoCopyWithImpl<$Res>
    implements _$ProfileDtoCopyWith<$Res> {
  __$ProfileDtoCopyWithImpl(this._self, this._then);

  final _ProfileDto _self;
  final $Res Function(_ProfileDto) _then;

/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = freezed,Object? lastName = freezed,Object? avatarUrl = freezed,Object? settingDto = null,Object? syncStatus = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_ProfileDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Uuid,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,settingDto: null == settingDto ? _self.settingDto : settingDto // ignore: cast_nullable_to_non_nullable
as ProfileSettingDto,syncStatus: freezed == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileSettingDtoCopyWith<$Res> get settingDto {
  
  return $ProfileSettingDtoCopyWith<$Res>(_self.settingDto, (value) {
    return _then(_self.copyWith(settingDto: value));
  });
}
}

// dart format on
