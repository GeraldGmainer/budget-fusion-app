// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_settings_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileSettingsDto _$ProfileSettingsDtoFromJson(Map<String, dynamic> json) {
  return _ProfileSettingsDto.fromJson(json);
}

/// @nodoc
mixin _$ProfileSettingsDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_id')
  int get profileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency_id')
  int get currencyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'currencies')
  CurrencyDto get currency => throw _privateConstructorUsedError;

  /// Serializes this ProfileSettingsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileSettingsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileSettingsDtoCopyWith<ProfileSettingsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileSettingsDtoCopyWith<$Res> {
  factory $ProfileSettingsDtoCopyWith(
          ProfileSettingsDto value, $Res Function(ProfileSettingsDto) then) =
      _$ProfileSettingsDtoCopyWithImpl<$Res, ProfileSettingsDto>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'profile_id') int profileId,
      @JsonKey(name: 'currency_id') int currencyId,
      @JsonKey(name: 'currencies') CurrencyDto currency});

  $CurrencyDtoCopyWith<$Res> get currency;
}

/// @nodoc
class _$ProfileSettingsDtoCopyWithImpl<$Res, $Val extends ProfileSettingsDto>
    implements $ProfileSettingsDtoCopyWith<$Res> {
  _$ProfileSettingsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileSettingsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? profileId = null,
    Object? currencyId = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as int,
      currencyId: null == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as CurrencyDto,
    ) as $Val);
  }

  /// Create a copy of ProfileSettingsDto
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
abstract class _$$ProfileSettingsDtoImplCopyWith<$Res>
    implements $ProfileSettingsDtoCopyWith<$Res> {
  factory _$$ProfileSettingsDtoImplCopyWith(_$ProfileSettingsDtoImpl value,
          $Res Function(_$ProfileSettingsDtoImpl) then) =
      __$$ProfileSettingsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'profile_id') int profileId,
      @JsonKey(name: 'currency_id') int currencyId,
      @JsonKey(name: 'currencies') CurrencyDto currency});

  @override
  $CurrencyDtoCopyWith<$Res> get currency;
}

/// @nodoc
class __$$ProfileSettingsDtoImplCopyWithImpl<$Res>
    extends _$ProfileSettingsDtoCopyWithImpl<$Res, _$ProfileSettingsDtoImpl>
    implements _$$ProfileSettingsDtoImplCopyWith<$Res> {
  __$$ProfileSettingsDtoImplCopyWithImpl(_$ProfileSettingsDtoImpl _value,
      $Res Function(_$ProfileSettingsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileSettingsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? profileId = null,
    Object? currencyId = null,
    Object? currency = null,
  }) {
    return _then(_$ProfileSettingsDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as int,
      currencyId: null == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as CurrencyDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileSettingsDtoImpl extends _ProfileSettingsDto {
  const _$ProfileSettingsDtoImpl(
      {required this.id,
      @JsonKey(name: 'profile_id') required this.profileId,
      @JsonKey(name: 'currency_id') required this.currencyId,
      @JsonKey(name: 'currencies') required this.currency})
      : super._();

  factory _$ProfileSettingsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileSettingsDtoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'profile_id')
  final int profileId;
  @override
  @JsonKey(name: 'currency_id')
  final int currencyId;
  @override
  @JsonKey(name: 'currencies')
  final CurrencyDto currency;

  @override
  String toString() {
    return 'ProfileSettingsDto(id: $id, profileId: $profileId, currencyId: $currencyId, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileSettingsDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.currencyId, currencyId) ||
                other.currencyId == currencyId) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, profileId, currencyId, currency);

  /// Create a copy of ProfileSettingsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileSettingsDtoImplCopyWith<_$ProfileSettingsDtoImpl> get copyWith =>
      __$$ProfileSettingsDtoImplCopyWithImpl<_$ProfileSettingsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileSettingsDtoImplToJson(
      this,
    );
  }
}

abstract class _ProfileSettingsDto extends ProfileSettingsDto {
  const factory _ProfileSettingsDto(
          {required final int id,
          @JsonKey(name: 'profile_id') required final int profileId,
          @JsonKey(name: 'currency_id') required final int currencyId,
          @JsonKey(name: 'currencies') required final CurrencyDto currency}) =
      _$ProfileSettingsDtoImpl;
  const _ProfileSettingsDto._() : super._();

  factory _ProfileSettingsDto.fromJson(Map<String, dynamic> json) =
      _$ProfileSettingsDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'profile_id')
  int get profileId;
  @override
  @JsonKey(name: 'currency_id')
  int get currencyId;
  @override
  @JsonKey(name: 'currencies')
  CurrencyDto get currency;

  /// Create a copy of ProfileSettingsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileSettingsDtoImplCopyWith<_$ProfileSettingsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
