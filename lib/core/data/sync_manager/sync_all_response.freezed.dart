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

RawDelta _$RawDeltaFromJson(Map<String, dynamic> json) {
  return _RawDelta.fromJson(json);
}

/// @nodoc
mixin _$RawDelta {
  List<Map<String, dynamic>> get upserts => throw _privateConstructorUsedError;
  List<String> get deletes => throw _privateConstructorUsedError;

  /// Serializes this RawDelta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RawDelta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RawDeltaCopyWith<RawDelta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RawDeltaCopyWith<$Res> {
  factory $RawDeltaCopyWith(RawDelta value, $Res Function(RawDelta) then) =
      _$RawDeltaCopyWithImpl<$Res, RawDelta>;
  @useResult
  $Res call({List<Map<String, dynamic>> upserts, List<String> deletes});
}

/// @nodoc
class _$RawDeltaCopyWithImpl<$Res, $Val extends RawDelta>
    implements $RawDeltaCopyWith<$Res> {
  _$RawDeltaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RawDelta
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
                        as List<Map<String, dynamic>>,
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
abstract class _$$RawDeltaImplCopyWith<$Res>
    implements $RawDeltaCopyWith<$Res> {
  factory _$$RawDeltaImplCopyWith(
    _$RawDeltaImpl value,
    $Res Function(_$RawDeltaImpl) then,
  ) = __$$RawDeltaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Map<String, dynamic>> upserts, List<String> deletes});
}

