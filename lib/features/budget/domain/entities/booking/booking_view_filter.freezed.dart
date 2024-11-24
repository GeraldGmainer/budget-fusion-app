// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_view_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookingViewFilter {
  PeriodMode get period => throw _privateConstructorUsedError;
  DateTime? get dateTime => throw _privateConstructorUsedError;
  DateTime? get dateTimeFrom => throw _privateConstructorUsedError;
  DateTime? get dateTimeTo => throw _privateConstructorUsedError;

  /// Create a copy of BookingViewFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingViewFilterCopyWith<BookingViewFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingViewFilterCopyWith<$Res> {
  factory $BookingViewFilterCopyWith(
          BookingViewFilter value, $Res Function(BookingViewFilter) then) =
      _$BookingViewFilterCopyWithImpl<$Res, BookingViewFilter>;
  @useResult
  $Res call(
      {PeriodMode period,
      DateTime? dateTime,
      DateTime? dateTimeFrom,
      DateTime? dateTimeTo});
}

/// @nodoc
class _$BookingViewFilterCopyWithImpl<$Res, $Val extends BookingViewFilter>
    implements $BookingViewFilterCopyWith<$Res> {
  _$BookingViewFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingViewFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? dateTime = freezed,
    Object? dateTimeFrom = freezed,
    Object? dateTimeTo = freezed,
  }) {
    return _then(_value.copyWith(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as PeriodMode,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateTimeFrom: freezed == dateTimeFrom
          ? _value.dateTimeFrom
          : dateTimeFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateTimeTo: freezed == dateTimeTo
          ? _value.dateTimeTo
          : dateTimeTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingViewFilterImplCopyWith<$Res>
    implements $BookingViewFilterCopyWith<$Res> {
  factory _$$BookingViewFilterImplCopyWith(_$BookingViewFilterImpl value,
          $Res Function(_$BookingViewFilterImpl) then) =
      __$$BookingViewFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PeriodMode period,
      DateTime? dateTime,
      DateTime? dateTimeFrom,
      DateTime? dateTimeTo});
}

/// @nodoc
class __$$BookingViewFilterImplCopyWithImpl<$Res>
    extends _$BookingViewFilterCopyWithImpl<$Res, _$BookingViewFilterImpl>
    implements _$$BookingViewFilterImplCopyWith<$Res> {
  __$$BookingViewFilterImplCopyWithImpl(_$BookingViewFilterImpl _value,
      $Res Function(_$BookingViewFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingViewFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? dateTime = freezed,
    Object? dateTimeFrom = freezed,
    Object? dateTimeTo = freezed,
  }) {
    return _then(_$BookingViewFilterImpl(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as PeriodMode,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateTimeFrom: freezed == dateTimeFrom
          ? _value.dateTimeFrom
          : dateTimeFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateTimeTo: freezed == dateTimeTo
          ? _value.dateTimeTo
          : dateTimeTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$BookingViewFilterImpl extends _BookingViewFilter {
  const _$BookingViewFilterImpl(
      {required this.period, this.dateTime, this.dateTimeFrom, this.dateTimeTo})
      : super._();

  @override
  final PeriodMode period;
  @override
  final DateTime? dateTime;
  @override
  final DateTime? dateTimeFrom;
  @override
  final DateTime? dateTimeTo;

  @override
  String toString() {
    return 'BookingViewFilter(period: $period, dateTime: $dateTime, dateTimeFrom: $dateTimeFrom, dateTimeTo: $dateTimeTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingViewFilterImpl &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.dateTimeFrom, dateTimeFrom) ||
                other.dateTimeFrom == dateTimeFrom) &&
            (identical(other.dateTimeTo, dateTimeTo) ||
                other.dateTimeTo == dateTimeTo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, period, dateTime, dateTimeFrom, dateTimeTo);

  /// Create a copy of BookingViewFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingViewFilterImplCopyWith<_$BookingViewFilterImpl> get copyWith =>
      __$$BookingViewFilterImplCopyWithImpl<_$BookingViewFilterImpl>(
          this, _$identity);
}

abstract class _BookingViewFilter extends BookingViewFilter {
  const factory _BookingViewFilter(
      {required final PeriodMode period,
      final DateTime? dateTime,
      final DateTime? dateTimeFrom,
      final DateTime? dateTimeTo}) = _$BookingViewFilterImpl;
  const _BookingViewFilter._() : super._();

  @override
  PeriodMode get period;
  @override
  DateTime? get dateTime;
  @override
  DateTime? get dateTimeFrom;
  @override
  DateTime? get dateTimeTo;

  /// Create a copy of BookingViewFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingViewFilterImplCopyWith<_$BookingViewFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
