// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_setting_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileSettingDto {

@UuidSerializer()@JsonKey(name: 'currency_id') Uuid get currencyId;
/// Create a copy of ProfileSettingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileSettingDtoCopyWith<ProfileSettingDto> get copyWith => _$ProfileSettingDtoCopyWithImpl<ProfileSettingDto>(this as ProfileSettingDto, _$identity);

  /// Serializes this ProfileSettingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSettingDto&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currencyId);

@override
String toString() {
  return 'ProfileSettingDto(currencyId: $currencyId)';
}


}

/// @nodoc
abstract mixin class $ProfileSettingDtoCopyWith<$Res>  {
  factory $ProfileSettingDtoCopyWith(ProfileSettingDto value, $Res Function(ProfileSettingDto) _then) = _$ProfileSettingDtoCopyWithImpl;
@useResult
$Res call({
@UuidSerializer()@JsonKey(name: 'currency_id') Uuid currencyId
});




}
/// @nodoc
class _$ProfileSettingDtoCopyWithImpl<$Res>
    implements $ProfileSettingDtoCopyWith<$Res> {
  _$ProfileSettingDtoCopyWithImpl(this._self, this._then);

  final ProfileSettingDto _self;
  final $Res Function(ProfileSettingDto) _then;

/// Create a copy of ProfileSettingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currencyId = null,}) {
  return _then(_self.copyWith(
currencyId: null == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as Uuid,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileSettingDto].
extension ProfileSettingDtoPatterns on ProfileSettingDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileSettingDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileSettingDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileSettingDto value)  $default,){
final _that = this;
switch (_that) {
case _ProfileSettingDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileSettingDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileSettingDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@UuidSerializer()@JsonKey(name: 'currency_id')  Uuid currencyId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileSettingDto() when $default != null:
return $default(_that.currencyId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@UuidSerializer()@JsonKey(name: 'currency_id')  Uuid currencyId)  $default,) {final _that = this;
switch (_that) {
case _ProfileSettingDto():
return $default(_that.currencyId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@UuidSerializer()@JsonKey(name: 'currency_id')  Uuid currencyId)?  $default,) {final _that = this;
switch (_that) {
case _ProfileSettingDto() when $default != null:
return $default(_that.currencyId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileSettingDto extends ProfileSettingDto {
  const _ProfileSettingDto({@UuidSerializer()@JsonKey(name: 'currency_id') required this.currencyId}): super._();
  factory _ProfileSettingDto.fromJson(Map<String, dynamic> json) => _$ProfileSettingDtoFromJson(json);

@override@UuidSerializer()@JsonKey(name: 'currency_id') final  Uuid currencyId;

/// Create a copy of ProfileSettingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileSettingDtoCopyWith<_ProfileSettingDto> get copyWith => __$ProfileSettingDtoCopyWithImpl<_ProfileSettingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileSettingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileSettingDto&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currencyId);

@override
String toString() {
  return 'ProfileSettingDto(currencyId: $currencyId)';
}


}

/// @nodoc
abstract mixin class _$ProfileSettingDtoCopyWith<$Res> implements $ProfileSettingDtoCopyWith<$Res> {
  factory _$ProfileSettingDtoCopyWith(_ProfileSettingDto value, $Res Function(_ProfileSettingDto) _then) = __$ProfileSettingDtoCopyWithImpl;
@override @useResult
$Res call({
@UuidSerializer()@JsonKey(name: 'currency_id') Uuid currencyId
});




}
/// @nodoc
class __$ProfileSettingDtoCopyWithImpl<$Res>
    implements _$ProfileSettingDtoCopyWith<$Res> {
  __$ProfileSettingDtoCopyWithImpl(this._self, this._then);

  final _ProfileSettingDto _self;
  final $Res Function(_ProfileSettingDto) _then;

/// Create a copy of ProfileSettingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currencyId = null,}) {
  return _then(_ProfileSettingDto(
currencyId: null == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as Uuid,
  ));
}


}

// dart format on
