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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BudgetBookFilter {
  TransactionType? get transaction => throw _privateConstructorUsedError;
  set transaction(TransactionType? value) => throw _privateConstructorUsedError;
  PeriodMode get period => throw _privateConstructorUsedError;
  set period(PeriodMode value) => throw _privateConstructorUsedError;
  Account? get account => throw _privateConstructorUsedError;
  set account(Account? value) => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  set description(String? value) => throw _privateConstructorUsedError;

  /// Create a copy of BudgetBookFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetBookFilterCopyWith<BudgetBookFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetBookFilterCopyWith<$Res> {
  factory $BudgetBookFilterCopyWith(
    BudgetBookFilter value,
    $Res Function(BudgetBookFilter) then,
  ) = _$BudgetBookFilterCopyWithImpl<$Res, BudgetBookFilter>;
  @useResult
  $Res call({
    TransactionType? transaction,
    PeriodMode period,
    Account? account,
    String? description,
  });

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
    Object? transaction = freezed,
    Object? period = null,
    Object? account = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _value.copyWith(
            transaction:
                freezed == transaction
                    ? _value.transaction
                    : transaction // ignore: cast_nullable_to_non_nullable
                        as TransactionType?,
            period:
                null == period
                    ? _value.period
                    : period // ignore: cast_nullable_to_non_nullable
                        as PeriodMode,
            account:
                freezed == account
                    ? _value.account
                    : account // ignore: cast_nullable_to_non_nullable
                        as Account?,
            description:
                freezed == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
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
  factory _$$BudgetBookFilterImplCopyWith(
    _$BudgetBookFilterImpl value,
    $Res Function(_$BudgetBookFilterImpl) then,
  ) = __$$BudgetBookFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TransactionType? transaction,
    PeriodMode period,
    Account? account,
    String? description,
  });

  @override
  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class __$$BudgetBookFilterImplCopyWithImpl<$Res>
    extends _$BudgetBookFilterCopyWithImpl<$Res, _$BudgetBookFilterImpl>
    implements _$$BudgetBookFilterImplCopyWith<$Res> {
  __$$BudgetBookFilterImplCopyWithImpl(
    _$BudgetBookFilterImpl _value,
    $Res Function(_$BudgetBookFilterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BudgetBookFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = freezed,
    Object? period = null,
    Object? account = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _$BudgetBookFilterImpl(
        transaction:
            freezed == transaction
                ? _value.transaction
                : transaction // ignore: cast_nullable_to_non_nullable
                    as TransactionType?,
        period:
            null == period
                ? _value.period
                : period // ignore: cast_nullable_to_non_nullable
                    as PeriodMode,
        account:
            freezed == account
                ? _value.account
                : account // ignore: cast_nullable_to_non_nullable
                    as Account?,
        description:
            freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$BudgetBookFilterImpl extends _BudgetBookFilter {
  _$BudgetBookFilterImpl({
    this.transaction,
    required this.period,
    this.account,
    this.description,
  }) : super._();

  @override
  TransactionType? transaction;
  @override
  PeriodMode period;
  @override
  Account? account;
  @override
  String? description;

  /// Create a copy of BudgetBookFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetBookFilterImplCopyWith<_$BudgetBookFilterImpl> get copyWith =>
      __$$BudgetBookFilterImplCopyWithImpl<_$BudgetBookFilterImpl>(
        this,
        _$identity,
      );
}

abstract class _BudgetBookFilter extends BudgetBookFilter {
  factory _BudgetBookFilter({
    TransactionType? transaction,
    required PeriodMode period,
    Account? account,
    String? description,
  }) = _$BudgetBookFilterImpl;
  _BudgetBookFilter._() : super._();

  @override
  TransactionType? get transaction;
  set transaction(TransactionType? value);
  @override
  PeriodMode get period;
  set period(PeriodMode value);
  @override
  Account? get account;
  set account(Account? value);
  @override
  String? get description;
  set description(String? value);

  /// Create a copy of BudgetBookFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetBookFilterImplCopyWith<_$BudgetBookFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
