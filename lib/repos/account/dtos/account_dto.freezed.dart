// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AccountDto _$AccountDtoFromJson(Map<String, dynamic> json) {
  return _AccountDto.fromJson(json);
}

/// @nodoc
mixin _$AccountDto {
  @UuidSerializer()
  Uuid get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon_name')
  String get iconName => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon_color')
  String get iconColor => throw _privateConstructorUsedError;
  @SyncStatusSerializer()
  @JsonKey(name: 'sync_status')
  SyncStatus? get syncStatus => throw _privateConstructorUsedError;
  @DateTimeSerializer()
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @DateTimeSerializer()
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @DateTimeSerializer()
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this AccountDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountDtoCopyWith<AccountDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDtoCopyWith<$Res> {
  factory $AccountDtoCopyWith(
    AccountDto value,
    $Res Function(AccountDto) then,
  ) = _$AccountDtoCopyWithImpl<$Res, AccountDto>;
  @useResult
  $Res call({
    @UuidSerializer() Uuid id,
    String name,
    @JsonKey(name: 'icon_name') String iconName,
    @JsonKey(name: 'icon_color') String iconColor,
    @SyncStatusSerializer()
    @JsonKey(name: 'sync_status')
    SyncStatus? syncStatus,
    @DateTimeSerializer() @JsonKey(name: 'created_at') DateTime? createdAt,
    @DateTimeSerializer() @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @DateTimeSerializer() @JsonKey(name: 'deleted_at') DateTime? deletedAt,
  });
}

/// @nodoc
class _$AccountDtoCopyWithImpl<$Res, $Val extends AccountDto>
    implements $AccountDtoCopyWith<$Res> {
  _$AccountDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconName = null,
    Object? iconColor = null,
    Object? syncStatus = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as Uuid,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            iconName:
                null == iconName
                    ? _value.iconName
                    : iconName // ignore: cast_nullable_to_non_nullable
                        as String,
            iconColor:
                null == iconColor
                    ? _value.iconColor
                    : iconColor // ignore: cast_nullable_to_non_nullable
                        as String,
            syncStatus:
                freezed == syncStatus
                    ? _value.syncStatus
                    : syncStatus // ignore: cast_nullable_to_non_nullable
                        as SyncStatus?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            deletedAt:
                freezed == deletedAt
                    ? _value.deletedAt
                    : deletedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AccountDtoImplCopyWith<$Res>
    implements $AccountDtoCopyWith<$Res> {
  factory _$$AccountDtoImplCopyWith(
    _$AccountDtoImpl value,
    $Res Function(_$AccountDtoImpl) then,
  ) = __$$AccountDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @UuidSerializer() Uuid id,
    String name,
    @JsonKey(name: 'icon_name') String iconName,
    @JsonKey(name: 'icon_color') String iconColor,
    @SyncStatusSerializer()
    @JsonKey(name: 'sync_status')
    SyncStatus? syncStatus,
    @DateTimeSerializer() @JsonKey(name: 'created_at') DateTime? createdAt,
    @DateTimeSerializer() @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @DateTimeSerializer() @JsonKey(name: 'deleted_at') DateTime? deletedAt,
  });
}

/// @nodoc
class __$$AccountDtoImplCopyWithImpl<$Res>
    extends _$AccountDtoCopyWithImpl<$Res, _$AccountDtoImpl>
    implements _$$AccountDtoImplCopyWith<$Res> {
  __$$AccountDtoImplCopyWithImpl(
    _$AccountDtoImpl _value,
    $Res Function(_$AccountDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AccountDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconName = null,
    Object? iconColor = null,
    Object? syncStatus = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _$AccountDtoImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as Uuid,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        iconName:
            null == iconName
                ? _value.iconName
                : iconName // ignore: cast_nullable_to_non_nullable
                    as String,
        iconColor:
            null == iconColor
                ? _value.iconColor
                : iconColor // ignore: cast_nullable_to_non_nullable
                    as String,
        syncStatus:
            freezed == syncStatus
                ? _value.syncStatus
                : syncStatus // ignore: cast_nullable_to_non_nullable
                    as SyncStatus?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        deletedAt:
            freezed == deletedAt
                ? _value.deletedAt
                : deletedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountDtoImpl extends _AccountDto {
  const _$AccountDtoImpl({
    @UuidSerializer() required this.id,
    required this.name,
    @JsonKey(name: 'icon_name') required this.iconName,
    @JsonKey(name: 'icon_color') required this.iconColor,
    @SyncStatusSerializer()
    @JsonKey(name: 'sync_status')
    required this.syncStatus,
    @DateTimeSerializer() @JsonKey(name: 'created_at') required this.createdAt,
    @DateTimeSerializer() @JsonKey(name: 'updated_at') required this.updatedAt,
    @DateTimeSerializer() @JsonKey(name: 'deleted_at') required this.deletedAt,
  }) : super._();

  factory _$AccountDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountDtoImplFromJson(json);

  @override
  @UuidSerializer()
  final Uuid id;
  @override
  final String name;
  @override
  @JsonKey(name: 'icon_name')
  final String iconName;
  @override
  @JsonKey(name: 'icon_color')
  final String iconColor;
  @override
  @SyncStatusSerializer()
  @JsonKey(name: 'sync_status')
  final SyncStatus? syncStatus;
  @override
  @DateTimeSerializer()
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @DateTimeSerializer()
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @DateTimeSerializer()
  @JsonKey(name: 'deleted_at')
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'AccountDto(id: $id, name: $name, iconName: $iconName, iconColor: $iconColor, syncStatus: $syncStatus, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.iconColor, iconColor) ||
                other.iconColor == iconColor) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    iconName,
    iconColor,
    syncStatus,
    createdAt,
    updatedAt,
    deletedAt,
  );

  /// Create a copy of AccountDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountDtoImplCopyWith<_$AccountDtoImpl> get copyWith =>
      __$$AccountDtoImplCopyWithImpl<_$AccountDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountDtoImplToJson(this);
  }
}

abstract class _AccountDto extends AccountDto {
  const factory _AccountDto({
    @UuidSerializer() required final Uuid id,
    required final String name,
    @JsonKey(name: 'icon_name') required final String iconName,
    @JsonKey(name: 'icon_color') required final String iconColor,
    @SyncStatusSerializer()
    @JsonKey(name: 'sync_status')
    required final SyncStatus? syncStatus,
    @DateTimeSerializer()
    @JsonKey(name: 'created_at')
    required final DateTime? createdAt,
    @DateTimeSerializer()
    @JsonKey(name: 'updated_at')
    required final DateTime? updatedAt,
    @DateTimeSerializer()
    @JsonKey(name: 'deleted_at')
    required final DateTime? deletedAt,
  }) = _$AccountDtoImpl;
  const _AccountDto._() : super._();

  factory _AccountDto.fromJson(Map<String, dynamic> json) =
      _$AccountDtoImpl.fromJson;

  @override
  @UuidSerializer()
  Uuid get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'icon_name')
  String get iconName;
  @override
  @JsonKey(name: 'icon_color')
  String get iconColor;
  @override
  @SyncStatusSerializer()
  @JsonKey(name: 'sync_status')
  SyncStatus? get syncStatus;
  @override
  @DateTimeSerializer()
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @DateTimeSerializer()
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @DateTimeSerializer()
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt;

  /// Create a copy of AccountDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountDtoImplCopyWith<_$AccountDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
