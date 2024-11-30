// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_book_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BudgetBookFilter {
  Account? get account => throw _privateConstructorUsedError;
  TransactionType get transaction => throw _privateConstructorUsedError;
  PeriodMode get period => throw _privateConstructorUsedError;

  /// Create a copy of BudgetBookFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetBookFilterCopyWith<BudgetBookFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetBookFilterCopyWith<$Res> {
  factory $BudgetBookFilterCopyWith(
          BudgetBookFilter value, $Res Function(BudgetBookFilter) then) =
      _$BudgetBookFilterCopyWithImpl<$Res, BudgetBookFilter>;
  @useResult
  $Res call({Account? account, TransactionType transaction, PeriodMode period});

  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class _$BudgetBookFilterCopyWithImpl<$Res, $Val extends BudgetBookFilter>
    implements $BudgetBookFilterCopyWith<$Res> {
  _$BudgetBookFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetBookFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = freezed,
    Object? transaction = null,
    Object? period = null,
  }) {
    return _then(_value.copyWith(
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as PeriodMode,
    ) as $Val);
  }

  /// Create a copy of BudgetBookFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res>? get account {
    if (_value.account == null) {
      return null;
    }

    return $AccountCopyWith<$Res>(_value.account!, (value) {
      return _then(_value.copyWith(account: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BudgetBookFilterImplCopyWith<$Res>
    implements $BudgetBookFilterCopyWith<$Res> {
  factory _$$BudgetBookFilterImplCopyWith(_$BudgetBookFilterImpl value,
          $Res Function(_$BudgetBookFilterImpl) then) =
      __$$BudgetBookFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Account? account, TransactionType transaction, PeriodMode period});

  @override
  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class __$$BudgetBookFilterImplCopyWithImpl<$Res>
    extends _$BudgetBookFilterCopyWithImpl<$Res, _$BudgetBookFilterImpl>
    implements _$$BudgetBookFilterImplCopyWith<$Res> {
  __$$BudgetBookFilterImplCopyWithImpl(_$BudgetBookFilterImpl _value,
      $Res Function(_$BudgetBookFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetBookFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = freezed,
    Object? transaction = null,
    Object? period = null,
  }) {
    return _then(_$BudgetBookFilterImpl(
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as PeriodMode,
    ));
  }
}

/// @nodoc

class _$BudgetBookFilterImpl extends _BudgetBookFilter {
  const _$BudgetBookFilterImpl(
      {this.account, required this.transaction, required this.period})
      : super._();

  @override
  final Account? account;
  @override
  final TransactionType transaction;
  @override
  final PeriodMode period;

  @override
  String toString() {
    return 'BudgetBookFilter(account: $account, transaction: $transaction, period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetBookFilterImpl &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.period, period) || other.period == period));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account, transaction, period);

  /// Create a copy of BudgetBookFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetBookFilterImplCopyWith<_$BudgetBookFilterImpl> get copyWith =>
      __$$BudgetBookFilterImplCopyWithImpl<_$BudgetBookFilterImpl>(
          this, _$identity);
}

abstract class _BudgetBookFilter extends BudgetBookFilter {
  const factory _BudgetBookFilter(
      {final Account? account,
      required final TransactionType transaction,
      required final PeriodMode period}) = _$BudgetBookFilterImpl;
  const _BudgetBookFilter._() : super._();

  @override
  Account? get account;
  @override
  TransactionType get transaction;
  @override
  PeriodMode get period;

  /// Create a copy of BudgetBookFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetBookFilterImplCopyWith<_$BudgetBookFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
