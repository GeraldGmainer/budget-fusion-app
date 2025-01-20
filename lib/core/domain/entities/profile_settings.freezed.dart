// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileSettings {
  Uuid get id => throw _privateConstructorUsedError;
  Uuid get profileId => throw _privateConstructorUsedError;
  Currency get currency => throw _privateConstructorUsedError;

  /// Create a copy of ProfileSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileSettingsCopyWith<ProfileSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileSettingsCopyWith<$Res> {
  factory $ProfileSettingsCopyWith(
          ProfileSettings value, $Res Function(ProfileSettings) then) =
      _$ProfileSettingsCopyWithImpl<$Res, ProfileSettings>;
  @useResult
  $Res call({Uuid id, Uuid profileId, Currency currency});

  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class _$ProfileSettingsCopyWithImpl<$Res, $Val extends ProfileSettings>
    implements $ProfileSettingsCopyWith<$Res> {
  _$ProfileSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? profileId = null,
    Object? currency = null,
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
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
    ) as $Val);
  }

  /// Create a copy of ProfileSettings
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
abstract class _$$ProfileSettingsImplCopyWith<$Res>
    implements $ProfileSettingsCopyWith<$Res> {
  factory _$$ProfileSettingsImplCopyWith(_$ProfileSettingsImpl value,
          $Res Function(_$ProfileSettingsImpl) then) =
      __$$ProfileSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Uuid id, Uuid profileId, Currency currency});

  @override
  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class __$$ProfileSettingsImplCopyWithImpl<$Res>
    extends _$ProfileSettingsCopyWithImpl<$Res, _$ProfileSettingsImpl>
    implements _$$ProfileSettingsImplCopyWith<$Res> {
  __$$ProfileSettingsImplCopyWithImpl(
      _$ProfileSettingsImpl _value, $Res Function(_$ProfileSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? profileId = null,
    Object? currency = null,
  }) {
    return _then(_$ProfileSettingsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Uuid,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as Uuid,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
    ));
  }
}

/// @nodoc

class _$ProfileSettingsImpl extends _ProfileSettings {
  const _$ProfileSettingsImpl(
      {required this.id, required this.profileId, required this.currency})
      : super._();

  @override
  final Uuid id;
  @override
  final Uuid profileId;
  @override
  final Currency currency;

  @override
  String toString() {
    return 'ProfileSettings(id: $id, profileId: $profileId, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileSettingsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, profileId, currency);

  /// Create a copy of ProfileSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileSettingsImplCopyWith<_$ProfileSettingsImpl> get copyWith =>
      __$$ProfileSettingsImplCopyWithImpl<_$ProfileSettingsImpl>(
          this, _$identity);
}

abstract class _ProfileSettings extends ProfileSettings {
  const factory _ProfileSettings(
      {required final Uuid id,
      required final Uuid profileId,
      required final Currency currency}) = _$ProfileSettingsImpl;
  const _ProfileSettings._() : super._();

  @override
  Uuid get id;
  @override
  Uuid get profileId;
  @override
  Currency get currency;

  /// Create a copy of ProfileSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileSettingsImplCopyWith<_$ProfileSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
