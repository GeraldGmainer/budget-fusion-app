// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_all_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SyncDelta<T> _$SyncDeltaFromJson<T extends Dto>(
  Map<String, dynamic> json,
  T Function(Object?) fromJsonT,
) {
  return _SyncDelta<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$SyncDelta<T extends Dto> {
  List<T> get upserts => throw _privateConstructorUsedError;
  List<String> get deletes => throw _privateConstructorUsedError;

  /// Serializes this SyncDelta to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of SyncDelta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SyncDeltaCopyWith<T, SyncDelta<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncDeltaCopyWith<T extends Dto, $Res> {
  factory $SyncDeltaCopyWith(
    SyncDelta<T> value,
    $Res Function(SyncDelta<T>) then,
  ) = _$SyncDeltaCopyWithImpl<T, $Res, SyncDelta<T>>;
  @useResult
  $Res call({List<T> upserts, List<String> deletes});
}

/// @nodoc
class _$SyncDeltaCopyWithImpl<T extends Dto, $Res, $Val extends SyncDelta<T>>
    implements $SyncDeltaCopyWith<T, $Res> {
  _$SyncDeltaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SyncDelta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? upserts = null, Object? deletes = null}) {
    return _then(
      _value.copyWith(
            upserts:
                null == upserts
                    ? _value.upserts
                    : upserts // ignore: cast_nullable_to_non_nullable
                        as List<T>,
            deletes:
                null == deletes
                    ? _value.deletes
                    : deletes // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SyncDeltaImplCopyWith<T extends Dto, $Res>
    implements $SyncDeltaCopyWith<T, $Res> {
  factory _$$SyncDeltaImplCopyWith(
    _$SyncDeltaImpl<T> value,
    $Res Function(_$SyncDeltaImpl<T>) then,
  ) = __$$SyncDeltaImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<T> upserts, List<String> deletes});
}

/// @nodoc
class __$$SyncDeltaImplCopyWithImpl<T extends Dto, $Res>
    extends _$SyncDeltaCopyWithImpl<T, $Res, _$SyncDeltaImpl<T>>
    implements _$$SyncDeltaImplCopyWith<T, $Res> {
  __$$SyncDeltaImplCopyWithImpl(
    _$SyncDeltaImpl<T> _value,
    $Res Function(_$SyncDeltaImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncDelta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? upserts = null, Object? deletes = null}) {
    return _then(
      _$SyncDeltaImpl<T>(
        upserts:
            null == upserts
                ? _value._upserts
                : upserts // ignore: cast_nullable_to_non_nullable
                    as List<T>,
        deletes:
            null == deletes
                ? _value._deletes
                : deletes // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$SyncDeltaImpl<T extends Dto> implements _SyncDelta<T> {
  const _$SyncDeltaImpl({
    required final List<T> upserts,
    required final List<String> deletes,
  }) : _upserts = upserts,
       _deletes = deletes;

  factory _$SyncDeltaImpl.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$$SyncDeltaImplFromJson(json, fromJsonT);

  final List<T> _upserts;
  @override
  List<T> get upserts {
    if (_upserts is EqualUnmodifiableListView) return _upserts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upserts);
  }

  final List<String> _deletes;
  @override
  List<String> get deletes {
    if (_deletes is EqualUnmodifiableListView) return _deletes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deletes);
  }

  @override
  String toString() {
    return 'SyncDelta<$T>(upserts: $upserts, deletes: $deletes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncDeltaImpl<T> &&
            const DeepCollectionEquality().equals(other._upserts, _upserts) &&
            const DeepCollectionEquality().equals(other._deletes, _deletes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_upserts),
    const DeepCollectionEquality().hash(_deletes),
  );

  /// Create a copy of SyncDelta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncDeltaImplCopyWith<T, _$SyncDeltaImpl<T>> get copyWith =>
      __$$SyncDeltaImplCopyWithImpl<T, _$SyncDeltaImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$SyncDeltaImplToJson<T>(this, toJsonT);
  }
}

abstract class _SyncDelta<T extends Dto> implements SyncDelta<T> {
  const factory _SyncDelta({
    required final List<T> upserts,
    required final List<String> deletes,
  }) = _$SyncDeltaImpl<T>;

  factory _SyncDelta.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) = _$SyncDeltaImpl<T>.fromJson;

  @override
  List<T> get upserts;
  @override
  List<String> get deletes;

  /// Create a copy of SyncDelta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncDeltaImplCopyWith<T, _$SyncDeltaImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

NewTimestamps _$NewTimestampsFromJson(Map<String, dynamic> json) {
  return _NewTimestamps.fromJson(json);
}

/// @nodoc
mixin _$NewTimestamps {
  @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
  DateTime? get account => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
  DateTime? get booking => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
  DateTime? get profile => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
  DateTime? get category => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
  DateTime? get currency => throw _privateConstructorUsedError;

  /// Serializes this NewTimestamps to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewTimestamps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewTimestampsCopyWith<NewTimestamps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewTimestampsCopyWith<$Res> {
  factory $NewTimestampsCopyWith(
    NewTimestamps value,
    $Res Function(NewTimestamps) then,
  ) = _$NewTimestampsCopyWithImpl<$Res, NewTimestamps>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
    DateTime? account,
    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
    DateTime? booking,
    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
    DateTime? profile,
    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
    DateTime? category,
    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
    DateTime? currency,
  });
}

