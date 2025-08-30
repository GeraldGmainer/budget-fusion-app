// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingDraft {

 Uuid? get id; DateTime get date; String? get description; Decimal get amount; Category? get category; Account? get account; CategoryType get categoryType; SyncStatus? get syncStatus;
/// Create a copy of BookingDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingDraftCopyWith<BookingDraft> get copyWith => _$BookingDraftCopyWithImpl<BookingDraft>(this as BookingDraft, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingDraft&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.category, category) || other.category == category)&&(identical(other.account, account) || other.account == account)&&(identical(other.categoryType, categoryType) || other.categoryType == categoryType)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}


@override
int get hashCode => Object.hash(runtimeType,id,date,description,amount,category,account,categoryType,syncStatus);

@override
String toString() {
  return 'BookingDraft(id: $id, date: $date, description: $description, amount: $amount, category: $category, account: $account, categoryType: $categoryType, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class $BookingDraftCopyWith<$Res>  {
  factory $BookingDraftCopyWith(BookingDraft value, $Res Function(BookingDraft) _then) = _$BookingDraftCopyWithImpl;
@useResult
$Res call({
 Uuid? id, DateTime date, String? description, Decimal amount, Category? category, Account? account, CategoryType categoryType, SyncStatus? syncStatus
});


$CategoryCopyWith<$Res>? get category;$AccountCopyWith<$Res>? get account;

}
/// @nodoc
class _$BookingDraftCopyWithImpl<$Res>
    implements $BookingDraftCopyWith<$Res> {
  _$BookingDraftCopyWithImpl(this._self, this._then);

  final BookingDraft _self;
  final $Res Function(BookingDraft) _then;

/// Create a copy of BookingDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? date = null,Object? description = freezed,Object? amount = null,Object? category = freezed,Object? account = freezed,Object? categoryType = null,Object? syncStatus = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Uuid?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Decimal,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,account: freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as Account?,categoryType: null == categoryType ? _self.categoryType : categoryType // ignore: cast_nullable_to_non_nullable
as CategoryType,syncStatus: freezed == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus?,
  ));
}
/// Create a copy of BookingDraft
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of BookingDraft
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


/// Adds pattern-matching-related methods to [BookingDraft].
extension BookingDraftPatterns on BookingDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingDraft value)  $default,){
final _that = this;
switch (_that) {
case _BookingDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingDraft value)?  $default,){
final _that = this;
switch (_that) {
case _BookingDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Uuid? id,  DateTime date,  String? description,  Decimal amount,  Category? category,  Account? account,  CategoryType categoryType,  SyncStatus? syncStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingDraft() when $default != null:
return $default(_that.id,_that.date,_that.description,_that.amount,_that.category,_that.account,_that.categoryType,_that.syncStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Uuid? id,  DateTime date,  String? description,  Decimal amount,  Category? category,  Account? account,  CategoryType categoryType,  SyncStatus? syncStatus)  $default,) {final _that = this;
switch (_that) {
case _BookingDraft():
return $default(_that.id,_that.date,_that.description,_that.amount,_that.category,_that.account,_that.categoryType,_that.syncStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Uuid? id,  DateTime date,  String? description,  Decimal amount,  Category? category,  Account? account,  CategoryType categoryType,  SyncStatus? syncStatus)?  $default,) {final _that = this;
switch (_that) {
case _BookingDraft() when $default != null:
return $default(_that.id,_that.date,_that.description,_that.amount,_that.category,_that.account,_that.categoryType,_that.syncStatus);case _:
  return null;

}
}

}

/// @nodoc


class _BookingDraft extends BookingDraft {
   _BookingDraft({this.id, required this.date, this.description, required this.amount, this.category, this.account, this.categoryType = CategoryType.outcome, this.syncStatus}): super._();
  

@override final  Uuid? id;
@override final  DateTime date;
@override final  String? description;
@override final  Decimal amount;
@override final  Category? category;
@override final  Account? account;
@override@JsonKey() final  CategoryType categoryType;
@override final  SyncStatus? syncStatus;

/// Create a copy of BookingDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingDraftCopyWith<_BookingDraft> get copyWith => __$BookingDraftCopyWithImpl<_BookingDraft>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingDraft&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.category, category) || other.category == category)&&(identical(other.account, account) || other.account == account)&&(identical(other.categoryType, categoryType) || other.categoryType == categoryType)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}


@override
int get hashCode => Object.hash(runtimeType,id,date,description,amount,category,account,categoryType,syncStatus);

@override
String toString() {
  return 'BookingDraft(id: $id, date: $date, description: $description, amount: $amount, category: $category, account: $account, categoryType: $categoryType, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class _$BookingDraftCopyWith<$Res> implements $BookingDraftCopyWith<$Res> {
  factory _$BookingDraftCopyWith(_BookingDraft value, $Res Function(_BookingDraft) _then) = __$BookingDraftCopyWithImpl;
@override @useResult
$Res call({
 Uuid? id, DateTime date, String? description, Decimal amount, Category? category, Account? account, CategoryType categoryType, SyncStatus? syncStatus
});


@override $CategoryCopyWith<$Res>? get category;@override $AccountCopyWith<$Res>? get account;

}
/// @nodoc
class __$BookingDraftCopyWithImpl<$Res>
    implements _$BookingDraftCopyWith<$Res> {
  __$BookingDraftCopyWithImpl(this._self, this._then);

  final _BookingDraft _self;
  final $Res Function(_BookingDraft) _then;

/// Create a copy of BookingDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? date = null,Object? description = freezed,Object? amount = null,Object? category = freezed,Object? account = freezed,Object? categoryType = null,Object? syncStatus = freezed,}) {
  return _then(_BookingDraft(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Uuid?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Decimal,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,account: freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as Account?,categoryType: null == categoryType ? _self.categoryType : categoryType // ignore: cast_nullable_to_non_nullable
as CategoryType,syncStatus: freezed == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus?,
  ));
}

/// Create a copy of BookingDraft
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of BookingDraft
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
