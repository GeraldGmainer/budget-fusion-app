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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProfileSettingDto _$ProfileSettingDtoFromJson(Map<String, dynamic> json) {
  return _ProfileSettingDto.fromJson(json);
}

/// @nodoc
mixin _$ProfileSettingDto {
  @UuidSerializer()
  @JsonKey(name: 'currency_id')
  Uuid get currencyId => throw _privateConstructorUsedError;

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
    ProfileSettingDto value,
    $Res Function(ProfileSettingDto) then,
  ) = _$ProfileSettingDtoCopyWithImpl<$Res, ProfileSettingDto>;
  @useResult
  $Res call({@UuidSerializer() @JsonKey(name: 'currency_id') Uuid currencyId});
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
  $Res call({Object? currencyId = null}) {
    return _then(
      _value.copyWith(
            currencyId:
                null == currencyId
                    ? _value.currencyId
                    : currencyId // ignore: cast_nullable_to_non_nullable
                        as Uuid,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfileSettingDtoImplCopyWith<$Res>
    implements $ProfileSettingDtoCopyWith<$Res> {
  factory _$$ProfileSettingDtoImplCopyWith(
    _$ProfileSettingDtoImpl value,
    $Res Function(_$ProfileSettingDtoImpl) then,
  ) = __$$ProfileSettingDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@UuidSerializer() @JsonKey(name: 'currency_id') Uuid currencyId});
}

/// @nodoc
class __$$ProfileSettingDtoImplCopyWithImpl<$Res>
    extends _$ProfileSettingDtoCopyWithImpl<$Res, _$ProfileSettingDtoImpl>
    implements _$$ProfileSettingDtoImplCopyWith<$Res> {
  __$$ProfileSettingDtoImplCopyWithImpl(
    _$ProfileSettingDtoImpl _value,
    $Res Function(_$ProfileSettingDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileSettingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? currencyId = null}) {
    return _then(
      _$ProfileSettingDtoImpl(
        currencyId:
            null == currencyId
                ? _value.currencyId
                : currencyId // ignore: cast_nullable_to_non_nullable
                    as Uuid,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileSettingDtoImpl extends _ProfileSettingDto {
  const _$ProfileSettingDtoImpl({
    @UuidSerializer() @JsonKey(name: 'currency_id') required this.currencyId,
  }) : super._();

  factory _$ProfileSettingDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileSettingDtoImplFromJson(json);

  @override
  @UuidSerializer()
  @JsonKey(name: 'currency_id')
  final Uuid currencyId;

  @override
  String toString() {
    return 'ProfileSettingDto(currencyId: $currencyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileSettingDtoImpl &&
            (identical(other.currencyId, currencyId) ||
                other.currencyId == currencyId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currencyId);

  /// Create a copy of ProfileSettingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileSettingDtoImplCopyWith<_$ProfileSettingDtoImpl> get copyWith =>
      __$$ProfileSettingDtoImplCopyWithImpl<_$ProfileSettingDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileSettingDtoImplToJson(this);
  }
}

abstract class _ProfileSettingDto extends ProfileSettingDto {
  const factory _ProfileSettingDto({
    @UuidSerializer()
    @JsonKey(name: 'currency_id')
    required final Uuid currencyId,
  }) = _$ProfileSettingDtoImpl;
  const _ProfileSettingDto._() : super._();

  factory _ProfileSettingDto.fromJson(Map<String, dynamic> json) =
      _$ProfileSettingDtoImpl.fromJson;

  @override
  @UuidSerializer()
  @JsonKey(name: 'currency_id')
  Uuid get currencyId;

  /// Create a copy of ProfileSettingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileSettingDtoImplCopyWith<_$ProfileSettingDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