/// @nodoc
class _$NewTimestampsCopyWithImpl<$Res, $Val extends NewTimestamps>
    implements $NewTimestampsCopyWith<$Res> {
  _$NewTimestampsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewTimestamps
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = freezed,
    Object? booking = freezed,
    Object? profile = freezed,
    Object? category = freezed,
    Object? currency = freezed,
  }) {
    return _then(
      _value.copyWith(
            account:
                freezed == account
                    ? _value.account
                    : account // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            booking:
                freezed == booking
                    ? _value.booking
                    : booking // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            profile:
                freezed == profile
                    ? _value.profile
                    : profile // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            category:
                freezed == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            currency:
                freezed == currency
                    ? _value.currency
                    : currency // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NewTimestampsImplCopyWith<$Res>
    implements $NewTimestampsCopyWith<$Res> {
  factory _$$NewTimestampsImplCopyWith(
    _$NewTimestampsImpl value,
    $Res Function(_$NewTimestampsImpl) then,
  ) = __$$NewTimestampsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
    DateTime? account,
    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
    DateTime? booking,
    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
    DateTime? profile,
    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
    DateTime? category,
    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
    DateTime? currency,
  });
}

/// @nodoc
class __$$NewTimestampsImplCopyWithImpl<$Res>
    extends _$NewTimestampsCopyWithImpl<$Res, _$NewTimestampsImpl>
    implements _$$NewTimestampsImplCopyWith<$Res> {
  __$$NewTimestampsImplCopyWithImpl(
    _$NewTimestampsImpl _value,
    $Res Function(_$NewTimestampsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NewTimestamps
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = freezed,
    Object? booking = freezed,
    Object? profile = freezed,
    Object? category = freezed,
    Object? currency = freezed,
  }) {
    return _then(
      _$NewTimestampsImpl(
        account:
            freezed == account
                ? _value.account
                : account // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        booking:
            freezed == booking
                ? _value.booking
                : booking // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        profile:
            freezed == profile
                ? _value.profile
                : profile // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        category:
            freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        currency:
            freezed == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NewTimestampsImpl implements _NewTimestamps {
  const _$NewTimestampsImpl({
    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable) this.account,
    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable) this.booking,
    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable) this.profile,
    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
    this.category,
    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
    this.currency,
  });

  factory _$NewTimestampsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewTimestampsImplFromJson(json);

  @override
  @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
  final DateTime? account;
  @override
  @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
  final DateTime? booking;
  @override
  @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
  final DateTime? profile;
  @override
  @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
  final DateTime? category;
  @override
  @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
  final DateTime? currency;

  @override
  String toString() {
    return 'NewTimestamps(account: $account, booking: $booking, profile: $profile, category: $category, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewTimestampsImpl &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.booking, booking) || other.booking == booking) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, account, booking, profile, category, currency);

  /// Create a copy of NewTimestamps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewTimestampsImplCopyWith<_$NewTimestampsImpl> get copyWith =>
      __$$NewTimestampsImplCopyWithImpl<_$NewTimestampsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewTimestampsImplToJson(this);
  }
}

abstract class _NewTimestamps implements NewTimestamps {
  const factory _NewTimestamps({
    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
    final DateTime? account,
    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
    final DateTime? booking,
    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
    final DateTime? profile,
    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
    final DateTime? category,
    @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
    final DateTime? currency,
  }) = _$NewTimestampsImpl;

  factory _NewTimestamps.fromJson(Map<String, dynamic> json) =
      _$NewTimestampsImpl.fromJson;

  @override
  @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
  DateTime? get account;
  @override
  @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
  DateTime? get booking;
  @override
  @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
  DateTime? get profile;
  @override
  @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
  DateTime? get category;
  @override
  @JsonKey(fromJson: _parseNullable, toJson: _stringifyNullable)
  DateTime? get currency;

  /// Create a copy of NewTimestamps
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewTimestampsImplCopyWith<_$NewTimestampsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SyncAllResponse _$SyncAllResponseFromJson(Map<String, dynamic> json) {
  return _SyncAllResponse.fromJson(json);
}

/// @nodoc
mixin _$SyncAllResponse {
  // TODO use dynamic instead of concrete Dtos?
  // TODO dont define every EntityType manually
  @JsonKey(fromJson: _accountDeltaFromJson, toJson: _accountDeltaToJson)
  SyncDelta<AccountDto> get account => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _bookingDeltaFromJson, toJson: _bookingDeltaToJson)
  SyncDelta<BookingDto> get booking => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _profileDeltaFromJson, toJson: _profileDeltaToJson)
  SyncDelta<ProfileDto> get profile => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _categoryDeltaFromJson, toJson: _categoryDeltaToJson)
  SyncDelta<CategoryDto> get category => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _currencyDeltaFromJson, toJson: _currencyDeltaToJson)
  SyncDelta<CurrencyDto> get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'newTimestamps')
  NewTimestamps get newTimestamps => throw _privateConstructorUsedError;

  /// Serializes this SyncAllResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SyncAllResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SyncAllResponseCopyWith<SyncAllResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncAllResponseCopyWith<$Res> {
  factory $SyncAllResponseCopyWith(
    SyncAllResponse value,
    $Res Function(SyncAllResponse) then,
  ) = _$SyncAllResponseCopyWithImpl<$Res, SyncAllResponse>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _accountDeltaFromJson, toJson: _accountDeltaToJson)
    SyncDelta<AccountDto> account,
    @JsonKey(fromJson: _bookingDeltaFromJson, toJson: _bookingDeltaToJson)
    SyncDelta<BookingDto> booking,
    @JsonKey(fromJson: _profileDeltaFromJson, toJson: _profileDeltaToJson)
    SyncDelta<ProfileDto> profile,
    @JsonKey(fromJson: _categoryDeltaFromJson, toJson: _categoryDeltaToJson)
    SyncDelta<CategoryDto> category,
    @JsonKey(fromJson: _currencyDeltaFromJson, toJson: _currencyDeltaToJson)
    SyncDelta<CurrencyDto> currency,
    @JsonKey(name: 'newTimestamps') NewTimestamps newTimestamps,
  });

  $SyncDeltaCopyWith<AccountDto, $Res> get account;
  $SyncDeltaCopyWith<BookingDto, $Res> get booking;
  $SyncDeltaCopyWith<ProfileDto, $Res> get profile;
  $SyncDeltaCopyWith<CategoryDto, $Res> get category;
  $SyncDeltaCopyWith<CurrencyDto, $Res> get currency;
  $NewTimestampsCopyWith<$Res> get newTimestamps;
}

