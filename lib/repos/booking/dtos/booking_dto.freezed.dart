// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingDto {

@UuidSerializer() Uuid get id;@JsonKey(name: 'date')@DateSerializer() DateTime get date; String? get description;@DecimalConverter() Decimal get amount;@JsonKey(name: 'category_id')@UuidSerializer() Uuid get categoryId;@JsonKey(name: 'account_id')@UuidSerializer() Uuid get accountId;@SyncStatusSerializer()@JsonKey(name: 'sync_status') SyncStatus? get syncStatus;@DateTimeSerializer()@JsonKey(name: 'created_at') DateTime? get createdAt;@DateTimeSerializer()@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of BookingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingDtoCopyWith<BookingDto> get copyWith => _$BookingDtoCopyWithImpl<BookingDto>(this as BookingDto, _$identity);

  /// Serializes this BookingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingDto&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,description,amount,categoryId,accountId,syncStatus,createdAt,updatedAt);

@override
String toString() {
  return 'BookingDto(id: $id, date: $date, description: $description, amount: $amount, categoryId: $categoryId, accountId: $accountId, syncStatus: $syncStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BookingDtoCopyWith<$Res>  {
  factory $BookingDtoCopyWith(BookingDto value, $Res Function(BookingDto) _then) = _$BookingDtoCopyWithImpl;
@useResult
$Res call({
@UuidSerializer() Uuid id,@JsonKey(name: 'date')@DateSerializer() DateTime date, String? description,@DecimalConverter() Decimal amount,@JsonKey(name: 'category_id')@UuidSerializer() Uuid categoryId,@JsonKey(name: 'account_id')@UuidSerializer() Uuid accountId,@SyncStatusSerializer()@JsonKey(name: 'sync_status') SyncStatus? syncStatus,@DateTimeSerializer()@JsonKey(name: 'created_at') DateTime? createdAt,@DateTimeSerializer()@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$BookingDtoCopyWithImpl<$Res>
    implements $BookingDtoCopyWith<$Res> {
  _$BookingDtoCopyWithImpl(this._self, this._then);

  final BookingDto _self;
  final $Res Function(BookingDto) _then;

/// Create a copy of BookingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? date = null,Object? description = freezed,Object? amount = null,Object? categoryId = null,Object? accountId = null,Object? syncStatus = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Uuid,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Decimal,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as Uuid,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as Uuid,syncStatus: freezed == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingDto].
extension BookingDtoPatterns on BookingDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingDto value)  $default,){
final _that = this;
switch (_that) {
case _BookingDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingDto value)?  $default,){
final _that = this;
switch (_that) {
case _BookingDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@UuidSerializer()  Uuid id, @JsonKey(name: 'date')@DateSerializer()  DateTime date,  String? description, @DecimalConverter()  Decimal amount, @JsonKey(name: 'category_id')@UuidSerializer()  Uuid categoryId, @JsonKey(name: 'account_id')@UuidSerializer()  Uuid accountId, @SyncStatusSerializer()@JsonKey(name: 'sync_status')  SyncStatus? syncStatus, @DateTimeSerializer()@JsonKey(name: 'created_at')  DateTime? createdAt, @DateTimeSerializer()@JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingDto() when $default != null:
return $default(_that.id,_that.date,_that.description,_that.amount,_that.categoryId,_that.accountId,_that.syncStatus,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@UuidSerializer()  Uuid id, @JsonKey(name: 'date')@DateSerializer()  DateTime date,  String? description, @DecimalConverter()  Decimal amount, @JsonKey(name: 'category_id')@UuidSerializer()  Uuid categoryId, @JsonKey(name: 'account_id')@UuidSerializer()  Uuid accountId, @SyncStatusSerializer()@JsonKey(name: 'sync_status')  SyncStatus? syncStatus, @DateTimeSerializer()@JsonKey(name: 'created_at')  DateTime? createdAt, @DateTimeSerializer()@JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _BookingDto():
return $default(_that.id,_that.date,_that.description,_that.amount,_that.categoryId,_that.accountId,_that.syncStatus,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@UuidSerializer()  Uuid id, @JsonKey(name: 'date')@DateSerializer()  DateTime date,  String? description, @DecimalConverter()  Decimal amount, @JsonKey(name: 'category_id')@UuidSerializer()  Uuid categoryId, @JsonKey(name: 'account_id')@UuidSerializer()  Uuid accountId, @SyncStatusSerializer()@JsonKey(name: 'sync_status')  SyncStatus? syncStatus, @DateTimeSerializer()@JsonKey(name: 'created_at')  DateTime? createdAt, @DateTimeSerializer()@JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _BookingDto() when $default != null:
return $default(_that.id,_that.date,_that.description,_that.amount,_that.categoryId,_that.accountId,_that.syncStatus,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingDto extends BookingDto {
  const _BookingDto({@UuidSerializer() required this.id, @JsonKey(name: 'date')@DateSerializer() required this.date, this.description, @DecimalConverter() required this.amount, @JsonKey(name: 'category_id')@UuidSerializer() required this.categoryId, @JsonKey(name: 'account_id')@UuidSerializer() required this.accountId, @SyncStatusSerializer()@JsonKey(name: 'sync_status') required this.syncStatus, @DateTimeSerializer()@JsonKey(name: 'created_at') required this.createdAt, @DateTimeSerializer()@JsonKey(name: 'updated_at') required this.updatedAt}): super._();
  factory _BookingDto.fromJson(Map<String, dynamic> json) => _$BookingDtoFromJson(json);

@override@UuidSerializer() final  Uuid id;
@override@JsonKey(name: 'date')@DateSerializer() final  DateTime date;
@override final  String? description;
@override@DecimalConverter() final  Decimal amount;
@override@JsonKey(name: 'category_id')@UuidSerializer() final  Uuid categoryId;
@override@JsonKey(name: 'account_id')@UuidSerializer() final  Uuid accountId;
@override@SyncStatusSerializer()@JsonKey(name: 'sync_status') final  SyncStatus? syncStatus;
@override@DateTimeSerializer()@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@DateTimeSerializer()@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of BookingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingDtoCopyWith<_BookingDto> get copyWith => __$BookingDtoCopyWithImpl<_BookingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingDto&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,description,amount,categoryId,accountId,syncStatus,createdAt,updatedAt);

@override
String toString() {
  return 'BookingDto(id: $id, date: $date, description: $description, amount: $amount, categoryId: $categoryId, accountId: $accountId, syncStatus: $syncStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BookingDtoCopyWith<$Res> implements $BookingDtoCopyWith<$Res> {
  factory _$BookingDtoCopyWith(_BookingDto value, $Res Function(_BookingDto) _then) = __$BookingDtoCopyWithImpl;
@override @useResult
$Res call({
@UuidSerializer() Uuid id,@JsonKey(name: 'date')@DateSerializer() DateTime date, String? description,@DecimalConverter() Decimal amount,@JsonKey(name: 'category_id')@UuidSerializer() Uuid categoryId,@JsonKey(name: 'account_id')@UuidSerializer() Uuid accountId,@SyncStatusSerializer()@JsonKey(name: 'sync_status') SyncStatus? syncStatus,@DateTimeSerializer()@JsonKey(name: 'created_at') DateTime? createdAt,@DateTimeSerializer()@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$BookingDtoCopyWithImpl<$Res>
    implements _$BookingDtoCopyWith<$Res> {
  __$BookingDtoCopyWithImpl(this._self, this._then);

  final _BookingDto _self;
  final $Res Function(_BookingDto) _then;

/// Create a copy of BookingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? date = null,Object? description = freezed,Object? amount = null,Object? categoryId = null,Object? accountId = null,Object? syncStatus = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_BookingDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Uuid,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Decimal,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as Uuid,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as Uuid,syncStatus: freezed == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
