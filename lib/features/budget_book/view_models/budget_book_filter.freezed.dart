// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_book_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BudgetBookFilter {

 TransactionType? get transaction; set transaction(TransactionType? value); PeriodMode get period; set period(PeriodMode value); Account? get account; set account(Account? value); String? get description; set description(String? value);
/// Create a copy of BudgetBookFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetBookFilterCopyWith<BudgetBookFilter> get copyWith => _$BudgetBookFilterCopyWithImpl<BudgetBookFilter>(this as BudgetBookFilter, _$identity);







}

/// @nodoc
abstract mixin class $BudgetBookFilterCopyWith<$Res>  {
  factory $BudgetBookFilterCopyWith(BudgetBookFilter value, $Res Function(BudgetBookFilter) _then) = _$BudgetBookFilterCopyWithImpl;
@useResult
$Res call({
 TransactionType? transaction, PeriodMode period, Account? account, String? description
});


$AccountCopyWith<$Res>? get account;

}
/// @nodoc
class _$BudgetBookFilterCopyWithImpl<$Res>
    implements $BudgetBookFilterCopyWith<$Res> {
  _$BudgetBookFilterCopyWithImpl(this._self, this._then);

  final BudgetBookFilter _self;
  final $Res Function(BudgetBookFilter) _then;

/// Create a copy of BudgetBookFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transaction = freezed,Object? period = null,Object? account = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
transaction: freezed == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as TransactionType?,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as PeriodMode,account: freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as Account?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of BudgetBookFilter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountCopyWith<$Res>? get account {
    if (_self.account == null) {
    return null;
  }

  return $AccountCopyWith<$Res>(_self.account!, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}


/// Adds pattern-matching-related methods to [BudgetBookFilter].
extension BudgetBookFilterPatterns on BudgetBookFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BudgetBookFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BudgetBookFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BudgetBookFilter value)  $default,){
final _that = this;
switch (_that) {
case _BudgetBookFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BudgetBookFilter value)?  $default,){
final _that = this;
switch (_that) {
case _BudgetBookFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TransactionType? transaction,  PeriodMode period,  Account? account,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BudgetBookFilter() when $default != null:
return $default(_that.transaction,_that.period,_that.account,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TransactionType? transaction,  PeriodMode period,  Account? account,  String? description)  $default,) {final _that = this;
switch (_that) {
case _BudgetBookFilter():
return $default(_that.transaction,_that.period,_that.account,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TransactionType? transaction,  PeriodMode period,  Account? account,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _BudgetBookFilter() when $default != null:
return $default(_that.transaction,_that.period,_that.account,_that.description);case _:
  return null;

}
}

}

/// @nodoc


class _BudgetBookFilter extends BudgetBookFilter {
   _BudgetBookFilter({this.transaction, required this.period, this.account, this.description}): super._();
  

@override  TransactionType? transaction;
@override  PeriodMode period;
@override  Account? account;
@override  String? description;

/// Create a copy of BudgetBookFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BudgetBookFilterCopyWith<_BudgetBookFilter> get copyWith => __$BudgetBookFilterCopyWithImpl<_BudgetBookFilter>(this, _$identity);







}

/// @nodoc
abstract mixin class _$BudgetBookFilterCopyWith<$Res> implements $BudgetBookFilterCopyWith<$Res> {
  factory _$BudgetBookFilterCopyWith(_BudgetBookFilter value, $Res Function(_BudgetBookFilter) _then) = __$BudgetBookFilterCopyWithImpl;
@override @useResult
$Res call({
 TransactionType? transaction, PeriodMode period, Account? account, String? description
});


@override $AccountCopyWith<$Res>? get account;

}
/// @nodoc
class __$BudgetBookFilterCopyWithImpl<$Res>
    implements _$BudgetBookFilterCopyWith<$Res> {
  __$BudgetBookFilterCopyWithImpl(this._self, this._then);

  final _BudgetBookFilter _self;
  final $Res Function(_BudgetBookFilter) _then;

/// Create a copy of BudgetBookFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transaction = freezed,Object? period = null,Object? account = freezed,Object? description = freezed,}) {
  return _then(_BudgetBookFilter(
transaction: freezed == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as TransactionType?,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as PeriodMode,account: freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as Account?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of BudgetBookFilter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountCopyWith<$Res>? get account {
    if (_self.account == null) {
    return null;
  }

  return $AccountCopyWith<$Res>(_self.account!, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}

// dart format on