/// @nodoc
class _$SyncAllResponseCopyWithImpl<$Res, $Val extends SyncAllResponse>
    implements $SyncAllResponseCopyWith<$Res> {
  _$SyncAllResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SyncAllResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? booking = null,
    Object? profile = null,
    Object? category = null,
    Object? currency = null,
    Object? newTimestamps = null,
  }) {
    return _then(
      _value.copyWith(
            account:
                null == account
                    ? _value.account
                    : account // ignore: cast_nullable_to_non_nullable
                        as SyncDelta<AccountDto>,
            booking:
                null == booking
                    ? _value.booking
                    : booking // ignore: cast_nullable_to_non_nullable
                        as SyncDelta<BookingDto>,
            profile:
                null == profile
                    ? _value.profile
                    : profile // ignore: cast_nullable_to_non_nullable
                        as SyncDelta<ProfileDto>,
            category:
                null == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as SyncDelta<CategoryDto>,
            currency:
                null == currency
                    ? _value.currency
                    : currency // ignore: cast_nullable_to_non_nullable
                        as SyncDelta<CurrencyDto>,
            newTimestamps:
                null == newTimestamps
                    ? _value.newTimestamps
                    : newTimestamps // ignore: cast_nullable_to_non_nullable
                        as NewTimestamps,
          )
          as $Val,
    );
  }

  /// Create a copy of SyncAllResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SyncDeltaCopyWith<AccountDto, $Res> get account {
    return $SyncDeltaCopyWith<AccountDto, $Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value) as $Val);
    });
  }

  /// Create a copy of SyncAllResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SyncDeltaCopyWith<BookingDto, $Res> get booking {
    return $SyncDeltaCopyWith<BookingDto, $Res>(_value.booking, (value) {
      return _then(_value.copyWith(booking: value) as $Val);
    });
  }

  /// Create a copy of SyncAllResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SyncDeltaCopyWith<ProfileDto, $Res> get profile {
    return $SyncDeltaCopyWith<ProfileDto, $Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }

  /// Create a copy of SyncAllResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SyncDeltaCopyWith<CategoryDto, $Res> get category {
    return $SyncDeltaCopyWith<CategoryDto, $Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  /// Create a copy of SyncAllResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SyncDeltaCopyWith<CurrencyDto, $Res> get currency {
    return $SyncDeltaCopyWith<CurrencyDto, $Res>(_value.currency, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }

  /// Create a copy of SyncAllResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NewTimestampsCopyWith<$Res> get newTimestamps {
    return $NewTimestampsCopyWith<$Res>(_value.newTimestamps, (value) {
      return _then(_value.copyWith(newTimestamps: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SyncAllResponseImplCopyWith<$Res>
    implements $SyncAllResponseCopyWith<$Res> {
  factory _$$SyncAllResponseImplCopyWith(
    _$SyncAllResponseImpl value,
    $Res Function(_$SyncAllResponseImpl) then,
  ) = __$$SyncAllResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _accountDeltaFromJson, toJson: _accountDeltaToJson)
    SyncDelta<AccountDto> account,
    @JsonKey(fromJson: _bookingDeltaFromJson, toJson: _bookingDeltaToJson)
    SyncDelta<BookingDto> booking,
    @JsonKey(fromJson: _profileDeltaFromJson, toJson: _profileDeltaToJson)
    SyncDelta<ProfileDto> profile,
    @JsonKey(fromJson: _categoryDeltaFromJson, toJson: _categoryDeltaToJson)
    SyncDelta<CategoryDto> category,
    @JsonKey(fromJson: _currencyDeltaFromJson, toJson: _currencyDeltaToJson)
    SyncDelta<CurrencyDto> currency,
    @JsonKey(name: 'newTimestamps') NewTimestamps newTimestamps,
  });

  @override
  $SyncDeltaCopyWith<AccountDto, $Res> get account;
  @override
  $SyncDeltaCopyWith<BookingDto, $Res> get booking;
  @override
  $SyncDeltaCopyWith<ProfileDto, $Res> get profile;
  @override
  $SyncDeltaCopyWith<CategoryDto, $Res> get category;
  @override
  $SyncDeltaCopyWith<CurrencyDto, $Res> get currency;
  @override
  $NewTimestampsCopyWith<$Res> get newTimestamps;
}

/// @nodoc
class __$$SyncAllResponseImplCopyWithImpl<$Res>
    extends _$SyncAllResponseCopyWithImpl<$Res, _$SyncAllResponseImpl>
    implements _$$SyncAllResponseImplCopyWith<$Res> {
  __$$SyncAllResponseImplCopyWithImpl(
    _$SyncAllResponseImpl _value,
    $Res Function(_$SyncAllResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncAllResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? booking = null,
    Object? profile = null,
    Object? category = null,
    Object? currency = null,
    Object? newTimestamps = null,
  }) {
    return _then(
      _$SyncAllResponseImpl(
        account:
            null == account
                ? _value.account
                : account // ignore: cast_nullable_to_non_nullable
                    as SyncDelta<AccountDto>,
        booking:
            null == booking
                ? _value.booking
                : booking // ignore: cast_nullable_to_non_nullable
                    as SyncDelta<BookingDto>,
        profile:
            null == profile
                ? _value.profile
                : profile // ignore: cast_nullable_to_non_nullable
                    as SyncDelta<ProfileDto>,
        category:
            null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as SyncDelta<CategoryDto>,
        currency:
            null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                    as SyncDelta<CurrencyDto>,
        newTimestamps:
            null == newTimestamps
                ? _value.newTimestamps
                : newTimestamps // ignore: cast_nullable_to_non_nullable
                    as NewTimestamps,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncAllResponseImpl implements _SyncAllResponse {
  const _$SyncAllResponseImpl({
    @JsonKey(fromJson: _accountDeltaFromJson, toJson: _accountDeltaToJson)
    required this.account,
    @JsonKey(fromJson: _bookingDeltaFromJson, toJson: _bookingDeltaToJson)
    required this.booking,
    @JsonKey(fromJson: _profileDeltaFromJson, toJson: _profileDeltaToJson)
    required this.profile,
    @JsonKey(fromJson: _categoryDeltaFromJson, toJson: _categoryDeltaToJson)
    required this.category,
    @JsonKey(fromJson: _currencyDeltaFromJson, toJson: _currencyDeltaToJson)
    required this.currency,
    @JsonKey(name: 'newTimestamps') required this.newTimestamps,
  });

  factory _$SyncAllResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncAllResponseImplFromJson(json);

  // TODO use dynamic instead of concrete Dtos?
  // TODO dont define every EntityType manually
  @override
  @JsonKey(fromJson: _accountDeltaFromJson, toJson: _accountDeltaToJson)
  final SyncDelta<AccountDto> account;
  @override
  @JsonKey(fromJson: _bookingDeltaFromJson, toJson: _bookingDeltaToJson)
  final SyncDelta<BookingDto> booking;
  @override
  @JsonKey(fromJson: _profileDeltaFromJson, toJson: _profileDeltaToJson)
  final SyncDelta<ProfileDto> profile;
  @override
  @JsonKey(fromJson: _categoryDeltaFromJson, toJson: _categoryDeltaToJson)
  final SyncDelta<CategoryDto> category;
  @override
  @JsonKey(fromJson: _currencyDeltaFromJson, toJson: _currencyDeltaToJson)
  final SyncDelta<CurrencyDto> currency;
  @override
  @JsonKey(name: 'newTimestamps')
  final NewTimestamps newTimestamps;

  @override
  String toString() {
    return 'SyncAllResponse(account: $account, booking: $booking, profile: $profile, category: $category, currency: $currency, newTimestamps: $newTimestamps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncAllResponseImpl &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.booking, booking) || other.booking == booking) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.newTimestamps, newTimestamps) ||
                other.newTimestamps == newTimestamps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    account,
    booking,
    profile,
    category,
    currency,
    newTimestamps,
  );

  /// Create a copy of SyncAllResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncAllResponseImplCopyWith<_$SyncAllResponseImpl> get copyWith =>
      __$$SyncAllResponseImplCopyWithImpl<_$SyncAllResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncAllResponseImplToJson(this);
  }
}

abstract class _SyncAllResponse implements SyncAllResponse {
  const factory _SyncAllResponse({
    @JsonKey(fromJson: _accountDeltaFromJson, toJson: _accountDeltaToJson)
    required final SyncDelta<AccountDto> account,
    @JsonKey(fromJson: _bookingDeltaFromJson, toJson: _bookingDeltaToJson)
    required final SyncDelta<BookingDto> booking,
    @JsonKey(fromJson: _profileDeltaFromJson, toJson: _profileDeltaToJson)
    required final SyncDelta<ProfileDto> profile,
    @JsonKey(fromJson: _categoryDeltaFromJson, toJson: _categoryDeltaToJson)
    required final SyncDelta<CategoryDto> category,
    @JsonKey(fromJson: _currencyDeltaFromJson, toJson: _currencyDeltaToJson)
    required final SyncDelta<CurrencyDto> currency,
    @JsonKey(name: 'newTimestamps') required final NewTimestamps newTimestamps,
  }) = _$SyncAllResponseImpl;

  factory _SyncAllResponse.fromJson(Map<String, dynamic> json) =
      _$SyncAllResponseImpl.fromJson;

  // TODO use dynamic instead of concrete Dtos?
  // TODO dont define every EntityType manually
  @override
  @JsonKey(fromJson: _accountDeltaFromJson, toJson: _accountDeltaToJson)
  SyncDelta<AccountDto> get account;
  @override
  @JsonKey(fromJson: _bookingDeltaFromJson, toJson: _bookingDeltaToJson)
  SyncDelta<BookingDto> get booking;
  @override
  @JsonKey(fromJson: _profileDeltaFromJson, toJson: _profileDeltaToJson)
  SyncDelta<ProfileDto> get profile;
  @override
  @JsonKey(fromJson: _categoryDeltaFromJson, toJson: _categoryDeltaToJson)
  SyncDelta<CategoryDto> get category;
  @override
  @JsonKey(fromJson: _currencyDeltaFromJson, toJson: _currencyDeltaToJson)
  SyncDelta<CurrencyDto> get currency;
  @override
  @JsonKey(name: 'newTimestamps')
  NewTimestamps get newTimestamps;

  /// Create a copy of SyncAllResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncAllResponseImplCopyWith<_$SyncAllResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
