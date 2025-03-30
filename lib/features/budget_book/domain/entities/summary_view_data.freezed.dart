// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary_view_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SummaryViewData {
  Currency get currency => throw _privateConstructorUsedError;
  CategoryType get categoryType => throw _privateConstructorUsedError;
  BudgetDateRange get dateRange => throw _privateConstructorUsedError;
  List<PieData> get pieData => throw _privateConstructorUsedError;
  List<CategoryViewSummary> get summaries => throw _privateConstructorUsedError;
  Decimal get income => throw _privateConstructorUsedError;
  Decimal get outcome => throw _privateConstructorUsedError;

  /// Create a copy of SummaryViewData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SummaryViewDataCopyWith<SummaryViewData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryViewDataCopyWith<$Res> {
  factory $SummaryViewDataCopyWith(
          SummaryViewData value, $Res Function(SummaryViewData) then) =
      _$SummaryViewDataCopyWithImpl<$Res, SummaryViewData>;
  @useResult
  $Res call(
      {Currency currency,
      CategoryType categoryType,
      BudgetDateRange dateRange,
      List<PieData> pieData,
      List<CategoryViewSummary> summaries,
      Decimal income,
      Decimal outcome});

  $CurrencyCopyWith<$Res> get currency;
  $BudgetDateRangeCopyWith<$Res> get dateRange;
}

/// @nodoc
class _$SummaryViewDataCopyWithImpl<$Res, $Val extends SummaryViewData>
    implements $SummaryViewDataCopyWith<$Res> {
  _$SummaryViewDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SummaryViewData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? categoryType = null,
    Object? dateRange = null,
    Object? pieData = null,
    Object? summaries = null,
    Object? income = null,
    Object? outcome = null,
  }) {
    return _then(_value.copyWith(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as CategoryType,
      dateRange: null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as BudgetDateRange,
      pieData: null == pieData
          ? _value.pieData
          : pieData // ignore: cast_nullable_to_non_nullable
              as List<PieData>,
      summaries: null == summaries
          ? _value.summaries
          : summaries // ignore: cast_nullable_to_non_nullable
              as List<CategoryViewSummary>,
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as Decimal,
      outcome: null == outcome
          ? _value.outcome
          : outcome // ignore: cast_nullable_to_non_nullable
              as Decimal,
    ) as $Val);
  }

  /// Create a copy of SummaryViewData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get currency {
    return $CurrencyCopyWith<$Res>(_value.currency, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }

  /// Create a copy of SummaryViewData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BudgetDateRangeCopyWith<$Res> get dateRange {
    return $BudgetDateRangeCopyWith<$Res>(_value.dateRange, (value) {
      return _then(_value.copyWith(dateRange: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SummaryViewDataImplCopyWith<$Res>
    implements $SummaryViewDataCopyWith<$Res> {
  factory _$$SummaryViewDataImplCopyWith(_$SummaryViewDataImpl value,
          $Res Function(_$SummaryViewDataImpl) then) =
      __$$SummaryViewDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Currency currency,
      CategoryType categoryType,
      BudgetDateRange dateRange,
      List<PieData> pieData,
      List<CategoryViewSummary> summaries,
      Decimal income,
      Decimal outcome});

  @override
  $CurrencyCopyWith<$Res> get currency;
  @override
  $BudgetDateRangeCopyWith<$Res> get dateRange;
}

/// @nodoc
class __$$SummaryViewDataImplCopyWithImpl<$Res>
    extends _$SummaryViewDataCopyWithImpl<$Res, _$SummaryViewDataImpl>
    implements _$$SummaryViewDataImplCopyWith<$Res> {
  __$$SummaryViewDataImplCopyWithImpl(
      _$SummaryViewDataImpl _value, $Res Function(_$SummaryViewDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SummaryViewData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? categoryType = null,
    Object? dateRange = null,
    Object? pieData = null,
    Object? summaries = null,
    Object? income = null,
    Object? outcome = null,
  }) {
    return _then(_$SummaryViewDataImpl(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as CategoryType,
      dateRange: null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as BudgetDateRange,
      pieData: null == pieData
          ? _value._pieData
          : pieData // ignore: cast_nullable_to_non_nullable
              as List<PieData>,
      summaries: null == summaries
          ? _value._summaries
          : summaries // ignore: cast_nullable_to_non_nullable
              as List<CategoryViewSummary>,
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as Decimal,
      outcome: null == outcome
          ? _value.outcome
          : outcome // ignore: cast_nullable_to_non_nullable
              as Decimal,
    ));
  }
}

/// @nodoc

class _$SummaryViewDataImpl extends _SummaryViewData {
  const _$SummaryViewDataImpl(
      {required this.currency,
      required this.categoryType,
      required this.dateRange,
      required final List<PieData> pieData,
      required final List<CategoryViewSummary> summaries,
      required this.income,
      required this.outcome})
      : _pieData = pieData,
        _summaries = summaries,
        super._();

  @override
  final Currency currency;
  @override
  final CategoryType categoryType;
  @override
  final BudgetDateRange dateRange;
  final List<PieData> _pieData;
  @override
  List<PieData> get pieData {
    if (_pieData is EqualUnmodifiableListView) return _pieData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pieData);
  }

  final List<CategoryViewSummary> _summaries;
  @override
  List<CategoryViewSummary> get summaries {
    if (_summaries is EqualUnmodifiableListView) return _summaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_summaries);
  }

  @override
  final Decimal income;
  @override
  final Decimal outcome;

  @override
  String toString() {
    return 'SummaryViewData(currency: $currency, categoryType: $categoryType, dateRange: $dateRange, pieData: $pieData, summaries: $summaries, income: $income, outcome: $outcome)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryViewDataImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange) &&
            const DeepCollectionEquality().equals(other._pieData, _pieData) &&
            const DeepCollectionEquality()
                .equals(other._summaries, _summaries) &&
            (identical(other.income, income) || other.income == income) &&
            (identical(other.outcome, outcome) || other.outcome == outcome));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currency,
      categoryType,
      dateRange,
      const DeepCollectionEquality().hash(_pieData),
      const DeepCollectionEquality().hash(_summaries),
      income,
      outcome);

  /// Create a copy of SummaryViewData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryViewDataImplCopyWith<_$SummaryViewDataImpl> get copyWith =>
      __$$SummaryViewDataImplCopyWithImpl<_$SummaryViewDataImpl>(
          this, _$identity);
}

abstract class _SummaryViewData extends SummaryViewData {
  const factory _SummaryViewData(
      {required final Currency currency,
      required final CategoryType categoryType,
      required final BudgetDateRange dateRange,
      required final List<PieData> pieData,
      required final List<CategoryViewSummary> summaries,
      required final Decimal income,
      required final Decimal outcome}) = _$SummaryViewDataImpl;
  const _SummaryViewData._() : super._();

  @override
  Currency get currency;
  @override
  CategoryType get categoryType;
  @override
  BudgetDateRange get dateRange;
  @override
  List<PieData> get pieData;
  @override
  List<CategoryViewSummary> get summaries;
  @override
  Decimal get income;
  @override
  Decimal get outcome;

  /// Create a copy of SummaryViewData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SummaryViewDataImplCopyWith<_$SummaryViewDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
