// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProfileSetting {
  Uuid get id => throw _privateConstructorUsedError;
  Currency get currency => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of ProfileSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileSettingCopyWith<ProfileSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileSettingCopyWith<$Res> {
  factory $ProfileSettingCopyWith(
    ProfileSetting value,
    $Res Function(ProfileSetting) then,
  ) = _$ProfileSettingCopyWithImpl<$Res, ProfileSetting>;
  @useResult
  $Res call({Uuid id, Currency currency, DateTime updatedAt});

  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class _$ProfileSettingCopyWithImpl<$Res, $Val extends ProfileSetting>
    implements $ProfileSettingCopyWith<$Res> {
  _$ProfileSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? currency = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as Uuid,
            currency:
                null == currency
                    ? _value.currency
                    : currency // ignore: cast_nullable_to_non_nullable
                        as Currency,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of ProfileSetting
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
abstract class _$$ProfileSettingImplCopyWith<$Res>
    implements $ProfileSettingCopyWith<$Res> {
  factory _$$ProfileSettingImplCopyWith(
    _$ProfileSettingImpl value,
    $Res Function(_$ProfileSettingImpl) then,
  ) = __$$ProfileSettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Uuid id, Currency currency, DateTime updatedAt});

  @override
  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class __$$ProfileSettingImplCopyWithImpl<$Res>
    extends _$ProfileSettingCopyWithImpl<$Res, _$ProfileSettingImpl>
    implements _$$ProfileSettingImplCopyWith<$Res> {
  __$$ProfileSettingImplCopyWithImpl(
    _$ProfileSettingImpl _value,
    $Res Function(_$ProfileSettingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? currency = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$ProfileSettingImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as Uuid,
        currency:
            null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                    as Currency,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$ProfileSettingImpl extends _ProfileSetting {
  const _$ProfileSettingImpl({
    required this.id,
    required this.currency,
    required this.updatedAt,
  }) : super._();

  @override
  final Uuid id;
  @override
  final Currency currency;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ProfileSetting(id: $id, currency: $currency, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileSettingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, currency, updatedAt);

  /// Create a copy of ProfileSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileSettingImplCopyWith<_$ProfileSettingImpl> get copyWith =>
      __$$ProfileSettingImplCopyWithImpl<_$ProfileSettingImpl>(
        this,
        _$identity,
      );
}

abstract class _ProfileSetting extends ProfileSetting {
  const factory _ProfileSetting({
    required final Uuid id,
    required final Currency currency,
    required final DateTime updatedAt,
  }) = _$ProfileSettingImpl;
  const _ProfileSetting._() : super._();

  @override
  Uuid get id;
  @override
  Currency get currency;
  @override
  DateTime get updatedAt;

  /// Create a copy of ProfileSetting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileSettingImplCopyWith<_$ProfileSettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
