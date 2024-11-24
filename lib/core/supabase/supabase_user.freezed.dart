// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supabase_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SupabaseUser _$SupabaseUserFromJson(Map<String, dynamic> json) {
  return _SupabaseUser.fromJson(json);
}

/// @nodoc
mixin _$SupabaseUser {
  String get id => throw _privateConstructorUsedError;
  Map<String, dynamic> get appMetadata => throw _privateConstructorUsedError;
  Map<String, dynamic>? get userMetadata => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this SupabaseUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SupabaseUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SupabaseUserCopyWith<SupabaseUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupabaseUserCopyWith<$Res> {
  factory $SupabaseUserCopyWith(
          SupabaseUser value, $Res Function(SupabaseUser) then) =
      _$SupabaseUserCopyWithImpl<$Res, SupabaseUser>;
  @useResult
  $Res call(
      {String id,
      Map<String, dynamic> appMetadata,
      Map<String, dynamic>? userMetadata,
      String? email});
}

/// @nodoc
class _$SupabaseUserCopyWithImpl<$Res, $Val extends SupabaseUser>
    implements $SupabaseUserCopyWith<$Res> {
  _$SupabaseUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SupabaseUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? appMetadata = null,
    Object? userMetadata = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      appMetadata: null == appMetadata
          ? _value.appMetadata
          : appMetadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      userMetadata: freezed == userMetadata
          ? _value.userMetadata
          : userMetadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SupabaseUserImplCopyWith<$Res>
    implements $SupabaseUserCopyWith<$Res> {
  factory _$$SupabaseUserImplCopyWith(
          _$SupabaseUserImpl value, $Res Function(_$SupabaseUserImpl) then) =
      __$$SupabaseUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Map<String, dynamic> appMetadata,
      Map<String, dynamic>? userMetadata,
      String? email});
}

/// @nodoc
class __$$SupabaseUserImplCopyWithImpl<$Res>
    extends _$SupabaseUserCopyWithImpl<$Res, _$SupabaseUserImpl>
    implements _$$SupabaseUserImplCopyWith<$Res> {
  __$$SupabaseUserImplCopyWithImpl(
      _$SupabaseUserImpl _value, $Res Function(_$SupabaseUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of SupabaseUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? appMetadata = null,
    Object? userMetadata = freezed,
    Object? email = freezed,
  }) {
    return _then(_$SupabaseUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      appMetadata: null == appMetadata
          ? _value._appMetadata
          : appMetadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      userMetadata: freezed == userMetadata
          ? _value._userMetadata
          : userMetadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SupabaseUserImpl extends _SupabaseUser {
  const _$SupabaseUserImpl(
      {required this.id,
      required final Map<String, dynamic> appMetadata,
      required final Map<String, dynamic>? userMetadata,
      this.email})
      : _appMetadata = appMetadata,
        _userMetadata = userMetadata,
        super._();

  factory _$SupabaseUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupabaseUserImplFromJson(json);

  @override
  final String id;
  final Map<String, dynamic> _appMetadata;
  @override
  Map<String, dynamic> get appMetadata {
    if (_appMetadata is EqualUnmodifiableMapView) return _appMetadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_appMetadata);
  }

  final Map<String, dynamic>? _userMetadata;
  @override
  Map<String, dynamic>? get userMetadata {
    final value = _userMetadata;
    if (value == null) return null;
    if (_userMetadata is EqualUnmodifiableMapView) return _userMetadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? email;

  @override
  String toString() {
    return 'SupabaseUser(id: $id, appMetadata: $appMetadata, userMetadata: $userMetadata, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupabaseUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._appMetadata, _appMetadata) &&
            const DeepCollectionEquality()
                .equals(other._userMetadata, _userMetadata) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_appMetadata),
      const DeepCollectionEquality().hash(_userMetadata),
      email);

  /// Create a copy of SupabaseUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SupabaseUserImplCopyWith<_$SupabaseUserImpl> get copyWith =>
      __$$SupabaseUserImplCopyWithImpl<_$SupabaseUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupabaseUserImplToJson(
      this,
    );
  }
}

abstract class _SupabaseUser extends SupabaseUser {
  const factory _SupabaseUser(
      {required final String id,
      required final Map<String, dynamic> appMetadata,
      required final Map<String, dynamic>? userMetadata,
      final String? email}) = _$SupabaseUserImpl;
  const _SupabaseUser._() : super._();

  factory _SupabaseUser.fromJson(Map<String, dynamic> json) =
      _$SupabaseUserImpl.fromJson;

  @override
  String get id;
  @override
  Map<String, dynamic> get appMetadata;
  @override
  Map<String, dynamic>? get userMetadata;
  @override
  String? get email;

  /// Create a copy of SupabaseUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SupabaseUserImplCopyWith<_$SupabaseUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