/// @nodoc
class __$$RawDeltaImplCopyWithImpl<$Res>
    extends _$RawDeltaCopyWithImpl<$Res, _$RawDeltaImpl>
    implements _$$RawDeltaImplCopyWith<$Res> {
  __$$RawDeltaImplCopyWithImpl(
    _$RawDeltaImpl _value,
    $Res Function(_$RawDeltaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RawDelta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? upserts = null, Object? deletes = null}) {
    return _then(
      _$RawDeltaImpl(
        upserts:
            null == upserts
                ? _value._upserts
                : upserts // ignore: cast_nullable_to_non_nullable
                    as List<Map<String, dynamic>>,
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
@JsonSerializable()
class _$RawDeltaImpl implements _RawDelta {
  const _$RawDeltaImpl({
    required final List<Map<String, dynamic>> upserts,
    required final List<String> deletes,
  }) : _upserts = upserts,
       _deletes = deletes;

  factory _$RawDeltaImpl.fromJson(Map<String, dynamic> json) =>
      _$$RawDeltaImplFromJson(json);

  final List<Map<String, dynamic>> _upserts;
  @override
  List<Map<String, dynamic>> get upserts {
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
    return 'RawDelta(upserts: $upserts, deletes: $deletes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RawDeltaImpl &&
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

  /// Create a copy of RawDelta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RawDeltaImplCopyWith<_$RawDeltaImpl> get copyWith =>
      __$$RawDeltaImplCopyWithImpl<_$RawDeltaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RawDeltaImplToJson(this);
  }
}

abstract class _RawDelta implements RawDelta {
  const factory _RawDelta({
    required final List<Map<String, dynamic>> upserts,
    required final List<String> deletes,
  }) = _$RawDeltaImpl;

  factory _RawDelta.fromJson(Map<String, dynamic> json) =
      _$RawDeltaImpl.fromJson;

  @override
  List<Map<String, dynamic>> get upserts;
  @override
  List<String> get deletes;

  /// Create a copy of RawDelta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RawDeltaImplCopyWith<_$RawDeltaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SyncAllResponse _$SyncAllResponseFromJson(Map<String, dynamic> json) {
  return _SyncAllResponse.fromJson(json);
}

/// @nodoc
mixin _$SyncAllResponse {
  DateTime get serverNow => throw _privateConstructorUsedError;
  Map<String, RawDelta> get deltas => throw _privateConstructorUsedError;
  @JsonKey(
    name: 'newTimestamps',
    fromJson: _tsMapFromJson,
    toJson: _tsMapToJson,
  )
  Map<String, DateTime?> get newTimestamps =>
      throw _privateConstructorUsedError;

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
    DateTime serverNow,
    Map<String, RawDelta> deltas,
    @JsonKey(
      name: 'newTimestamps',
      fromJson: _tsMapFromJson,
      toJson: _tsMapToJson,
    )
    Map<String, DateTime?> newTimestamps,
  });
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
    Object? serverNow = null,
    Object? deltas = null,
    Object? newTimestamps = null,
  }) {
    return _then(
      _value.copyWith(
            serverNow:
                null == serverNow
                    ? _value.serverNow
                    : serverNow // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            deltas:
                null == deltas
                    ? _value.deltas
                    : deltas // ignore: cast_nullable_to_non_nullable
                        as Map<String, RawDelta>,
            newTimestamps:
                null == newTimestamps
                    ? _value.newTimestamps
                    : newTimestamps // ignore: cast_nullable_to_non_nullable
                        as Map<String, DateTime?>,
          )
          as $Val,
    );
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
    DateTime serverNow,
    Map<String, RawDelta> deltas,
    @JsonKey(
      name: 'newTimestamps',
      fromJson: _tsMapFromJson,
      toJson: _tsMapToJson,
    )
    Map<String, DateTime?> newTimestamps,
  });
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
    Object? serverNow = null,
    Object? deltas = null,
    Object? newTimestamps = null,
  }) {
    return _then(
      _$SyncAllResponseImpl(
        serverNow:
            null == serverNow
                ? _value.serverNow
                : serverNow // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        deltas:
            null == deltas
                ? _value._deltas
                : deltas // ignore: cast_nullable_to_non_nullable
                    as Map<String, RawDelta>,
        newTimestamps:
            null == newTimestamps
                ? _value._newTimestamps
                : newTimestamps // ignore: cast_nullable_to_non_nullable
                    as Map<String, DateTime?>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncAllResponseImpl implements _SyncAllResponse {
  const _$SyncAllResponseImpl({
    required this.serverNow,
    required final Map<String, RawDelta> deltas,
    @JsonKey(
      name: 'newTimestamps',
      fromJson: _tsMapFromJson,
      toJson: _tsMapToJson,
    )
    required final Map<String, DateTime?> newTimestamps,
  }) : _deltas = deltas,
       _newTimestamps = newTimestamps;

  factory _$SyncAllResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncAllResponseImplFromJson(json);

  @override
  final DateTime serverNow;
  final Map<String, RawDelta> _deltas;
  @override
  Map<String, RawDelta> get deltas {
    if (_deltas is EqualUnmodifiableMapView) return _deltas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_deltas);
  }

  final Map<String, DateTime?> _newTimestamps;
  @override
  @JsonKey(
    name: 'newTimestamps',
    fromJson: _tsMapFromJson,
    toJson: _tsMapToJson,
  )
  Map<String, DateTime?> get newTimestamps {
    if (_newTimestamps is EqualUnmodifiableMapView) return _newTimestamps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_newTimestamps);
  }

  @override
  String toString() {
    return 'SyncAllResponse(serverNow: $serverNow, deltas: $deltas, newTimestamps: $newTimestamps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncAllResponseImpl &&
            (identical(other.serverNow, serverNow) ||
                other.serverNow == serverNow) &&
            const DeepCollectionEquality().equals(other._deltas, _deltas) &&
            const DeepCollectionEquality().equals(
              other._newTimestamps,
              _newTimestamps,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    serverNow,
    const DeepCollectionEquality().hash(_deltas),
    const DeepCollectionEquality().hash(_newTimestamps),
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
    required final DateTime serverNow,
    required final Map<String, RawDelta> deltas,
    @JsonKey(
      name: 'newTimestamps',
      fromJson: _tsMapFromJson,
      toJson: _tsMapToJson,
    )
    required final Map<String, DateTime?> newTimestamps,
  }) = _$SyncAllResponseImpl;

  factory _SyncAllResponse.fromJson(Map<String, dynamic> json) =
      _$SyncAllResponseImpl.fromJson;

  @override
  DateTime get serverNow;
  @override
  Map<String, RawDelta> get deltas;
  @override
  @JsonKey(
    name: 'newTimestamps',
    fromJson: _tsMapFromJson,
    toJson: _tsMapToJson,
  )
  Map<String, DateTime?> get newTimestamps;

  /// Create a copy of SyncAllResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncAllResponseImplCopyWith<_$SyncAllResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
