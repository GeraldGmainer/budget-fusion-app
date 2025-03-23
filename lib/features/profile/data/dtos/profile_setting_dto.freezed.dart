// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_setting_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileSettingDto _$ProfileSettingDtoFromJson(Map<String, dynamic> json) {
  return _ProfileSettingDto.fromJson(json);
}

/// @nodoc
mixin _$ProfileSettingDto {
  @UuidSerializer()
  Uuid get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_id')
  @UuidSerializer()
  Uuid get profileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency_id')
  @UuidSerializer()
  Uuid get currencyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'currencies')
  @CurrencyDtoSerializer()
  CurrencyDto get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ProfileSettingDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileSettingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileSettingDtoCopyWith<ProfileSettingDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileSettingDtoCopyWith<$Res> {
  factory $ProfileSettingDtoCopyWith(
          ProfileSettingDto value, $Res Function(ProfileSettingDto) then) =
      _$ProfileSettingDtoCopyWithImpl<$Res, ProfileSettingDto>;
  @useResult
  $Res call(
      {@UuidSerializer() Uuid id,
      @JsonKey(name: 'profile_id') @UuidSerializer() Uuid profileId,
      @JsonKey(name: 'currency_id') @UuidSerializer() Uuid currencyId,
      @JsonKey(name: 'currencies')
      @CurrencyDtoSerializer()
      CurrencyDto currency,
      @JsonKey(name: 'updated_at') @DateTimeSerializer() DateTime updatedAt});

  $CurrencyDtoCopyWith<$Res> get currency;
}

/// @nodoc
class _$ProfileSettingDtoCopyWithImpl<$Res, $Val extends ProfileSettingDto>
    implements $ProfileSettingDtoCopyWith<$Res> {
  _$ProfileSettingDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileSettingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? profileId = null,
    Object? currencyId = null,
    Object? currency = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Uuid,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as Uuid,
      currencyId: null == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as Uuid,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as CurrencyDto,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of ProfileSettingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrencyDtoCopyWith<$Res> get currency {
    return $CurrencyDtoCopyWith<$Res>(_value.currency, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileSettingDtoImplCopyWith<$Res>
    implements $ProfileSettingDtoCopyWith<$Res> {
  factory _$$ProfileSettingDtoImplCopyWith(_$ProfileSettingDtoImpl value,
          $Res Function(_$ProfileSettingDtoImpl) then) =
      __$$ProfileSettingDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@UuidSerializer() Uuid id,
      @JsonKey(name: 'profile_id') @UuidSerializer() Uuid profileId,
      @JsonKey(name: 'currency_id') @UuidSerializer() Uuid currencyId,
      @JsonKey(name: 'currencies')
      @CurrencyDtoSerializer()
      CurrencyDto currency,
      @JsonKey(name: 'updated_at') @DateTimeSerializer() DateTime updatedAt});

  @override
  $CurrencyDtoCopyWith<$Res> get currency;
}

/// @nodoc
class __$$ProfileSettingDtoImplCopyWithImpl<$Res>
    extends _$ProfileSettingDtoCopyWithImpl<$Res, _$ProfileSettingDtoImpl>
    implements _$$ProfileSettingDtoImplCopyWith<$Res> {
  __$$ProfileSettingDtoImplCopyWithImpl(_$ProfileSettingDtoImpl _value,
      $Res Function(_$ProfileSettingDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileSettingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? profileId = null,
    Object? currencyId = null,
    Object? currency = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ProfileSettingDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Uuid,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as Uuid,
      currencyId: null == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as Uuid,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as CurrencyDto,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileSettingDtoImpl extends _ProfileSettingDto {
  const _$ProfileSettingDtoImpl(
      {@UuidSerializer() required this.id,
      @JsonKey(name: 'profile_id') @UuidSerializer() required this.profileId,
      @JsonKey(name: 'currency_id') @UuidSerializer() required this.currencyId,
      @JsonKey(name: 'currencies')
      @CurrencyDtoSerializer()
      required this.currency,
      @JsonKey(name: 'updated_at')
      @DateTimeSerializer()
      required this.updatedAt})
      : super._();

  factory _$ProfileSettingDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileSettingDtoImplFromJson(json);

  @override
  @UuidSerializer()
  final Uuid id;
  @override
  @JsonKey(name: 'profile_id')
  @UuidSerializer()
  final Uuid profileId;
  @override
  @JsonKey(name: 'currency_id')
  @UuidSerializer()
  final Uuid currencyId;
  @override
  @JsonKey(name: 'currencies')
  @CurrencyDtoSerializer()
  final CurrencyDto currency;
  @override
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ProfileSettingDto(id: $id, profileId: $profileId, currencyId: $currencyId, currency: $currency, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileSettingDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.currencyId, currencyId) ||
                other.currencyId == currencyId) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, profileId, currencyId, currency, updatedAt);

  /// Create a copy of ProfileSettingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileSettingDtoImplCopyWith<_$ProfileSettingDtoImpl> get copyWith =>
      __$$ProfileSettingDtoImplCopyWithImpl<_$ProfileSettingDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileSettingDtoImplToJson(
      this,
    );
  }
}

abstract class _ProfileSettingDto extends ProfileSettingDto {
  const factory _ProfileSettingDto(
      {@UuidSerializer() required final Uuid id,
      @JsonKey(name: 'profile_id')
      @UuidSerializer()
      required final Uuid profileId,
      @JsonKey(name: 'currency_id')
      @UuidSerializer()
      required final Uuid currencyId,
      @JsonKey(name: 'currencies')
      @CurrencyDtoSerializer()
      required final CurrencyDto currency,
      @JsonKey(name: 'updated_at')
      @DateTimeSerializer()
      required final DateTime updatedAt}) = _$ProfileSettingDtoImpl;
  const _ProfileSettingDto._() : super._();

  factory _ProfileSettingDto.fromJson(Map<String, dynamic> json) =
      _$ProfileSettingDtoImpl.fromJson;

  @override
  @UuidSerializer()
  Uuid get id;
  @override
  @JsonKey(name: 'profile_id')
  @UuidSerializer()
  Uuid get profileId;
  @override
  @JsonKey(name: 'currency_id')
  @UuidSerializer()
  Uuid get currencyId;
  @override
  @JsonKey(name: 'currencies')
  @CurrencyDtoSerializer()
  CurrencyDto get currency;
  @override
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  DateTime get updatedAt;

  /// Create a copy of ProfileSettingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileSettingDtoImplCopyWith<_$ProfileSettingDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
