// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_all_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RawDelta {

 List<Map<String, dynamic>> get upserts; List<String> get deletes;
/// Create a copy of RawDelta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RawDeltaCopyWith<RawDelta> get copyWith => _$RawDeltaCopyWithImpl<RawDelta>(this as RawDelta, _$identity);

  /// Serializes this RawDelta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RawDelta&&const DeepCollectionEquality().equals(other.upserts, upserts)&&const DeepCollectionEquality().equals(other.deletes, deletes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(upserts),const DeepCollectionEquality().hash(deletes));

@override
String toString() {
  return 'RawDelta(upserts: $upserts, deletes: $deletes)';
}


}

/// @nodoc
abstract mixin class $RawDeltaCopyWith<$Res>  {
  factory $RawDeltaCopyWith(RawDelta value, $Res Function(RawDelta) _then) = _$RawDeltaCopyWithImpl;
@useResult
$Res call({
 List<Map<String, dynamic>> upserts, List<String> deletes
});




}
/// @nodoc
class _$RawDeltaCopyWithImpl<$Res>
    implements $RawDeltaCopyWith<$Res> {
  _$RawDeltaCopyWithImpl(this._self, this._then);

  final RawDelta _self;
  final $Res Function(RawDelta) _then;

/// Create a copy of RawDelta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? upserts = null,Object? deletes = null,}) {
  return _then(_self.copyWith(
upserts: null == upserts ? _self.upserts : upserts // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,deletes: null == deletes ? _self.deletes : deletes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [RawDelta].
extension RawDeltaPatterns on RawDelta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RawDelta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RawDelta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RawDelta value)  $default,){
final _that = this;
switch (_that) {
case _RawDelta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RawDelta value)?  $default,){
final _that = this;
switch (_that) {
case _RawDelta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Map<String, dynamic>> upserts,  List<String> deletes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RawDelta() when $default != null:
return $default(_that.upserts,_that.deletes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Map<String, dynamic>> upserts,  List<String> deletes)  $default,) {final _that = this;
switch (_that) {
case _RawDelta():
return $default(_that.upserts,_that.deletes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Map<String, dynamic>> upserts,  List<String> deletes)?  $default,) {final _that = this;
switch (_that) {
case _RawDelta() when $default != null:
return $default(_that.upserts,_that.deletes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RawDelta implements RawDelta {
  const _RawDelta({required final  List<Map<String, dynamic>> upserts, required final  List<String> deletes}): _upserts = upserts,_deletes = deletes;
  factory _RawDelta.fromJson(Map<String, dynamic> json) => _$RawDeltaFromJson(json);

 final  List<Map<String, dynamic>> _upserts;
@override List<Map<String, dynamic>> get upserts {
  if (_upserts is EqualUnmodifiableListView) return _upserts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_upserts);
}

 final  List<String> _deletes;
@override List<String> get deletes {
  if (_deletes is EqualUnmodifiableListView) return _deletes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deletes);
}


/// Create a copy of RawDelta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RawDeltaCopyWith<_RawDelta> get copyWith => __$RawDeltaCopyWithImpl<_RawDelta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RawDeltaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RawDelta&&const DeepCollectionEquality().equals(other._upserts, _upserts)&&const DeepCollectionEquality().equals(other._deletes, _deletes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_upserts),const DeepCollectionEquality().hash(_deletes));

@override
String toString() {
  return 'RawDelta(upserts: $upserts, deletes: $deletes)';
}


}

/// @nodoc
abstract mixin class _$RawDeltaCopyWith<$Res> implements $RawDeltaCopyWith<$Res> {
  factory _$RawDeltaCopyWith(_RawDelta value, $Res Function(_RawDelta) _then) = __$RawDeltaCopyWithImpl;
@override @useResult
$Res call({
 List<Map<String, dynamic>> upserts, List<String> deletes
});




}
/// @nodoc
class __$RawDeltaCopyWithImpl<$Res>
    implements _$RawDeltaCopyWith<$Res> {
  __$RawDeltaCopyWithImpl(this._self, this._then);

  final _RawDelta _self;
  final $Res Function(_RawDelta) _then;

/// Create a copy of RawDelta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? upserts = null,Object? deletes = null,}) {
  return _then(_RawDelta(
upserts: null == upserts ? _self._upserts : upserts // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,deletes: null == deletes ? _self._deletes : deletes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$SyncAllResponse {

 DateTime get serverNow; Map<String, RawDelta> get deltas;@JsonKey(name: 'newTimestamps', fromJson: _tsMapFromJson, toJson: _tsMapToJson) Map<String, DateTime?> get newTimestamps;
/// Create a copy of SyncAllResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncAllResponseCopyWith<SyncAllResponse> get copyWith => _$SyncAllResponseCopyWithImpl<SyncAllResponse>(this as SyncAllResponse, _$identity);

  /// Serializes this SyncAllResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncAllResponse&&(identical(other.serverNow, serverNow) || other.serverNow == serverNow)&&const DeepCollectionEquality().equals(other.deltas, deltas)&&const DeepCollectionEquality().equals(other.newTimestamps, newTimestamps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverNow,const DeepCollectionEquality().hash(deltas),const DeepCollectionEquality().hash(newTimestamps));

@override
String toString() {
  return 'SyncAllResponse(serverNow: $serverNow, deltas: $deltas, newTimestamps: $newTimestamps)';
}


}

/// @nodoc
abstract mixin class $SyncAllResponseCopyWith<$Res>  {
  factory $SyncAllResponseCopyWith(SyncAllResponse value, $Res Function(SyncAllResponse) _then) = _$SyncAllResponseCopyWithImpl;
@useResult
$Res call({
 DateTime serverNow, Map<String, RawDelta> deltas,@JsonKey(name: 'newTimestamps', fromJson: _tsMapFromJson, toJson: _tsMapToJson) Map<String, DateTime?> newTimestamps
});




}
/// @nodoc
class _$SyncAllResponseCopyWithImpl<$Res>
    implements $SyncAllResponseCopyWith<$Res> {
  _$SyncAllResponseCopyWithImpl(this._self, this._then);

  final SyncAllResponse _self;
  final $Res Function(SyncAllResponse) _then;

/// Create a copy of SyncAllResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serverNow = null,Object? deltas = null,Object? newTimestamps = null,}) {
  return _then(_self.copyWith(
serverNow: null == serverNow ? _self.serverNow : serverNow // ignore: cast_nullable_to_non_nullable
as DateTime,deltas: null == deltas ? _self.deltas : deltas // ignore: cast_nullable_to_non_nullable
as Map<String, RawDelta>,newTimestamps: null == newTimestamps ? _self.newTimestamps : newTimestamps // ignore: cast_nullable_to_non_nullable
as Map<String, DateTime?>,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncAllResponse].
extension SyncAllResponsePatterns on SyncAllResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncAllResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncAllResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncAllResponse value)  $default,){
final _that = this;
switch (_that) {
case _SyncAllResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncAllResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SyncAllResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime serverNow,  Map<String, RawDelta> deltas, @JsonKey(name: 'newTimestamps', fromJson: _tsMapFromJson, toJson: _tsMapToJson)  Map<String, DateTime?> newTimestamps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncAllResponse() when $default != null:
return $default(_that.serverNow,_that.deltas,_that.newTimestamps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime serverNow,  Map<String, RawDelta> deltas, @JsonKey(name: 'newTimestamps', fromJson: _tsMapFromJson, toJson: _tsMapToJson)  Map<String, DateTime?> newTimestamps)  $default,) {final _that = this;
switch (_that) {
case _SyncAllResponse():
return $default(_that.serverNow,_that.deltas,_that.newTimestamps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime serverNow,  Map<String, RawDelta> deltas, @JsonKey(name: 'newTimestamps', fromJson: _tsMapFromJson, toJson: _tsMapToJson)  Map<String, DateTime?> newTimestamps)?  $default,) {final _that = this;
switch (_that) {
case _SyncAllResponse() when $default != null:
return $default(_that.serverNow,_that.deltas,_that.newTimestamps);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SyncAllResponse implements SyncAllResponse {
  const _SyncAllResponse({required this.serverNow, required final  Map<String, RawDelta> deltas, @JsonKey(name: 'newTimestamps', fromJson: _tsMapFromJson, toJson: _tsMapToJson) required final  Map<String, DateTime?> newTimestamps}): _deltas = deltas,_newTimestamps = newTimestamps;
  factory _SyncAllResponse.fromJson(Map<String, dynamic> json) => _$SyncAllResponseFromJson(json);

@override final  DateTime serverNow;
 final  Map<String, RawDelta> _deltas;
@override Map<String, RawDelta> get deltas {
  if (_deltas is EqualUnmodifiableMapView) return _deltas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_deltas);
}

 final  Map<String, DateTime?> _newTimestamps;
@override@JsonKey(name: 'newTimestamps', fromJson: _tsMapFromJson, toJson: _tsMapToJson) Map<String, DateTime?> get newTimestamps {
  if (_newTimestamps is EqualUnmodifiableMapView) return _newTimestamps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_newTimestamps);
}


/// Create a copy of SyncAllResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncAllResponseCopyWith<_SyncAllResponse> get copyWith => __$SyncAllResponseCopyWithImpl<_SyncAllResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SyncAllResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncAllResponse&&(identical(other.serverNow, serverNow) || other.serverNow == serverNow)&&const DeepCollectionEquality().equals(other._deltas, _deltas)&&const DeepCollectionEquality().equals(other._newTimestamps, _newTimestamps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverNow,const DeepCollectionEquality().hash(_deltas),const DeepCollectionEquality().hash(_newTimestamps));

@override
String toString() {
  return 'SyncAllResponse(serverNow: $serverNow, deltas: $deltas, newTimestamps: $newTimestamps)';
}


}

/// @nodoc
abstract mixin class _$SyncAllResponseCopyWith<$Res> implements $SyncAllResponseCopyWith<$Res> {
  factory _$SyncAllResponseCopyWith(_SyncAllResponse value, $Res Function(_SyncAllResponse) _then) = __$SyncAllResponseCopyWithImpl;
@override @useResult
$Res call({
 DateTime serverNow, Map<String, RawDelta> deltas,@JsonKey(name: 'newTimestamps', fromJson: _tsMapFromJson, toJson: _tsMapToJson) Map<String, DateTime?> newTimestamps
});




}
/// @nodoc
class __$SyncAllResponseCopyWithImpl<$Res>
    implements _$SyncAllResponseCopyWith<$Res> {
  __$SyncAllResponseCopyWithImpl(this._self, this._then);

  final _SyncAllResponse _self;
  final $Res Function(_SyncAllResponse) _then;

/// Create a copy of SyncAllResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverNow = null,Object? deltas = null,Object? newTimestamps = null,}) {
  return _then(_SyncAllResponse(
serverNow: null == serverNow ? _self.serverNow : serverNow // ignore: cast_nullable_to_non_nullable
as DateTime,deltas: null == deltas ? _self._deltas : deltas // ignore: cast_nullable_to_non_nullable
as Map<String, RawDelta>,newTimestamps: null == newTimestamps ? _self._newTimestamps : newTimestamps // ignore: cast_nullable_to_non_nullable
as Map<String, DateTime?>,
  ));
}


}

// dart format on
