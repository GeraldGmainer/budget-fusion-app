// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_filter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookingFilterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Account? account) setAccount,
    required TResult Function(TransactionType transaction) setTransaction,
    required TResult Function(PeriodMode period) setPeriod,
    required TResult Function() resetFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Account? account)? setAccount,
    TResult? Function(TransactionType transaction)? setTransaction,
    TResult? Function(PeriodMode period)? setPeriod,
    TResult? Function()? resetFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Account? account)? setAccount,
    TResult Function(TransactionType transaction)? setTransaction,
    TResult Function(PeriodMode period)? setPeriod,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetAccount value) setAccount,
    required TResult Function(_SetTransaction value) setTransaction,
    required TResult Function(_SetPeriod value) setPeriod,
    required TResult Function(_ResetFilters value) resetFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetAccount value)? setAccount,
    TResult? Function(_SetTransaction value)? setTransaction,
    TResult? Function(_SetPeriod value)? setPeriod,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetAccount value)? setAccount,
    TResult Function(_SetTransaction value)? setTransaction,
    TResult Function(_SetPeriod value)? setPeriod,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingFilterEventCopyWith<$Res> {
  factory $BookingFilterEventCopyWith(
          BookingFilterEvent value, $Res Function(BookingFilterEvent) then) =
      _$BookingFilterEventCopyWithImpl<$Res, BookingFilterEvent>;
}

/// @nodoc
class _$BookingFilterEventCopyWithImpl<$Res, $Val extends BookingFilterEvent>
    implements $BookingFilterEventCopyWith<$Res> {
  _$BookingFilterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingFilterEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SetAccountImplCopyWith<$Res> {
  factory _$$SetAccountImplCopyWith(
          _$SetAccountImpl value, $Res Function(_$SetAccountImpl) then) =
      __$$SetAccountImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Account? account});

  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class __$$SetAccountImplCopyWithImpl<$Res>
    extends _$BookingFilterEventCopyWithImpl<$Res, _$SetAccountImpl>
    implements _$$SetAccountImplCopyWith<$Res> {
  __$$SetAccountImplCopyWithImpl(
      _$SetAccountImpl _value, $Res Function(_$SetAccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = freezed,
  }) {
    return _then(_$SetAccountImpl(
      freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
    ));
  }

  /// Create a copy of BookingFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res>? get account {
    if (_value.account == null) {
      return null;
    }

    return $AccountCopyWith<$Res>(_value.account!, (value) {
      return _then(_value.copyWith(account: value));
    });
  }
}

/// @nodoc

class _$SetAccountImpl implements _SetAccount {
  const _$SetAccountImpl(this.account);

  @override
  final Account? account;

  @override
  String toString() {
    return 'BookingFilterEvent.setAccount(account: $account)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetAccountImpl &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  /// Create a copy of BookingFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetAccountImplCopyWith<_$SetAccountImpl> get copyWith =>
      __$$SetAccountImplCopyWithImpl<_$SetAccountImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Account? account) setAccount,
    required TResult Function(TransactionType transaction) setTransaction,
    required TResult Function(PeriodMode period) setPeriod,
    required TResult Function() resetFilters,
  }) {
    return setAccount(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Account? account)? setAccount,
    TResult? Function(TransactionType transaction)? setTransaction,
    TResult? Function(PeriodMode period)? setPeriod,
    TResult? Function()? resetFilters,
  }) {
    return setAccount?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Account? account)? setAccount,
    TResult Function(TransactionType transaction)? setTransaction,
    TResult Function(PeriodMode period)? setPeriod,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) {
    if (setAccount != null) {
      return setAccount(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetAccount value) setAccount,
    required TResult Function(_SetTransaction value) setTransaction,
    required TResult Function(_SetPeriod value) setPeriod,
    required TResult Function(_ResetFilters value) resetFilters,
  }) {
    return setAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetAccount value)? setAccount,
    TResult? Function(_SetTransaction value)? setTransaction,
    TResult? Function(_SetPeriod value)? setPeriod,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) {
    return setAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetAccount value)? setAccount,
    TResult Function(_SetTransaction value)? setTransaction,
    TResult Function(_SetPeriod value)? setPeriod,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) {
    if (setAccount != null) {
      return setAccount(this);
    }
    return orElse();
  }
}

abstract class _SetAccount implements BookingFilterEvent {
  const factory _SetAccount(final Account? account) = _$SetAccountImpl;

  Account? get account;

