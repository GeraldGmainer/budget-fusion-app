// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_page_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BudgetPageData {
  BudgetDateRange get dateRange => throw _privateConstructorUsedError;
  Money get income => throw _privateConstructorUsedError;
  Money get outcome => throw _privateConstructorUsedError;
  List<Booking> get bookings => throw _privateConstructorUsedError;

  /// Create a copy of BudgetPageData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetPageDataCopyWith<BudgetPageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetPageDataCopyWith<$Res> {
  factory $BudgetPageDataCopyWith(
    BudgetPageData value,
    $Res Function(BudgetPageData) then,
  ) = _$BudgetPageDataCopyWithImpl<$Res, BudgetPageData>;
  @useResult
  $Res call({
    BudgetDateRange dateRange,
    Money income,
    Money outcome,
    List<Booking> bookings,
  });

  $BudgetDateRangeCopyWith<$Res> get dateRange;
  $MoneyCopyWith<$Res> get income;
  $MoneyCopyWith<$Res> get outcome;
}

/// @nodoc
class _$BudgetPageDataCopyWithImpl<$Res, $Val extends BudgetPageData>
    implements $BudgetPageDataCopyWith<$Res> {
  _$BudgetPageDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetPageData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateRange = null,
    Object? income = null,
    Object? outcome = null,
    Object? bookings = null,
  }) {
    return _then(
      _value.copyWith(
            dateRange:
                null == dateRange
                    ? _value.dateRange
                    : dateRange // ignore: cast_nullable_to_non_nullable
                        as BudgetDateRange,
            income:
                null == income
                    ? _value.income
                    : income // ignore: cast_nullable_to_non_nullable
                        as Money,
            outcome:
                null == outcome
                    ? _value.outcome
                    : outcome // ignore: cast_nullable_to_non_nullable
                        as Money,
            bookings:
                null == bookings
                    ? _value.bookings
                    : bookings // ignore: cast_nullable_to_non_nullable
                        as List<Booking>,
          )
          as $Val,
    );
  }

  /// Create a copy of BudgetPageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BudgetDateRangeCopyWith<$Res> get dateRange {
    return $BudgetDateRangeCopyWith<$Res>(_value.dateRange, (value) {
      return _then(_value.copyWith(dateRange: value) as $Val);
    });
  }

  /// Create a copy of BudgetPageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MoneyCopyWith<$Res> get income {
    return $MoneyCopyWith<$Res>(_value.income, (value) {
      return _then(_value.copyWith(income: value) as $Val);
    });
  }

  /// Create a copy of BudgetPageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MoneyCopyWith<$Res> get outcome {
    return $MoneyCopyWith<$Res>(_value.outcome, (value) {
      return _then(_value.copyWith(outcome: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BudgetPageDataImplCopyWith<$Res>
    implements $BudgetPageDataCopyWith<$Res> {
  factory _$$BudgetPageDataImplCopyWith(
    _$BudgetPageDataImpl value,
    $Res Function(_$BudgetPageDataImpl) then,
  ) = __$$BudgetPageDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    BudgetDateRange dateRange,
    Money income,
    Money outcome,
    List<Booking> bookings,
  });

  @override
  $BudgetDateRangeCopyWith<$Res> get dateRange;
  @override
  $MoneyCopyWith<$Res> get income;
  @override
  $MoneyCopyWith<$Res> get outcome;
}

/// @nodoc
class __$$BudgetPageDataImplCopyWithImpl<$Res>
    extends _$BudgetPageDataCopyWithImpl<$Res, _$BudgetPageDataImpl>
    implements _$$BudgetPageDataImplCopyWith<$Res> {
  __$$BudgetPageDataImplCopyWithImpl(
    _$BudgetPageDataImpl _value,
    $Res Function(_$BudgetPageDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BudgetPageData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateRange = null,
    Object? income = null,
    Object? outcome = null,
    Object? bookings = null,
  }) {
    return _then(
      _$BudgetPageDataImpl(
        dateRange:
            null == dateRange
                ? _value.dateRange
                : dateRange // ignore: cast_nullable_to_non_nullable
                    as BudgetDateRange,
        income:
            null == income
                ? _value.income
                : income // ignore: cast_nullable_to_non_nullable
                    as Money,
        outcome:
            null == outcome
                ? _value.outcome
                : outcome // ignore: cast_nullable_to_non_nullable
                    as Money,
        bookings:
            null == bookings
                ? _value._bookings
                : bookings // ignore: cast_nullable_to_non_nullable
                    as List<Booking>,
      ),
    );
  }
}

/// @nodoc

class _$BudgetPageDataImpl extends _BudgetPageData {
  const _$BudgetPageDataImpl({
    required this.dateRange,
    required this.income,
    required this.outcome,
    final List<Booking> bookings = const [],
  }) : _bookings = bookings,
       super._();

  @override
  final BudgetDateRange dateRange;
  @override
  final Money income;
  @override
  final Money outcome;
  final List<Booking> _bookings;
  @override
  @JsonKey()
  List<Booking> get bookings {
    if (_bookings is EqualUnmodifiableListView) return _bookings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookings);
  }

  @override
  String toString() {
    return 'BudgetPageData(dateRange: $dateRange, income: $income, outcome: $outcome, bookings: $bookings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetPageDataImpl &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange) &&
            (identical(other.income, income) || other.income == income) &&
            (identical(other.outcome, outcome) || other.outcome == outcome) &&
            const DeepCollectionEquality().equals(other._bookings, _bookings));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    dateRange,
    income,
    outcome,
    const DeepCollectionEquality().hash(_bookings),
  );

  /// Create a copy of BudgetPageData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetPageDataImplCopyWith<_$BudgetPageDataImpl> get copyWith =>
      __$$BudgetPageDataImplCopyWithImpl<_$BudgetPageDataImpl>(
        this,
        _$identity,
      );
}

abstract class _BudgetPageData extends BudgetPageData {
  const factory _BudgetPageData({
    required final BudgetDateRange dateRange,
    required final Money income,
    required final Money outcome,
    final List<Booking> bookings,
  }) = _$BudgetPageDataImpl;
  const _BudgetPageData._() : super._();

  @override
  BudgetDateRange get dateRange;
  @override
  Money get income;
  @override
  Money get outcome;
  @override
  List<Booking> get bookings;

  /// Create a copy of BudgetPageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetPageDataImplCopyWith<_$BudgetPageDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
