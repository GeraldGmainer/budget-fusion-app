// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Profile {

 Uuid get id; String get email; String? get firstName; String? get lastName; String? get avatarUrl; ProfileSetting get setting; SyncStatus? get syncStatus; DateTime? get createdAt; DateTime? get updatedAt; DateTime? get deletedAt;
/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileCopyWith<Profile> get copyWith => _$ProfileCopyWithImpl<Profile>(this as Profile, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Profile&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.setting, setting) || other.setting == setting)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,email,firstName,lastName,avatarUrl,setting,syncStatus,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'Profile(id: $id, email: $email, firstName: $firstName, lastName: $lastName, avatarUrl: $avatarUrl, setting: $setting, syncStatus: $syncStatus, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $ProfileCopyWith<$Res>  {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) _then) = _$ProfileCopyWithImpl;
@useResult
$Res call({
 Uuid id, String email, String? firstName, String? lastName, String? avatarUrl, ProfileSetting setting, SyncStatus? syncStatus, DateTime? createdAt, DateTime? updatedAt, DateTime? deletedAt
});


$ProfileSettingCopyWith<$Res> get setting;

}
/// @nodoc
class _$ProfileCopyWithImpl<$Res>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._self, this._then);

  final Profile _self;
  final $Res Function(Profile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? firstName = freezed,Object? lastName = freezed,Object? avatarUrl = freezed,Object? setting = null,Object? syncStatus = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Uuid,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,setting: null == setting ? _self.setting : setting // ignore: cast_nullable_to_non_nullable
as ProfileSetting,syncStatus: freezed == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileSettingCopyWith<$Res> get setting {
  
  return $ProfileSettingCopyWith<$Res>(_self.setting, (value) {
    return _then(_self.copyWith(setting: value));
  });
}
}


/// Adds pattern-matching-related methods to [Profile].
extension ProfilePatterns on Profile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Profile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Profile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Profile value)  $default,){
final _that = this;
switch (_that) {
case _Profile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Profile value)?  $default,){
final _that = this;
switch (_that) {
case _Profile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Uuid id,  String email,  String? firstName,  String? lastName,  String? avatarUrl,  ProfileSetting setting,  SyncStatus? syncStatus,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that.id,_that.email,_that.firstName,_that.lastName,_that.avatarUrl,_that.setting,_that.syncStatus,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Uuid id,  String email,  String? firstName,  String? lastName,  String? avatarUrl,  ProfileSetting setting,  SyncStatus? syncStatus,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _Profile():
return $default(_that.id,_that.email,_that.firstName,_that.lastName,_that.avatarUrl,_that.setting,_that.syncStatus,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Uuid id,  String email,  String? firstName,  String? lastName,  String? avatarUrl,  ProfileSetting setting,  SyncStatus? syncStatus,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that.id,_that.email,_that.firstName,_that.lastName,_that.avatarUrl,_that.setting,_that.syncStatus,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Profile extends Profile {
  const _Profile({required this.id, required this.email, this.firstName, this.lastName, this.avatarUrl, required this.setting, this.syncStatus, this.createdAt, this.updatedAt, this.deletedAt}): super._();
  

@override final  Uuid id;
@override final  String email;
@override final  String? firstName;
@override final  String? lastName;
@override final  String? avatarUrl;
@override final  ProfileSetting setting;
@override final  SyncStatus? syncStatus;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  DateTime? deletedAt;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileCopyWith<_Profile> get copyWith => __$ProfileCopyWithImpl<_Profile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Profile&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.setting, setting) || other.setting == setting)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,email,firstName,lastName,avatarUrl,setting,syncStatus,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'Profile(id: $id, email: $email, firstName: $firstName, lastName: $lastName, avatarUrl: $avatarUrl, setting: $setting, syncStatus: $syncStatus, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) _then) = __$ProfileCopyWithImpl;
@override @useResult
$Res call({
 Uuid id, String email, String? firstName, String? lastName, String? avatarUrl, ProfileSetting setting, SyncStatus? syncStatus, DateTime? createdAt, DateTime? updatedAt, DateTime? deletedAt
});


@override $ProfileSettingCopyWith<$Res> get setting;

}
/// @nodoc
class __$ProfileCopyWithImpl<$Res>
    implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(this._self, this._then);

  final _Profile _self;
  final $Res Function(_Profile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? firstName = freezed,Object? lastName = freezed,Object? avatarUrl = freezed,Object? setting = null,Object? syncStatus = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_Profile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Uuid,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,setting: null == setting ? _self.setting : setting // ignore: cast_nullable_to_non_nullable
as ProfileSetting,syncStatus: freezed == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileSettingCopyWith<$Res> get setting {
  
  return $ProfileSettingCopyWith<$Res>(_self.setting, (value) {
    return _then(_self.copyWith(setting: value));
  });
}
}

// dart format on