  /// Create a copy of BookingFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetAccountImplCopyWith<_$SetAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetTransactionImplCopyWith<$Res> {
  factory _$$SetTransactionImplCopyWith(_$SetTransactionImpl value,
          $Res Function(_$SetTransactionImpl) then) =
      __$$SetTransactionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionType transaction});
}

/// @nodoc
class __$$SetTransactionImplCopyWithImpl<$Res>
    extends _$BookingFilterEventCopyWithImpl<$Res, _$SetTransactionImpl>
    implements _$$SetTransactionImplCopyWith<$Res> {
  __$$SetTransactionImplCopyWithImpl(
      _$SetTransactionImpl _value, $Res Function(_$SetTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
  }) {
    return _then(_$SetTransactionImpl(
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionType,
    ));
  }
}

/// @nodoc

class _$SetTransactionImpl implements _SetTransaction {
  const _$SetTransactionImpl(this.transaction);

  @override
  final TransactionType transaction;

  @override
  String toString() {
    return 'BookingFilterEvent.setTransaction(transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetTransactionImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction);

  /// Create a copy of BookingFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetTransactionImplCopyWith<_$SetTransactionImpl> get copyWith =>
      __$$SetTransactionImplCopyWithImpl<_$SetTransactionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Account? account) setAccount,
    required TResult Function(TransactionType transaction) setTransaction,
    required TResult Function(PeriodMode period) setPeriod,
    required TResult Function() resetFilters,
  }) {
    return setTransaction(transaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Account? account)? setAccount,
    TResult? Function(TransactionType transaction)? setTransaction,
    TResult? Function(PeriodMode period)? setPeriod,
    TResult? Function()? resetFilters,
  }) {
    return setTransaction?.call(transaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Account? account)? setAccount,
    TResult Function(TransactionType transaction)? setTransaction,
    TResult Function(PeriodMode period)? setPeriod,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) {
    if (setTransaction != null) {
      return setTransaction(transaction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetAccount value) setAccount,
    required TResult Function(_SetTransaction value) setTransaction,
    required TResult Function(_SetPeriod value) setPeriod,
    required TResult Function(_ResetFilters value) resetFilters,
  }) {
    return setTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetAccount value)? setAccount,
    TResult? Function(_SetTransaction value)? setTransaction,
    TResult? Function(_SetPeriod value)? setPeriod,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) {
    return setTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetAccount value)? setAccount,
    TResult Function(_SetTransaction value)? setTransaction,
    TResult Function(_SetPeriod value)? setPeriod,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) {
    if (setTransaction != null) {
      return setTransaction(this);
    }
    return orElse();
  }
}

abstract class _SetTransaction implements BookingFilterEvent {
  const factory _SetTransaction(final TransactionType transaction) =
      _$SetTransactionImpl;

  TransactionType get transaction;

  /// Create a copy of BookingFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetTransactionImplCopyWith<_$SetTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetPeriodImplCopyWith<$Res> {
  factory _$$SetPeriodImplCopyWith(
          _$SetPeriodImpl value, $Res Function(_$SetPeriodImpl) then) =
      __$$SetPeriodImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PeriodMode period});
}

/// @nodoc
class __$$SetPeriodImplCopyWithImpl<$Res>
    extends _$BookingFilterEventCopyWithImpl<$Res, _$SetPeriodImpl>
    implements _$$SetPeriodImplCopyWith<$Res> {
  __$$SetPeriodImplCopyWithImpl(
      _$SetPeriodImpl _value, $Res Function(_$SetPeriodImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
  }) {
    return _then(_$SetPeriodImpl(
      null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as PeriodMode,
    ));
  }
}

/// @nodoc

class _$SetPeriodImpl implements _SetPeriod {
  const _$SetPeriodImpl(this.period);

  @override
  final PeriodMode period;

