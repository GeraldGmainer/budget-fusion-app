// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionGroup {
  DateTime get date => throw _privateConstructorUsedError;
  Currency get currency => throw _privateConstructorUsedError;
  List<Booking> get bookings => throw _privateConstructorUsedError;

  /// Create a copy of TransactionGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionGroupCopyWith<TransactionGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionGroupCopyWith<$Res> {
  factory $TransactionGroupCopyWith(
          TransactionGroup value, $Res Function(TransactionGroup) then) =
      _$TransactionGroupCopyWithImpl<$Res, TransactionGroup>;
  @useResult
  $Res call({DateTime date, Currency currency, List<Booking> bookings});

  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class _$TransactionGroupCopyWithImpl<$Res, $Val extends TransactionGroup>
    implements $TransactionGroupCopyWith<$Res> {
  _$TransactionGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? currency = null,
    Object? bookings = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      bookings: null == bookings
          ? _value.bookings
          : bookings // ignore: cast_nullable_to_non_nullable
              as List<Booking>,
    ) as $Val);
  }

  /// Create a copy of TransactionGroup
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
abstract class _$$TransactionGroupImplCopyWith<$Res>
    implements $TransactionGroupCopyWith<$Res> {
  factory _$$TransactionGroupImplCopyWith(_$TransactionGroupImpl value,
          $Res Function(_$TransactionGroupImpl) then) =
      __$$TransactionGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, Currency currency, List<Booking> bookings});

  @override
  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class __$$TransactionGroupImplCopyWithImpl<$Res>
    extends _$TransactionGroupCopyWithImpl<$Res, _$TransactionGroupImpl>
    implements _$$TransactionGroupImplCopyWith<$Res> {
  __$$TransactionGroupImplCopyWithImpl(_$TransactionGroupImpl _value,
      $Res Function(_$TransactionGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? currency = null,
    Object? bookings = null,
  }) {
    return _then(_$TransactionGroupImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      bookings: null == bookings
          ? _value._bookings
          : bookings // ignore: cast_nullable_to_non_nullable
              as List<Booking>,
    ));
  }
}

/// @nodoc

class _$TransactionGroupImpl extends _TransactionGroup {
  const _$TransactionGroupImpl(
      {required this.date,
      required this.currency,
      required final List<Booking> bookings})
      : _bookings = bookings,
        super._();

  @override
  final DateTime date;
  @override
  final Currency currency;
  final List<Booking> _bookings;
  @override
  List<Booking> get bookings {
    if (_bookings is EqualUnmodifiableListView) return _bookings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookings);
  }

  @override
  String toString() {
    return 'TransactionGroup(date: $date, currency: $currency, bookings: $bookings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionGroupImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality().equals(other._bookings, _bookings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, currency,
      const DeepCollectionEquality().hash(_bookings));

  /// Create a copy of TransactionGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionGroupImplCopyWith<_$TransactionGroupImpl> get copyWith =>
      __$$TransactionGroupImplCopyWithImpl<_$TransactionGroupImpl>(
          this, _$identity);
}

abstract class _TransactionGroup extends TransactionGroup {
  const factory _TransactionGroup(
      {required final DateTime date,
      required final Currency currency,
      required final List<Booking> bookings}) = _$TransactionGroupImpl;
  const _TransactionGroup._() : super._();

  @override
  DateTime get date;
  @override
  Currency get currency;
  @override
  List<Booking> get bookings;

  /// Create a copy of TransactionGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionGroupImplCopyWith<_$TransactionGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
