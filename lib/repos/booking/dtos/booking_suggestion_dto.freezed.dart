// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_suggestion_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingSuggestionDto {

 String get suggestion;@JsonKey(name: 'category_type')@CategoryTypeSerializer() CategoryType get categoryType;
/// Create a copy of BookingSuggestionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingSuggestionDtoCopyWith<BookingSuggestionDto> get copyWith => _$BookingSuggestionDtoCopyWithImpl<BookingSuggestionDto>(this as BookingSuggestionDto, _$identity);

  /// Serializes this BookingSuggestionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingSuggestionDto&&(identical(other.suggestion, suggestion) || other.suggestion == suggestion)&&(identical(other.categoryType, categoryType) || other.categoryType == categoryType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,suggestion,categoryType);

@override
String toString() {
  return 'BookingSuggestionDto(suggestion: $suggestion, categoryType: $categoryType)';
}


}

/// @nodoc
abstract mixin class $BookingSuggestionDtoCopyWith<$Res>  {
  factory $BookingSuggestionDtoCopyWith(BookingSuggestionDto value, $Res Function(BookingSuggestionDto) _then) = _$BookingSuggestionDtoCopyWithImpl;
@useResult
$Res call({
 String suggestion,@JsonKey(name: 'category_type')@CategoryTypeSerializer() CategoryType categoryType
});




}
/// @nodoc
class _$BookingSuggestionDtoCopyWithImpl<$Res>
    implements $BookingSuggestionDtoCopyWith<$Res> {
  _$BookingSuggestionDtoCopyWithImpl(this._self, this._then);

  final BookingSuggestionDto _self;
  final $Res Function(BookingSuggestionDto) _then;

/// Create a copy of BookingSuggestionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? suggestion = null,Object? categoryType = null,}) {
  return _then(_self.copyWith(
suggestion: null == suggestion ? _self.suggestion : suggestion // ignore: cast_nullable_to_non_nullable
as String,categoryType: null == categoryType ? _self.categoryType : categoryType // ignore: cast_nullable_to_non_nullable
as CategoryType,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingSuggestionDto].
extension BookingSuggestionDtoPatterns on BookingSuggestionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingSuggestionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingSuggestionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingSuggestionDto value)  $default,){
final _that = this;
switch (_that) {
case _BookingSuggestionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingSuggestionDto value)?  $default,){
final _that = this;
switch (_that) {
case _BookingSuggestionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String suggestion, @JsonKey(name: 'category_type')@CategoryTypeSerializer()  CategoryType categoryType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingSuggestionDto() when $default != null:
return $default(_that.suggestion,_that.categoryType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String suggestion, @JsonKey(name: 'category_type')@CategoryTypeSerializer()  CategoryType categoryType)  $default,) {final _that = this;
switch (_that) {
case _BookingSuggestionDto():
return $default(_that.suggestion,_that.categoryType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String suggestion, @JsonKey(name: 'category_type')@CategoryTypeSerializer()  CategoryType categoryType)?  $default,) {final _that = this;
switch (_that) {
case _BookingSuggestionDto() when $default != null:
return $default(_that.suggestion,_that.categoryType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingSuggestionDto extends BookingSuggestionDto {
  const _BookingSuggestionDto({required this.suggestion, @JsonKey(name: 'category_type')@CategoryTypeSerializer() required this.categoryType}): super._();
  factory _BookingSuggestionDto.fromJson(Map<String, dynamic> json) => _$BookingSuggestionDtoFromJson(json);

@override final  String suggestion;
@override@JsonKey(name: 'category_type')@CategoryTypeSerializer() final  CategoryType categoryType;

/// Create a copy of BookingSuggestionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingSuggestionDtoCopyWith<_BookingSuggestionDto> get copyWith => __$BookingSuggestionDtoCopyWithImpl<_BookingSuggestionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingSuggestionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingSuggestionDto&&(identical(other.suggestion, suggestion) || other.suggestion == suggestion)&&(identical(other.categoryType, categoryType) || other.categoryType == categoryType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,suggestion,categoryType);

@override
String toString() {
  return 'BookingSuggestionDto(suggestion: $suggestion, categoryType: $categoryType)';
}


}

/// @nodoc
abstract mixin class _$BookingSuggestionDtoCopyWith<$Res> implements $BookingSuggestionDtoCopyWith<$Res> {
  factory _$BookingSuggestionDtoCopyWith(_BookingSuggestionDto value, $Res Function(_BookingSuggestionDto) _then) = __$BookingSuggestionDtoCopyWithImpl;
@override @useResult
$Res call({
 String suggestion,@JsonKey(name: 'category_type')@CategoryTypeSerializer() CategoryType categoryType
});




}
/// @nodoc
class __$BookingSuggestionDtoCopyWithImpl<$Res>
    implements _$BookingSuggestionDtoCopyWith<$Res> {
  __$BookingSuggestionDtoCopyWithImpl(this._self, this._then);

  final _BookingSuggestionDto _self;
  final $Res Function(_BookingSuggestionDto) _then;

/// Create a copy of BookingSuggestionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? suggestion = null,Object? categoryType = null,}) {
  return _then(_BookingSuggestionDto(
suggestion: null == suggestion ? _self.suggestion : suggestion // ignore: cast_nullable_to_non_nullable
as String,categoryType: null == categoryType ? _self.categoryType : categoryType // ignore: cast_nullable_to_non_nullable
as CategoryType,
  ));
}


}

// dart format on
