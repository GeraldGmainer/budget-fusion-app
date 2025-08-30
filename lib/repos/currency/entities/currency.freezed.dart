// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Currency {

 Uuid get id; String get name; int get decimalPrecision; bool get unitPositionFront; String get symbol; int? get uiOrder; SyncStatus? get syncStatus; DateTime? get createdAt; DateTime? get updatedAt; DateTime? get deletedAt;
/// Create a copy of Currency
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrencyCopyWith<Currency> get copyWith => _$CurrencyCopyWithImpl<Currency>(this as Currency, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Currency&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.decimalPrecision, decimalPrecision) || other.decimalPrecision == decimalPrecision)&&(identical(other.unitPositionFront, unitPositionFront) || other.unitPositionFront == unitPositionFront)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.uiOrder, uiOrder) || other.uiOrder == uiOrder)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,decimalPrecision,unitPositionFront,symbol,uiOrder,syncStatus,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'Currency(id: $id, name: $name, decimalPrecision: $decimalPrecision, unitPositionFront: $unitPositionFront, symbol: $symbol, uiOrder: $uiOrder, syncStatus: $syncStatus, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $CurrencyCopyWith<$Res>  {
  factory $CurrencyCopyWith(Currency value, $Res Function(Currency) _then) = _$CurrencyCopyWithImpl;
@useResult
$Res call({
 Uuid id, String name, int decimalPrecision, bool unitPositionFront, String symbol, int? uiOrder, SyncStatus? syncStatus, DateTime? createdAt, DateTime? updatedAt, DateTime? deletedAt
});




}
/// @nodoc
class _$CurrencyCopyWithImpl<$Res>
    implements $CurrencyCopyWith<$Res> {
  _$CurrencyCopyWithImpl(this._self, this._then);

  final Currency _self;
  final $Res Function(Currency) _then;

/// Create a copy of Currency
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? decimalPrecision = null,Object? unitPositionFront = null,Object? symbol = null,Object? uiOrder = freezed,Object? syncStatus = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Uuid,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,decimalPrecision: null == decimalPrecision ? _self.decimalPrecision : decimalPrecision // ignore: cast_nullable_to_non_nullable
as int,unitPositionFront: null == unitPositionFront ? _self.unitPositionFront : unitPositionFront // ignore: cast_nullable_to_non_nullable
as bool,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,uiOrder: freezed == uiOrder ? _self.uiOrder : uiOrder // ignore: cast_nullable_to_non_nullable
as int?,syncStatus: freezed == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Currency].
extension CurrencyPatterns on Currency {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Currency value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Currency() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Currency value)  $default,){
final _that = this;
switch (_that) {
case _Currency():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Currency value)?  $default,){
final _that = this;
switch (_that) {
case _Currency() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Uuid id,  String name,  int decimalPrecision,  bool unitPositionFront,  String symbol,  int? uiOrder,  SyncStatus? syncStatus,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Currency() when $default != null:
return $default(_that.id,_that.name,_that.decimalPrecision,_that.unitPositionFront,_that.symbol,_that.uiOrder,_that.syncStatus,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Uuid id,  String name,  int decimalPrecision,  bool unitPositionFront,  String symbol,  int? uiOrder,  SyncStatus? syncStatus,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _Currency():
return $default(_that.id,_that.name,_that.decimalPrecision,_that.unitPositionFront,_that.symbol,_that.uiOrder,_that.syncStatus,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Uuid id,  String name,  int decimalPrecision,  bool unitPositionFront,  String symbol,  int? uiOrder,  SyncStatus? syncStatus,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _Currency() when $default != null:
return $default(_that.id,_that.name,_that.decimalPrecision,_that.unitPositionFront,_that.symbol,_that.uiOrder,_that.syncStatus,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Currency extends Currency {
  const _Currency({required this.id, required this.name, required this.decimalPrecision, required this.unitPositionFront, required this.symbol, this.uiOrder, this.syncStatus, this.createdAt, this.updatedAt, this.deletedAt}): super._();
  

@override final  Uuid id;
@override final  String name;
@override final  int decimalPrecision;
@override final  bool unitPositionFront;
@override final  String symbol;
@override final  int? uiOrder;
@override final  SyncStatus? syncStatus;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  DateTime? deletedAt;

/// Create a copy of Currency
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrencyCopyWith<_Currency> get copyWith => __$CurrencyCopyWithImpl<_Currency>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Currency&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.decimalPrecision, decimalPrecision) || other.decimalPrecision == decimalPrecision)&&(identical(other.unitPositionFront, unitPositionFront) || other.unitPositionFront == unitPositionFront)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.uiOrder, uiOrder) || other.uiOrder == uiOrder)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,decimalPrecision,unitPositionFront,symbol,uiOrder,syncStatus,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'Currency(id: $id, name: $name, decimalPrecision: $decimalPrecision, unitPositionFront: $unitPositionFront, symbol: $symbol, uiOrder: $uiOrder, syncStatus: $syncStatus, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$CurrencyCopyWith<$Res> implements $CurrencyCopyWith<$Res> {
  factory _$CurrencyCopyWith(_Currency value, $Res Function(_Currency) _then) = __$CurrencyCopyWithImpl;
@override @useResult
$Res call({
 Uuid id, String name, int decimalPrecision, bool unitPositionFront, String symbol, int? uiOrder, SyncStatus? syncStatus, DateTime? createdAt, DateTime? updatedAt, DateTime? deletedAt
});




}
/// @nodoc
class __$CurrencyCopyWithImpl<$Res>
    implements _$CurrencyCopyWith<$Res> {
  __$CurrencyCopyWithImpl(this._self, this._then);

  final _Currency _self;
  final $Res Function(_Currency) _then;

/// Create a copy of Currency
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? decimalPrecision = null,Object? unitPositionFront = null,Object? symbol = null,Object? uiOrder = freezed,Object? syncStatus = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_Currency(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Uuid,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,decimalPrecision: null == decimalPrecision ? _self.decimalPrecision : decimalPrecision // ignore: cast_nullable_to_non_nullable
as int,unitPositionFront: null == unitPositionFront ? _self.unitPositionFront : unitPositionFront // ignore: cast_nullable_to_non_nullable
as bool,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,uiOrder: freezed == uiOrder ? _self.uiOrder : uiOrder // ignore: cast_nullable_to_non_nullable
as int?,syncStatus: freezed == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
