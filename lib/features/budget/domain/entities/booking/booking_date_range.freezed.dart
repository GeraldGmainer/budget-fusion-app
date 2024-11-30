// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_date_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookingDateRange {
  PeriodMode get period => throw _privateConstructorUsedError;
  DateTime get from => throw _privateConstructorUsedError;
  DateTime get to => throw _privateConstructorUsedError;

  /// Create a copy of BookingDateRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingDateRangeCopyWith<BookingDateRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingDateRangeCopyWith<$Res> {
  factory $BookingDateRangeCopyWith(
          BookingDateRange value, $Res Function(BookingDateRange) then) =
      _$BookingDateRangeCopyWithImpl<$Res, BookingDateRange>;
  @useResult
  $Res call({PeriodMode period, DateTime from, DateTime to});
}

/// @nodoc
class _$BookingDateRangeCopyWithImpl<$Res, $Val extends BookingDateRange>
    implements $BookingDateRangeCopyWith<$Res> {
  _$BookingDateRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingDateRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? from = null,
    Object? to = null,
  }) {
    return _then(_value.copyWith(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as PeriodMode,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingDateRangeImplCopyWith<$Res>
    implements $BookingDateRangeCopyWith<$Res> {
  factory _$$BookingDateRangeImplCopyWith(_$BookingDateRangeImpl value,
          $Res Function(_$BookingDateRangeImpl) then) =
      __$$BookingDateRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PeriodMode period, DateTime from, DateTime to});
}

/// @nodoc
class __$$BookingDateRangeImplCopyWithImpl<$Res>
    extends _$BookingDateRangeCopyWithImpl<$Res, _$BookingDateRangeImpl>
    implements _$$BookingDateRangeImplCopyWith<$Res> {
  __$$BookingDateRangeImplCopyWithImpl(_$BookingDateRangeImpl _value,
      $Res Function(_$BookingDateRangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingDateRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? from = null,
    Object? to = null,
  }) {
    return _then(_$BookingDateRangeImpl(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as PeriodMode,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$BookingDateRangeImpl extends _BookingDateRange {
  const _$BookingDateRangeImpl(
      {required this.period, required this.from, required this.to})
      : assert(period == PeriodMode.all || (from != null && to != null)),
        super._();

  @override
  final PeriodMode period;
  @override
  final DateTime from;
  @override
  final DateTime to;

  @override
  String toString() {
    return 'BookingDateRange(period: $period, from: $from, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingDateRangeImpl &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @override
  int get hashCode => Object.hash(runtimeType, period, from, to);

  /// Create a copy of BookingDateRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingDateRangeImplCopyWith<_$BookingDateRangeImpl> get copyWith =>
      __$$BookingDateRangeImplCopyWithImpl<_$BookingDateRangeImpl>(
          this, _$identity);
}

abstract class _BookingDateRange extends BookingDateRange {
  const factory _BookingDateRange(
      {required final PeriodMode period,
      required final DateTime from,
      required final DateTime to}) = _$BookingDateRangeImpl;
  const _BookingDateRange._() : super._();

  @override
  PeriodMode get period;
  @override
  DateTime get from;
  @override
  DateTime get to;

  /// Create a copy of BookingDateRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingDateRangeImplCopyWith<_$BookingDateRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