  @override
  String toString() {
    return 'BookingFilterEvent.setPeriod(period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetPeriodImpl &&
            (identical(other.period, period) || other.period == period));
  }

  @override
  int get hashCode => Object.hash(runtimeType, period);

  /// Create a copy of BookingFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetPeriodImplCopyWith<_$SetPeriodImpl> get copyWith =>
      __$$SetPeriodImplCopyWithImpl<_$SetPeriodImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Account? account) setAccount,
    required TResult Function(TransactionType transaction) setTransaction,
    required TResult Function(PeriodMode period) setPeriod,
    required TResult Function() resetFilters,
  }) {
    return setPeriod(period);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Account? account)? setAccount,
    TResult? Function(TransactionType transaction)? setTransaction,
    TResult? Function(PeriodMode period)? setPeriod,
    TResult? Function()? resetFilters,
  }) {
    return setPeriod?.call(period);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Account? account)? setAccount,
    TResult Function(TransactionType transaction)? setTransaction,
    TResult Function(PeriodMode period)? setPeriod,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) {
    if (setPeriod != null) {
      return setPeriod(period);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetAccount value) setAccount,
    required TResult Function(_SetTransaction value) setTransaction,
    required TResult Function(_SetPeriod value) setPeriod,
    required TResult Function(_ResetFilters value) resetFilters,
  }) {
    return setPeriod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetAccount value)? setAccount,
    TResult? Function(_SetTransaction value)? setTransaction,
    TResult? Function(_SetPeriod value)? setPeriod,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) {
    return setPeriod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetAccount value)? setAccount,
    TResult Function(_SetTransaction value)? setTransaction,
    TResult Function(_SetPeriod value)? setPeriod,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) {
    if (setPeriod != null) {
      return setPeriod(this);
    }
    return orElse();
  }
}

abstract class _SetPeriod implements BookingFilterEvent {
  const factory _SetPeriod(final PeriodMode period) = _$SetPeriodImpl;

  PeriodMode get period;

  /// Create a copy of BookingFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetPeriodImplCopyWith<_$SetPeriodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetFiltersImplCopyWith<$Res> {
  factory _$$ResetFiltersImplCopyWith(
          _$ResetFiltersImpl value, $Res Function(_$ResetFiltersImpl) then) =
      __$$ResetFiltersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetFiltersImplCopyWithImpl<$Res>
    extends _$BookingFilterEventCopyWithImpl<$Res, _$ResetFiltersImpl>
    implements _$$ResetFiltersImplCopyWith<$Res> {
  __$$ResetFiltersImplCopyWithImpl(
      _$ResetFiltersImpl _value, $Res Function(_$ResetFiltersImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingFilterEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetFiltersImpl implements _ResetFilters {
  const _$ResetFiltersImpl();

  @override
  String toString() {
    return 'BookingFilterEvent.resetFilters()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetFiltersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Account? account) setAccount,
    required TResult Function(TransactionType transaction) setTransaction,
    required TResult Function(PeriodMode period) setPeriod,
    required TResult Function() resetFilters,
  }) {
    return resetFilters();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Account? account)? setAccount,
    TResult? Function(TransactionType transaction)? setTransaction,
    TResult? Function(PeriodMode period)? setPeriod,
    TResult? Function()? resetFilters,
  }) {
    return resetFilters?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Account? account)? setAccount,
    TResult Function(TransactionType transaction)? setTransaction,
    TResult Function(PeriodMode period)? setPeriod,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) {
    if (resetFilters != null) {
      return resetFilters();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetAccount value) setAccount,
    required TResult Function(_SetTransaction value) setTransaction,
    required TResult Function(_SetPeriod value) setPeriod,
    required TResult Function(_ResetFilters value) resetFilters,
  }) {
    return resetFilters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetAccount value)? setAccount,
    TResult? Function(_SetTransaction value)? setTransaction,
    TResult? Function(_SetPeriod value)? setPeriod,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) {
    return resetFilters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetAccount value)? setAccount,
    TResult Function(_SetTransaction value)? setTransaction,
    TResult Function(_SetPeriod value)? setPeriod,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) {
    if (resetFilters != null) {
      return resetFilters(this);
    }
    return orElse();
  }
}

abstract class _ResetFilters implements BookingFilterEvent {
  const factory _ResetFilters() = _$ResetFiltersImpl;
}

/// @nodoc
mixin _$BookingFilterState {
  Account? get selectedAccount => throw _privateConstructorUsedError;
  TransactionType get selectedTransaction => throw _privateConstructorUsedError;
  PeriodMode get selectedPeriod => throw _privateConstructorUsedError;

  /// Create a copy of BookingFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingFilterStateCopyWith<BookingFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingFilterStateCopyWith<$Res> {
  factory $BookingFilterStateCopyWith(
          BookingFilterState value, $Res Function(BookingFilterState) then) =
      _$BookingFilterStateCopyWithImpl<$Res, BookingFilterState>;
  @useResult
  $Res call(
      {Account? selectedAccount,
      TransactionType selectedTransaction,
      PeriodMode selectedPeriod});

  $AccountCopyWith<$Res>? get selectedAccount;
}

