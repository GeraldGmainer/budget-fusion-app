// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileSetting {

 Currency get currency;
/// Create a copy of ProfileSetting
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileSettingCopyWith<ProfileSetting> get copyWith => _$ProfileSettingCopyWithImpl<ProfileSetting>(this as ProfileSetting, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSetting&&(identical(other.currency, currency) || other.currency == currency));
}


@override
int get hashCode => Object.hash(runtimeType,currency);

@override
String toString() {
  return 'ProfileSetting(currency: $currency)';
}


}

/// @nodoc
abstract mixin class $ProfileSettingCopyWith<$Res>  {
  factory $ProfileSettingCopyWith(ProfileSetting value, $Res Function(ProfileSetting) _then) = _$ProfileSettingCopyWithImpl;
@useResult
$Res call({
 Currency currency
});


$CurrencyCopyWith<$Res> get currency;

}
/// @nodoc
class _$ProfileSettingCopyWithImpl<$Res>
    implements $ProfileSettingCopyWith<$Res> {
  _$ProfileSettingCopyWithImpl(this._self, this._then);

  final ProfileSetting _self;
  final $Res Function(ProfileSetting) _then;

/// Create a copy of ProfileSetting
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currency = null,}) {
  return _then(_self.copyWith(
currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,
  ));
}
/// Create a copy of ProfileSetting
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrencyCopyWith<$Res> get currency {
  
  return $CurrencyCopyWith<$Res>(_self.currency, (value) {
    return _then(_self.copyWith(currency: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileSetting].
extension ProfileSettingPatterns on ProfileSetting {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileSetting value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileSetting() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileSetting value)  $default,){
final _that = this;
switch (_that) {
case _ProfileSetting():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileSetting value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileSetting() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Currency currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileSetting() when $default != null:
return $default(_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Currency currency)  $default,) {final _that = this;
switch (_that) {
case _ProfileSetting():
return $default(_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Currency currency)?  $default,) {final _that = this;
switch (_that) {
case _ProfileSetting() when $default != null:
return $default(_that.currency);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileSetting extends ProfileSetting {
  const _ProfileSetting({required this.currency}): super._();
  

@override final  Currency currency;

/// Create a copy of ProfileSetting
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileSettingCopyWith<_ProfileSetting> get copyWith => __$ProfileSettingCopyWithImpl<_ProfileSetting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileSetting&&(identical(other.currency, currency) || other.currency == currency));
}


@override
int get hashCode => Object.hash(runtimeType,currency);

@override
String toString() {
  return 'ProfileSetting(currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$ProfileSettingCopyWith<$Res> implements $ProfileSettingCopyWith<$Res> {
  factory _$ProfileSettingCopyWith(_ProfileSetting value, $Res Function(_ProfileSetting) _then) = __$ProfileSettingCopyWithImpl;
@override @useResult
$Res call({
 Currency currency
});


@override $CurrencyCopyWith<$Res> get currency;

}
/// @nodoc
class __$ProfileSettingCopyWithImpl<$Res>
    implements _$ProfileSettingCopyWith<$Res> {
  __$ProfileSettingCopyWithImpl(this._self, this._then);

  final _ProfileSetting _self;
  final $Res Function(_ProfileSetting) _then;

/// Create a copy of ProfileSetting
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currency = null,}) {
  return _then(_ProfileSetting(
currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,
  ));
}

/// Create a copy of ProfileSetting
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrencyCopyWith<$Res> get currency {
  
  return $CurrencyCopyWith<$Res>(_self.currency, (value) {
    return _then(_self.copyWith(currency: value));
  });
}
}

// dart format on
