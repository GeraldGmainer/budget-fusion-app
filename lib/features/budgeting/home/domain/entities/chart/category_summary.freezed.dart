// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategorySummary {
  String get categoryName => throw _privateConstructorUsedError;
  String get iconName => throw _privateConstructorUsedError;
  String get iconColor => throw _privateConstructorUsedError;
  int get percentage => throw _privateConstructorUsedError;
  Decimal get value => throw _privateConstructorUsedError;

  /// Create a copy of CategorySummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategorySummaryCopyWith<CategorySummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorySummaryCopyWith<$Res> {
  factory $CategorySummaryCopyWith(
          CategorySummary value, $Res Function(CategorySummary) then) =
      _$CategorySummaryCopyWithImpl<$Res, CategorySummary>;
  @useResult
  $Res call(
      {String categoryName,
      String iconName,
      String iconColor,
      int percentage,
      Decimal value});
}

/// @nodoc
class _$CategorySummaryCopyWithImpl<$Res, $Val extends CategorySummary>
    implements $CategorySummaryCopyWith<$Res> {
  _$CategorySummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategorySummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? iconName = null,
    Object? iconColor = null,
    Object? percentage = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      iconName: null == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String,
      iconColor: null == iconColor
          ? _value.iconColor
          : iconColor // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Decimal,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategorySummaryImplCopyWith<$Res>
    implements $CategorySummaryCopyWith<$Res> {
  factory _$$CategorySummaryImplCopyWith(_$CategorySummaryImpl value,
          $Res Function(_$CategorySummaryImpl) then) =
      __$$CategorySummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String categoryName,
      String iconName,
      String iconColor,
      int percentage,
      Decimal value});
}

/// @nodoc
class __$$CategorySummaryImplCopyWithImpl<$Res>
    extends _$CategorySummaryCopyWithImpl<$Res, _$CategorySummaryImpl>
    implements _$$CategorySummaryImplCopyWith<$Res> {
  __$$CategorySummaryImplCopyWithImpl(
      _$CategorySummaryImpl _value, $Res Function(_$CategorySummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategorySummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? iconName = null,
    Object? iconColor = null,
    Object? percentage = null,
    Object? value = null,
  }) {
    return _then(_$CategorySummaryImpl(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      iconName: null == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String,
      iconColor: null == iconColor
          ? _value.iconColor
          : iconColor // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Decimal,
    ));
  }
}

/// @nodoc

class _$CategorySummaryImpl extends _CategorySummary {
  const _$CategorySummaryImpl(
      {required this.categoryName,
      required this.iconName,
      required this.iconColor,
      required this.percentage,
      required this.value})
      : super._();

  @override
  final String categoryName;
  @override
  final String iconName;
  @override
  final String iconColor;
  @override
  final int percentage;
  @override
  final Decimal value;

  @override
  String toString() {
    return 'CategorySummary(categoryName: $categoryName, iconName: $iconName, iconColor: $iconColor, percentage: $percentage, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorySummaryImpl &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.iconColor, iconColor) ||
                other.iconColor == iconColor) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, categoryName, iconName, iconColor, percentage, value);

  /// Create a copy of CategorySummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorySummaryImplCopyWith<_$CategorySummaryImpl> get copyWith =>
      __$$CategorySummaryImplCopyWithImpl<_$CategorySummaryImpl>(
          this, _$identity);
}

abstract class _CategorySummary extends CategorySummary {
  const factory _CategorySummary(
      {required final String categoryName,
      required final String iconName,
      required final String iconColor,
      required final int percentage,
      required final Decimal value}) = _$CategorySummaryImpl;
  const _CategorySummary._() : super._();

  @override
  String get categoryName;
  @override
  String get iconName;
  @override
  String get iconColor;
  @override
  int get percentage;
  @override
  Decimal get value;

  /// Create a copy of CategorySummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategorySummaryImplCopyWith<_$CategorySummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
