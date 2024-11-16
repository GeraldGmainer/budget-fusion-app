// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart_view_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChartViewData {
  Currency get currency => throw _privateConstructorUsedError;
  Decimal get income => throw _privateConstructorUsedError;
  Decimal get outcome => throw _privateConstructorUsedError;
  List<PieData> get pieData => throw _privateConstructorUsedError;
  List<CategorySummary> get categorySummaries =>
      throw _privateConstructorUsedError;

  /// Create a copy of ChartViewData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChartViewDataCopyWith<ChartViewData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartViewDataCopyWith<$Res> {
  factory $ChartViewDataCopyWith(
          ChartViewData value, $Res Function(ChartViewData) then) =
      _$ChartViewDataCopyWithImpl<$Res, ChartViewData>;
  @useResult
  $Res call(
      {Currency currency,
      Decimal income,
      Decimal outcome,
      List<PieData> pieData,
      List<CategorySummary> categorySummaries});

  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class _$ChartViewDataCopyWithImpl<$Res, $Val extends ChartViewData>
    implements $ChartViewDataCopyWith<$Res> {
  _$ChartViewDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChartViewData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? income = null,
    Object? outcome = null,
    Object? pieData = null,
    Object? categorySummaries = null,
  }) {
    return _then(_value.copyWith(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as Decimal,
      outcome: null == outcome
          ? _value.outcome
          : outcome // ignore: cast_nullable_to_non_nullable
              as Decimal,
      pieData: null == pieData
          ? _value.pieData
          : pieData // ignore: cast_nullable_to_non_nullable
              as List<PieData>,
      categorySummaries: null == categorySummaries
          ? _value.categorySummaries
          : categorySummaries // ignore: cast_nullable_to_non_nullable
              as List<CategorySummary>,
    ) as $Val);
  }

  /// Create a copy of ChartViewData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get currency {
    return $CurrencyCopyWith<$Res>(_value.currency, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChartViewDataImplCopyWith<$Res>
    implements $ChartViewDataCopyWith<$Res> {
  factory _$$ChartViewDataImplCopyWith(
          _$ChartViewDataImpl value, $Res Function(_$ChartViewDataImpl) then) =
      __$$ChartViewDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Currency currency,
      Decimal income,
      Decimal outcome,
      List<PieData> pieData,
      List<CategorySummary> categorySummaries});

  @override
  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class __$$ChartViewDataImplCopyWithImpl<$Res>
    extends _$ChartViewDataCopyWithImpl<$Res, _$ChartViewDataImpl>
    implements _$$ChartViewDataImplCopyWith<$Res> {
  __$$ChartViewDataImplCopyWithImpl(
      _$ChartViewDataImpl _value, $Res Function(_$ChartViewDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChartViewData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? income = null,
    Object? outcome = null,
    Object? pieData = null,
    Object? categorySummaries = null,
  }) {
    return _then(_$ChartViewDataImpl(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as Decimal,
      outcome: null == outcome
          ? _value.outcome
          : outcome // ignore: cast_nullable_to_non_nullable
              as Decimal,
      pieData: null == pieData
          ? _value._pieData
          : pieData // ignore: cast_nullable_to_non_nullable
              as List<PieData>,
      categorySummaries: null == categorySummaries
          ? _value._categorySummaries
          : categorySummaries // ignore: cast_nullable_to_non_nullable
              as List<CategorySummary>,
    ));
  }
}

/// @nodoc

class _$ChartViewDataImpl extends _ChartViewData {
  const _$ChartViewDataImpl(
      {required this.currency,
      required this.income,
      required this.outcome,
      required final List<PieData> pieData,
      required final List<CategorySummary> categorySummaries})
      : _pieData = pieData,
        _categorySummaries = categorySummaries,
        super._();

  @override
  final Currency currency;
  @override
  final Decimal income;
  @override
  final Decimal outcome;
  final List<PieData> _pieData;
  @override
  List<PieData> get pieData {
    if (_pieData is EqualUnmodifiableListView) return _pieData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pieData);
  }

  final List<CategorySummary> _categorySummaries;
  @override
  List<CategorySummary> get categorySummaries {
    if (_categorySummaries is EqualUnmodifiableListView)
      return _categorySummaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categorySummaries);
  }

  @override
  String toString() {
    return 'ChartViewData(currency: $currency, income: $income, outcome: $outcome, pieData: $pieData, categorySummaries: $categorySummaries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartViewDataImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.income, income) || other.income == income) &&
            (identical(other.outcome, outcome) || other.outcome == outcome) &&
            const DeepCollectionEquality().equals(other._pieData, _pieData) &&
            const DeepCollectionEquality()
                .equals(other._categorySummaries, _categorySummaries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currency,
      income,
      outcome,
      const DeepCollectionEquality().hash(_pieData),
      const DeepCollectionEquality().hash(_categorySummaries));

  /// Create a copy of ChartViewData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartViewDataImplCopyWith<_$ChartViewDataImpl> get copyWith =>
      __$$ChartViewDataImplCopyWithImpl<_$ChartViewDataImpl>(this, _$identity);
}

abstract class _ChartViewData extends ChartViewData {
  const factory _ChartViewData(
          {required final Currency currency,
          required final Decimal income,
          required final Decimal outcome,
          required final List<PieData> pieData,
          required final List<CategorySummary> categorySummaries}) =
      _$ChartViewDataImpl;
  const _ChartViewData._() : super._();

  @override
  Currency get currency;
  @override
  Decimal get income;
  @override
  Decimal get outcome;
  @override
  List<PieData> get pieData;
  @override
  List<CategorySummary> get categorySummaries;

  /// Create a copy of ChartViewData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChartViewDataImplCopyWith<_$ChartViewDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