/// @nodoc
class _$BookingFilterStateCopyWithImpl<$Res, $Val extends BookingFilterState>
    implements $BookingFilterStateCopyWith<$Res> {
  _$BookingFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedAccount = freezed,
    Object? selectedTransaction = null,
    Object? selectedPeriod = null,
  }) {
    return _then(_value.copyWith(
      selectedAccount: freezed == selectedAccount
          ? _value.selectedAccount
          : selectedAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
      selectedTransaction: null == selectedTransaction
          ? _value.selectedTransaction
          : selectedTransaction // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      selectedPeriod: null == selectedPeriod
          ? _value.selectedPeriod
          : selectedPeriod // ignore: cast_nullable_to_non_nullable
              as PeriodMode,
    ) as $Val);
  }

  /// Create a copy of BookingFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res>? get selectedAccount {
    if (_value.selectedAccount == null) {
      return null;
    }

    return $AccountCopyWith<$Res>(_value.selectedAccount!, (value) {
      return _then(_value.copyWith(selectedAccount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookingFilterStateImplCopyWith<$Res>
    implements $BookingFilterStateCopyWith<$Res> {
  factory _$$BookingFilterStateImplCopyWith(_$BookingFilterStateImpl value,
          $Res Function(_$BookingFilterStateImpl) then) =
      __$$BookingFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Account? selectedAccount,
      TransactionType selectedTransaction,
      PeriodMode selectedPeriod});

  @override
  $AccountCopyWith<$Res>? get selectedAccount;
}

/// @nodoc
class __$$BookingFilterStateImplCopyWithImpl<$Res>
    extends _$BookingFilterStateCopyWithImpl<$Res, _$BookingFilterStateImpl>
    implements _$$BookingFilterStateImplCopyWith<$Res> {
  __$$BookingFilterStateImplCopyWithImpl(_$BookingFilterStateImpl _value,
      $Res Function(_$BookingFilterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedAccount = freezed,
    Object? selectedTransaction = null,
    Object? selectedPeriod = null,
  }) {
    return _then(_$BookingFilterStateImpl(
      selectedAccount: freezed == selectedAccount
          ? _value.selectedAccount
          : selectedAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
      selectedTransaction: null == selectedTransaction
          ? _value.selectedTransaction
          : selectedTransaction // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      selectedPeriod: null == selectedPeriod
          ? _value.selectedPeriod
          : selectedPeriod // ignore: cast_nullable_to_non_nullable
              as PeriodMode,
    ));
  }
}

/// @nodoc

class _$BookingFilterStateImpl implements _BookingFilterState {
  const _$BookingFilterStateImpl(
      {this.selectedAccount = null,
      this.selectedTransaction = TransactionType.outcome,
      this.selectedPeriod = PeriodMode.month});

  @override
  @JsonKey()
  final Account? selectedAccount;
  @override
  @JsonKey()
  final TransactionType selectedTransaction;
  @override
  @JsonKey()
  final PeriodMode selectedPeriod;

  @override
  String toString() {
    return 'BookingFilterState(selectedAccount: $selectedAccount, selectedTransaction: $selectedTransaction, selectedPeriod: $selectedPeriod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingFilterStateImpl &&
            (identical(other.selectedAccount, selectedAccount) ||
                other.selectedAccount == selectedAccount) &&
            (identical(other.selectedTransaction, selectedTransaction) ||
                other.selectedTransaction == selectedTransaction) &&
            (identical(other.selectedPeriod, selectedPeriod) ||
                other.selectedPeriod == selectedPeriod));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, selectedAccount, selectedTransaction, selectedPeriod);

  /// Create a copy of BookingFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingFilterStateImplCopyWith<_$BookingFilterStateImpl> get copyWith =>
      __$$BookingFilterStateImplCopyWithImpl<_$BookingFilterStateImpl>(
          this, _$identity);
}

abstract class _BookingFilterState implements BookingFilterState {
  const factory _BookingFilterState(
      {final Account? selectedAccount,
      final TransactionType selectedTransaction,
      final PeriodMode selectedPeriod}) = _$BookingFilterStateImpl;

  @override
  Account? get selectedAccount;
  @override
  TransactionType get selectedTransaction;
  @override
  PeriodMode get selectedPeriod;

  /// Create a copy of BookingFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingFilterStateImplCopyWith<_$BookingFilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
