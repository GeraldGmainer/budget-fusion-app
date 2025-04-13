// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_view_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionViewData {
  Currency get currency => throw _privateConstructorUsedError;
  BudgetDateRange get dateRange => throw _privateConstructorUsedError;
  List<TransactionGroup> get transactionGroups =>
      throw _privateConstructorUsedError;

  /// Create a copy of TransactionViewData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionViewDataCopyWith<TransactionViewData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionViewDataCopyWith<$Res> {
  factory $TransactionViewDataCopyWith(
          TransactionViewData value, $Res Function(TransactionViewData) then) =
      _$TransactionViewDataCopyWithImpl<$Res, TransactionViewData>;
  @useResult
  $Res call(
      {Currency currency,
      BudgetDateRange dateRange,
      List<TransactionGroup> transactionGroups});

  $CurrencyCopyWith<$Res> get currency;
  $BudgetDateRangeCopyWith<$Res> get dateRange;
}

/// @nodoc
class _$TransactionViewDataCopyWithImpl<$Res, $Val extends TransactionViewData>
    implements $TransactionViewDataCopyWith<$Res> {
  _$TransactionViewDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionViewData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? dateRange = null,
    Object? transactionGroups = null,
  }) {
    return _then(_value.copyWith(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      dateRange: null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as BudgetDateRange,
      transactionGroups: null == transactionGroups
          ? _value.transactionGroups
          : transactionGroups // ignore: cast_nullable_to_non_nullable
              as List<TransactionGroup>,
    ) as $Val);
  }

  /// Create a copy of TransactionViewData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get currency {
    return $CurrencyCopyWith<$Res>(_value.currency, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }

  /// Create a copy of TransactionViewData
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
abstract class _$$TransactionViewDataImplCopyWith<$Res>
    implements $TransactionViewDataCopyWith<$Res> {
  factory _$$TransactionViewDataImplCopyWith(_$TransactionViewDataImpl value,
          $Res Function(_$TransactionViewDataImpl) then) =
      __$$TransactionViewDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Currency currency,
      BudgetDateRange dateRange,
      List<TransactionGroup> transactionGroups});

  @override
  $CurrencyCopyWith<$Res> get currency;
  @override
  $BudgetDateRangeCopyWith<$Res> get dateRange;
}

/// @nodoc
class __$$TransactionViewDataImplCopyWithImpl<$Res>
    extends _$TransactionViewDataCopyWithImpl<$Res, _$TransactionViewDataImpl>
    implements _$$TransactionViewDataImplCopyWith<$Res> {
  __$$TransactionViewDataImplCopyWithImpl(_$TransactionViewDataImpl _value,
      $Res Function(_$TransactionViewDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionViewData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? dateRange = null,
    Object? transactionGroups = null,
  }) {
    return _then(_$TransactionViewDataImpl(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      dateRange: null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as BudgetDateRange,
      transactionGroups: null == transactionGroups
          ? _value._transactionGroups
          : transactionGroups // ignore: cast_nullable_to_non_nullable
              as List<TransactionGroup>,
    ));
  }
}

/// @nodoc

class _$TransactionViewDataImpl extends _TransactionViewData {
  const _$TransactionViewDataImpl(
      {required this.currency,
      required this.dateRange,
      required final List<TransactionGroup> transactionGroups})
      : _transactionGroups = transactionGroups,
        super._();

  @override
  final Currency currency;
  @override
  final BudgetDateRange dateRange;
  final List<TransactionGroup> _transactionGroups;
  @override
  List<TransactionGroup> get transactionGroups {
    if (_transactionGroups is EqualUnmodifiableListView)
      return _transactionGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionGroups);
  }

  @override
  String toString() {
    return 'TransactionViewData(currency: $currency, dateRange: $dateRange, transactionGroups: $transactionGroups)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionViewDataImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange) &&
            const DeepCollectionEquality()
                .equals(other._transactionGroups, _transactionGroups));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currency, dateRange,
      const DeepCollectionEquality().hash(_transactionGroups));

  /// Create a copy of TransactionViewData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionViewDataImplCopyWith<_$TransactionViewDataImpl> get copyWith =>
      __$$TransactionViewDataImplCopyWithImpl<_$TransactionViewDataImpl>(
          this, _$identity);
}

abstract class _TransactionViewData extends TransactionViewData {
  const factory _TransactionViewData(
          {required final Currency currency,
          required final BudgetDateRange dateRange,
          required final List<TransactionGroup> transactionGroups}) =
      _$TransactionViewDataImpl;
  const _TransactionViewData._() : super._();

  @override
  Currency get currency;
  @override
  BudgetDateRange get dateRange;
  @override
  List<TransactionGroup> get transactionGroups;

  /// Create a copy of TransactionViewData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionViewDataImplCopyWith<_$TransactionViewDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
