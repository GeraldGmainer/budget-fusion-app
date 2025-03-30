// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_view_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryViewSummary {
  String get categoryName => throw _privateConstructorUsedError;
  String? get parentCategoryName => throw _privateConstructorUsedError;
  String get iconName => throw _privateConstructorUsedError;
  String get iconColor => throw _privateConstructorUsedError;
  int get percentage => throw _privateConstructorUsedError;
  Decimal get value => throw _privateConstructorUsedError;
  List<CategoryViewSummary> get subSummaries =>
      throw _privateConstructorUsedError;

  /// Create a copy of CategoryViewSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryViewSummaryCopyWith<CategoryViewSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryViewSummaryCopyWith<$Res> {
  factory $CategoryViewSummaryCopyWith(
          CategoryViewSummary value, $Res Function(CategoryViewSummary) then) =
      _$CategoryViewSummaryCopyWithImpl<$Res, CategoryViewSummary>;
  @useResult
  $Res call(
      {String categoryName,
      String? parentCategoryName,
      String iconName,
      String iconColor,
      int percentage,
      Decimal value,
      List<CategoryViewSummary> subSummaries});
}

/// @nodoc
class _$CategoryViewSummaryCopyWithImpl<$Res, $Val extends CategoryViewSummary>
    implements $CategoryViewSummaryCopyWith<$Res> {
  _$CategoryViewSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryViewSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? parentCategoryName = freezed,
    Object? iconName = null,
    Object? iconColor = null,
    Object? percentage = null,
    Object? value = null,
    Object? subSummaries = null,
  }) {
    return _then(_value.copyWith(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      parentCategoryName: freezed == parentCategoryName
          ? _value.parentCategoryName
          : parentCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
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
      subSummaries: null == subSummaries
          ? _value.subSummaries
          : subSummaries // ignore: cast_nullable_to_non_nullable
              as List<CategoryViewSummary>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryViewSummaryImplCopyWith<$Res>
    implements $CategoryViewSummaryCopyWith<$Res> {
  factory _$$CategoryViewSummaryImplCopyWith(_$CategoryViewSummaryImpl value,
          $Res Function(_$CategoryViewSummaryImpl) then) =
      __$$CategoryViewSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String categoryName,
      String? parentCategoryName,
      String iconName,
      String iconColor,
      int percentage,
      Decimal value,
      List<CategoryViewSummary> subSummaries});
}

/// @nodoc
class __$$CategoryViewSummaryImplCopyWithImpl<$Res>
    extends _$CategoryViewSummaryCopyWithImpl<$Res, _$CategoryViewSummaryImpl>
    implements _$$CategoryViewSummaryImplCopyWith<$Res> {
  __$$CategoryViewSummaryImplCopyWithImpl(_$CategoryViewSummaryImpl _value,
      $Res Function(_$CategoryViewSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryViewSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? parentCategoryName = freezed,
    Object? iconName = null,
    Object? iconColor = null,
    Object? percentage = null,
    Object? value = null,
    Object? subSummaries = null,
  }) {
    return _then(_$CategoryViewSummaryImpl(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      parentCategoryName: freezed == parentCategoryName
          ? _value.parentCategoryName
          : parentCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
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
      subSummaries: null == subSummaries
          ? _value._subSummaries
          : subSummaries // ignore: cast_nullable_to_non_nullable
              as List<CategoryViewSummary>,
    ));
  }
}

/// @nodoc

class _$CategoryViewSummaryImpl extends _CategoryViewSummary {
  const _$CategoryViewSummaryImpl(
      {required this.categoryName,
      required this.parentCategoryName,
      required this.iconName,
      required this.iconColor,
      required this.percentage,
      required this.value,
      final List<CategoryViewSummary> subSummaries = const []})
      : _subSummaries = subSummaries,
        super._();

  @override
  final String categoryName;
  @override
  final String? parentCategoryName;
  @override
  final String iconName;
  @override
  final String iconColor;
  @override
  final int percentage;
  @override
  final Decimal value;
  final List<CategoryViewSummary> _subSummaries;
  @override
  @JsonKey()
  List<CategoryViewSummary> get subSummaries {
    if (_subSummaries is EqualUnmodifiableListView) return _subSummaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subSummaries);
  }

  @override
  String toString() {
    return 'CategoryViewSummary(categoryName: $categoryName, parentCategoryName: $parentCategoryName, iconName: $iconName, iconColor: $iconColor, percentage: $percentage, value: $value, subSummaries: $subSummaries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryViewSummaryImpl &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.parentCategoryName, parentCategoryName) ||
                other.parentCategoryName == parentCategoryName) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.iconColor, iconColor) ||
                other.iconColor == iconColor) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.value, value) || other.value == value) &&
            const DeepCollectionEquality()
                .equals(other._subSummaries, _subSummaries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      categoryName,
      parentCategoryName,
      iconName,
      iconColor,
      percentage,
      value,
      const DeepCollectionEquality().hash(_subSummaries));

  /// Create a copy of CategoryViewSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryViewSummaryImplCopyWith<_$CategoryViewSummaryImpl> get copyWith =>
      __$$CategoryViewSummaryImplCopyWithImpl<_$CategoryViewSummaryImpl>(
          this, _$identity);
}

abstract class _CategoryViewSummary extends CategoryViewSummary {
  const factory _CategoryViewSummary(
          {required final String categoryName,
          required final String? parentCategoryName,
          required final String iconName,
          required final String iconColor,
          required final int percentage,
          required final Decimal value,
          final List<CategoryViewSummary> subSummaries}) =
      _$CategoryViewSummaryImpl;
  const _CategoryViewSummary._() : super._();

  @override
  String get categoryName;
  @override
  String? get parentCategoryName;
  @override
  String get iconName;
  @override
  String get iconColor;
  @override
  int get percentage;
  @override
  Decimal get value;
  @override
  List<CategoryViewSummary> get subSummaries;

  /// Create a copy of CategoryViewSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryViewSummaryImplCopyWith<_$CategoryViewSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
