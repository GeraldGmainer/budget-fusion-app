// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pie_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PieData {

 String get xData; num get yData; String? get text; String get iconName; String get iconColor; bool get hideIcon;
/// Create a copy of PieData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PieDataCopyWith<PieData> get copyWith => _$PieDataCopyWithImpl<PieData>(this as PieData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PieData&&(identical(other.xData, xData) || other.xData == xData)&&(identical(other.yData, yData) || other.yData == yData)&&(identical(other.text, text) || other.text == text)&&(identical(other.iconName, iconName) || other.iconName == iconName)&&(identical(other.iconColor, iconColor) || other.iconColor == iconColor)&&(identical(other.hideIcon, hideIcon) || other.hideIcon == hideIcon));
}


@override
int get hashCode => Object.hash(runtimeType,xData,yData,text,iconName,iconColor,hideIcon);

@override
String toString() {
  return 'PieData(xData: $xData, yData: $yData, text: $text, iconName: $iconName, iconColor: $iconColor, hideIcon: $hideIcon)';
}


}

/// @nodoc
abstract mixin class $PieDataCopyWith<$Res>  {
  factory $PieDataCopyWith(PieData value, $Res Function(PieData) _then) = _$PieDataCopyWithImpl;
@useResult
$Res call({
 String xData, num yData, String? text, String iconName, String iconColor, bool hideIcon
});




}
/// @nodoc
class _$PieDataCopyWithImpl<$Res>
    implements $PieDataCopyWith<$Res> {
  _$PieDataCopyWithImpl(this._self, this._then);

  final PieData _self;
  final $Res Function(PieData) _then;

/// Create a copy of PieData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? xData = null,Object? yData = null,Object? text = freezed,Object? iconName = null,Object? iconColor = null,Object? hideIcon = null,}) {
  return _then(_self.copyWith(
xData: null == xData ? _self.xData : xData // ignore: cast_nullable_to_non_nullable
as String,yData: null == yData ? _self.yData : yData // ignore: cast_nullable_to_non_nullable
as num,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,iconName: null == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String,iconColor: null == iconColor ? _self.iconColor : iconColor // ignore: cast_nullable_to_non_nullable
as String,hideIcon: null == hideIcon ? _self.hideIcon : hideIcon // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PieData].
extension PieDataPatterns on PieData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PieData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PieData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PieData value)  $default,){
final _that = this;
switch (_that) {
case _PieData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PieData value)?  $default,){
final _that = this;
switch (_that) {
case _PieData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String xData,  num yData,  String? text,  String iconName,  String iconColor,  bool hideIcon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PieData() when $default != null:
return $default(_that.xData,_that.yData,_that.text,_that.iconName,_that.iconColor,_that.hideIcon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String xData,  num yData,  String? text,  String iconName,  String iconColor,  bool hideIcon)  $default,) {final _that = this;
switch (_that) {
case _PieData():
return $default(_that.xData,_that.yData,_that.text,_that.iconName,_that.iconColor,_that.hideIcon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String xData,  num yData,  String? text,  String iconName,  String iconColor,  bool hideIcon)?  $default,) {final _that = this;
switch (_that) {
case _PieData() when $default != null:
return $default(_that.xData,_that.yData,_that.text,_that.iconName,_that.iconColor,_that.hideIcon);case _:
  return null;

}
}

}

/// @nodoc


class _PieData extends PieData {
  const _PieData({required this.xData, required this.yData, this.text, required this.iconName, required this.iconColor, required this.hideIcon}): super._();
  

@override final  String xData;
@override final  num yData;
@override final  String? text;
@override final  String iconName;
@override final  String iconColor;
@override final  bool hideIcon;

/// Create a copy of PieData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PieDataCopyWith<_PieData> get copyWith => __$PieDataCopyWithImpl<_PieData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PieData&&(identical(other.xData, xData) || other.xData == xData)&&(identical(other.yData, yData) || other.yData == yData)&&(identical(other.text, text) || other.text == text)&&(identical(other.iconName, iconName) || other.iconName == iconName)&&(identical(other.iconColor, iconColor) || other.iconColor == iconColor)&&(identical(other.hideIcon, hideIcon) || other.hideIcon == hideIcon));
}


@override
int get hashCode => Object.hash(runtimeType,xData,yData,text,iconName,iconColor,hideIcon);

@override
String toString() {
  return 'PieData(xData: $xData, yData: $yData, text: $text, iconName: $iconName, iconColor: $iconColor, hideIcon: $hideIcon)';
}


}

/// @nodoc
abstract mixin class _$PieDataCopyWith<$Res> implements $PieDataCopyWith<$Res> {
  factory _$PieDataCopyWith(_PieData value, $Res Function(_PieData) _then) = __$PieDataCopyWithImpl;
@override @useResult
$Res call({
 String xData, num yData, String? text, String iconName, String iconColor, bool hideIcon
});




}
/// @nodoc
class __$PieDataCopyWithImpl<$Res>
    implements _$PieDataCopyWith<$Res> {
  __$PieDataCopyWithImpl(this._self, this._then);

  final _PieData _self;
  final $Res Function(_PieData) _then;

/// Create a copy of PieData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? xData = null,Object? yData = null,Object? text = freezed,Object? iconName = null,Object? iconColor = null,Object? hideIcon = null,}) {
  return _then(_PieData(
xData: null == xData ? _self.xData : xData // ignore: cast_nullable_to_non_nullable
as String,yData: null == yData ? _self.yData : yData // ignore: cast_nullable_to_non_nullable
as num,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,iconName: null == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String,iconColor: null == iconColor ? _self.iconColor : iconColor // ignore: cast_nullable_to_non_nullable
as String,hideIcon: null == hideIcon ? _self.hideIcon : hideIcon // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
