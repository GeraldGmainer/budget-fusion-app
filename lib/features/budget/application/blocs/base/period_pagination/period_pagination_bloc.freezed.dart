// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'period_pagination_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PeriodPaginationEvent<T> {
  BudgetBookFilter get filter => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BudgetBookFilter filter) load,
    required TResult Function(BudgetBookFilter filter) applyFilter,
    required TResult Function(BudgetBookFilter filter) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BudgetBookFilter filter)? load,
    TResult? Function(BudgetBookFilter filter)? applyFilter,
    TResult? Function(BudgetBookFilter filter)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BudgetBookFilter filter)? load,
    TResult Function(BudgetBookFilter filter)? applyFilter,
    TResult Function(BudgetBookFilter filter)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load<T> value) load,
    required TResult Function(_ApplyFilter<T> value) applyFilter,
    required TResult Function(_Refresh<T> value) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load<T> value)? load,
    TResult? Function(_ApplyFilter<T> value)? applyFilter,
    TResult? Function(_Refresh<T> value)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load<T> value)? load,
    TResult Function(_ApplyFilter<T> value)? applyFilter,
    TResult Function(_Refresh<T> value)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PeriodPaginationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PeriodPaginationEventCopyWith<T, PeriodPaginationEvent<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeriodPaginationEventCopyWith<T, $Res> {
  factory $PeriodPaginationEventCopyWith(PeriodPaginationEvent<T> value,
          $Res Function(PeriodPaginationEvent<T>) then) =
      _$PeriodPaginationEventCopyWithImpl<T, $Res, PeriodPaginationEvent<T>>;
  @useResult
  $Res call({BudgetBookFilter filter});

  $BudgetBookFilterCopyWith<$Res> get filter;
}

/// @nodoc
class _$PeriodPaginationEventCopyWithImpl<T, $Res,
        $Val extends PeriodPaginationEvent<T>>
    implements $PeriodPaginationEventCopyWith<T, $Res> {
  _$PeriodPaginationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PeriodPaginationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_value.copyWith(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
    ) as $Val);
  }

  /// Create a copy of PeriodPaginationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BudgetBookFilterCopyWith<$Res> get filter {
    return $BudgetBookFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoadImplCopyWith<T, $Res>
    implements $PeriodPaginationEventCopyWith<T, $Res> {
  factory _$$LoadImplCopyWith(
          _$LoadImpl<T> value, $Res Function(_$LoadImpl<T>) then) =
      __$$LoadImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({BudgetBookFilter filter});

  @override
  $BudgetBookFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$LoadImplCopyWithImpl<T, $Res>
    extends _$PeriodPaginationEventCopyWithImpl<T, $Res, _$LoadImpl<T>>
    implements _$$LoadImplCopyWith<T, $Res> {
  __$$LoadImplCopyWithImpl(
      _$LoadImpl<T> _value, $Res Function(_$LoadImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PeriodPaginationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$LoadImpl<T>(
      null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
    ));
  }
}

/// @nodoc

class _$LoadImpl<T> implements _Load<T> {
  const _$LoadImpl(this.filter);

  @override
  final BudgetBookFilter filter;

  @override
  String toString() {
    return 'PeriodPaginationEvent<$T>.load(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadImpl<T> &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  /// Create a copy of PeriodPaginationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadImplCopyWith<T, _$LoadImpl<T>> get copyWith =>
      __$$LoadImplCopyWithImpl<T, _$LoadImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BudgetBookFilter filter) load,
    required TResult Function(BudgetBookFilter filter) applyFilter,
    required TResult Function(BudgetBookFilter filter) refresh,
  }) {
    return load(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BudgetBookFilter filter)? load,
    TResult? Function(BudgetBookFilter filter)? applyFilter,
    TResult? Function(BudgetBookFilter filter)? refresh,
  }) {
    return load?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BudgetBookFilter filter)? load,
    TResult Function(BudgetBookFilter filter)? applyFilter,
    TResult Function(BudgetBookFilter filter)? refresh,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load<T> value) load,
    required TResult Function(_ApplyFilter<T> value) applyFilter,
    required TResult Function(_Refresh<T> value) refresh,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load<T> value)? load,
    TResult? Function(_ApplyFilter<T> value)? applyFilter,
    TResult? Function(_Refresh<T> value)? refresh,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load<T> value)? load,
    TResult Function(_ApplyFilter<T> value)? applyFilter,
    TResult Function(_Refresh<T> value)? refresh,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load<T> implements PeriodPaginationEvent<T> {
  const factory _Load(final BudgetBookFilter filter) = _$LoadImpl<T>;

  @override
  BudgetBookFilter get filter;

  /// Create a copy of PeriodPaginationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadImplCopyWith<T, _$LoadImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApplyFilterImplCopyWith<T, $Res>
    implements $PeriodPaginationEventCopyWith<T, $Res> {
  factory _$$ApplyFilterImplCopyWith(_$ApplyFilterImpl<T> value,
          $Res Function(_$ApplyFilterImpl<T>) then) =
      __$$ApplyFilterImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({BudgetBookFilter filter});

  @override
  $BudgetBookFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$ApplyFilterImplCopyWithImpl<T, $Res>
    extends _$PeriodPaginationEventCopyWithImpl<T, $Res, _$ApplyFilterImpl<T>>
    implements _$$ApplyFilterImplCopyWith<T, $Res> {
  __$$ApplyFilterImplCopyWithImpl(
      _$ApplyFilterImpl<T> _value, $Res Function(_$ApplyFilterImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PeriodPaginationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$ApplyFilterImpl<T>(
      null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
    ));
  }
}

/// @nodoc

class _$ApplyFilterImpl<T> implements _ApplyFilter<T> {
  const _$ApplyFilterImpl(this.filter);

  @override
  final BudgetBookFilter filter;

  @override
  String toString() {
    return 'PeriodPaginationEvent<$T>.applyFilter(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplyFilterImpl<T> &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  /// Create a copy of PeriodPaginationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplyFilterImplCopyWith<T, _$ApplyFilterImpl<T>> get copyWith =>
      __$$ApplyFilterImplCopyWithImpl<T, _$ApplyFilterImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BudgetBookFilter filter) load,
    required TResult Function(BudgetBookFilter filter) applyFilter,
    required TResult Function(BudgetBookFilter filter) refresh,
  }) {
    return applyFilter(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BudgetBookFilter filter)? load,
    TResult? Function(BudgetBookFilter filter)? applyFilter,
    TResult? Function(BudgetBookFilter filter)? refresh,
  }) {
    return applyFilter?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BudgetBookFilter filter)? load,
    TResult Function(BudgetBookFilter filter)? applyFilter,
    TResult Function(BudgetBookFilter filter)? refresh,
    required TResult orElse(),
  }) {
    if (applyFilter != null) {
      return applyFilter(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load<T> value) load,
    required TResult Function(_ApplyFilter<T> value) applyFilter,
    required TResult Function(_Refresh<T> value) refresh,
  }) {
    return applyFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load<T> value)? load,
    TResult? Function(_ApplyFilter<T> value)? applyFilter,
    TResult? Function(_Refresh<T> value)? refresh,
  }) {
    return applyFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load<T> value)? load,
    TResult Function(_ApplyFilter<T> value)? applyFilter,
    TResult Function(_Refresh<T> value)? refresh,
    required TResult orElse(),
  }) {
    if (applyFilter != null) {
      return applyFilter(this);
    }
    return orElse();
  }
}

abstract class _ApplyFilter<T> implements PeriodPaginationEvent<T> {
  const factory _ApplyFilter(final BudgetBookFilter filter) =
      _$ApplyFilterImpl<T>;

  @override
  BudgetBookFilter get filter;

  /// Create a copy of PeriodPaginationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplyFilterImplCopyWith<T, _$ApplyFilterImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<T, $Res>
    implements $PeriodPaginationEventCopyWith<T, $Res> {
  factory _$$RefreshImplCopyWith(
          _$RefreshImpl<T> value, $Res Function(_$RefreshImpl<T>) then) =
      __$$RefreshImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({BudgetBookFilter filter});

  @override
  $BudgetBookFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<T, $Res>
    extends _$PeriodPaginationEventCopyWithImpl<T, $Res, _$RefreshImpl<T>>
    implements _$$RefreshImplCopyWith<T, $Res> {
  __$$RefreshImplCopyWithImpl(
      _$RefreshImpl<T> _value, $Res Function(_$RefreshImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PeriodPaginationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$RefreshImpl<T>(
      null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
    ));
  }
}

/// @nodoc

class _$RefreshImpl<T> implements _Refresh<T> {
  const _$RefreshImpl(this.filter);

  @override
  final BudgetBookFilter filter;

  @override
  String toString() {
    return 'PeriodPaginationEvent<$T>.refresh(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshImpl<T> &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  /// Create a copy of PeriodPaginationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshImplCopyWith<T, _$RefreshImpl<T>> get copyWith =>
      __$$RefreshImplCopyWithImpl<T, _$RefreshImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BudgetBookFilter filter) load,
    required TResult Function(BudgetBookFilter filter) applyFilter,
    required TResult Function(BudgetBookFilter filter) refresh,
  }) {
    return refresh(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BudgetBookFilter filter)? load,
    TResult? Function(BudgetBookFilter filter)? applyFilter,
    TResult? Function(BudgetBookFilter filter)? refresh,
  }) {
    return refresh?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BudgetBookFilter filter)? load,
    TResult Function(BudgetBookFilter filter)? applyFilter,
    TResult Function(BudgetBookFilter filter)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load<T> value) load,
    required TResult Function(_ApplyFilter<T> value) applyFilter,
    required TResult Function(_Refresh<T> value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load<T> value)? load,
    TResult? Function(_ApplyFilter<T> value)? applyFilter,
    TResult? Function(_Refresh<T> value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load<T> value)? load,
    TResult Function(_ApplyFilter<T> value)? applyFilter,
    TResult Function(_Refresh<T> value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh<T> implements PeriodPaginationEvent<T> {
  const factory _Refresh(final BudgetBookFilter filter) = _$RefreshImpl<T>;

  @override
  BudgetBookFilter get filter;

  /// Create a copy of PeriodPaginationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshImplCopyWith<T, _$RefreshImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PeriodPaginationState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<T> items, bool isFirstFetch) loading,
    required TResult Function(List<T> items, bool hasReachedMax) loaded,
    required TResult Function() empty,
    required TResult Function(String message, List<T> items) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<T> items, bool isFirstFetch)? loading,
    TResult? Function(List<T> items, bool hasReachedMax)? loaded,
    TResult? Function()? empty,
    TResult? Function(String message, List<T> items)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<T> items, bool isFirstFetch)? loading,
    TResult Function(List<T> items, bool hasReachedMax)? loaded,
    TResult Function()? empty,
    TResult Function(String message, List<T> items)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Loaded<T> value) loaded,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Loaded<T> value)? loaded,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Error<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Loaded<T> value)? loaded,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeriodPaginationStateCopyWith<T, $Res> {
  factory $PeriodPaginationStateCopyWith(PeriodPaginationState<T> value,
          $Res Function(PeriodPaginationState<T>) then) =
      _$PeriodPaginationStateCopyWithImpl<T, $Res, PeriodPaginationState<T>>;
}

/// @nodoc
class _$PeriodPaginationStateCopyWithImpl<T, $Res,
        $Val extends PeriodPaginationState<T>>
    implements $PeriodPaginationStateCopyWith<T, $Res> {
  _$PeriodPaginationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PeriodPaginationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$PeriodPaginationStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PeriodPaginationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PeriodPaginationState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<T> items, bool isFirstFetch) loading,
    required TResult Function(List<T> items, bool hasReachedMax) loaded,
    required TResult Function() empty,
    required TResult Function(String message, List<T> items) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<T> items, bool isFirstFetch)? loading,
    TResult? Function(List<T> items, bool hasReachedMax)? loaded,
    TResult? Function()? empty,
    TResult? Function(String message, List<T> items)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<T> items, bool isFirstFetch)? loading,
    TResult Function(List<T> items, bool hasReachedMax)? loaded,
    TResult Function()? empty,
    TResult Function(String message, List<T> items)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Loaded<T> value) loaded,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Error<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Loaded<T> value)? loaded,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Error<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Loaded<T> value)? loaded,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements PeriodPaginationState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<T, $Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl<T> value, $Res Function(_$LoadingImpl<T>) then) =
      __$$LoadingImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<T> items, bool isFirstFetch});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<T, $Res>
    extends _$PeriodPaginationStateCopyWithImpl<T, $Res, _$LoadingImpl<T>>
    implements _$$LoadingImplCopyWith<T, $Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl<T> _value, $Res Function(_$LoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PeriodPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? isFirstFetch = null,
  }) {
    return _then(_$LoadingImpl<T>(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      isFirstFetch: null == isFirstFetch
          ? _value.isFirstFetch
          : isFirstFetch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadingImpl<T> implements _Loading<T> {
  const _$LoadingImpl(
      {required final List<T> items, required this.isFirstFetch})
      : _items = items;

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final bool isFirstFetch;

  @override
  String toString() {
    return 'PeriodPaginationState<$T>.loading(items: $items, isFirstFetch: $isFirstFetch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.isFirstFetch, isFirstFetch) ||
                other.isFirstFetch == isFirstFetch));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), isFirstFetch);

  /// Create a copy of PeriodPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<T, _$LoadingImpl<T>> get copyWith =>
      __$$LoadingImplCopyWithImpl<T, _$LoadingImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<T> items, bool isFirstFetch) loading,
    required TResult Function(List<T> items, bool hasReachedMax) loaded,
    required TResult Function() empty,
    required TResult Function(String message, List<T> items) error,
  }) {
    return loading(items, isFirstFetch);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<T> items, bool isFirstFetch)? loading,
    TResult? Function(List<T> items, bool hasReachedMax)? loaded,
    TResult? Function()? empty,
    TResult? Function(String message, List<T> items)? error,
  }) {
    return loading?.call(items, isFirstFetch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<T> items, bool isFirstFetch)? loading,
    TResult Function(List<T> items, bool hasReachedMax)? loaded,
    TResult Function()? empty,
    TResult Function(String message, List<T> items)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(items, isFirstFetch);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Loaded<T> value) loaded,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Error<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Loaded<T> value)? loaded,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Error<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Loaded<T> value)? loaded,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading<T> implements PeriodPaginationState<T> {
  const factory _Loading(
      {required final List<T> items,
      required final bool isFirstFetch}) = _$LoadingImpl<T>;

  List<T> get items;
  bool get isFirstFetch;

  /// Create a copy of PeriodPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<T, _$LoadingImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<T, $Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl<T> value, $Res Function(_$LoadedImpl<T>) then) =
      __$$LoadedImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<T> items, bool hasReachedMax});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<T, $Res>
    extends _$PeriodPaginationStateCopyWithImpl<T, $Res, _$LoadedImpl<T>>
    implements _$$LoadedImplCopyWith<T, $Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl<T> _value, $Res Function(_$LoadedImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PeriodPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? hasReachedMax = null,
  }) {
    return _then(_$LoadedImpl<T>(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadedImpl<T> implements _Loaded<T> {
  const _$LoadedImpl(
      {required final List<T> items, required this.hasReachedMax})
      : _items = items;

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final bool hasReachedMax;

  @override
  String toString() {
    return 'PeriodPaginationState<$T>.loaded(items: $items, hasReachedMax: $hasReachedMax)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), hasReachedMax);

  /// Create a copy of PeriodPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<T, _$LoadedImpl<T>> get copyWith =>
      __$$LoadedImplCopyWithImpl<T, _$LoadedImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<T> items, bool isFirstFetch) loading,
    required TResult Function(List<T> items, bool hasReachedMax) loaded,
    required TResult Function() empty,
    required TResult Function(String message, List<T> items) error,
  }) {
    return loaded(items, hasReachedMax);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<T> items, bool isFirstFetch)? loading,
    TResult? Function(List<T> items, bool hasReachedMax)? loaded,
    TResult? Function()? empty,
    TResult? Function(String message, List<T> items)? error,
  }) {
    return loaded?.call(items, hasReachedMax);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<T> items, bool isFirstFetch)? loading,
    TResult Function(List<T> items, bool hasReachedMax)? loaded,
    TResult Function()? empty,
    TResult Function(String message, List<T> items)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(items, hasReachedMax);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Loaded<T> value) loaded,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Error<T> value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Loaded<T> value)? loaded,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Error<T> value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Loaded<T> value)? loaded,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded<T> implements PeriodPaginationState<T> {
  const factory _Loaded(
      {required final List<T> items,
      required final bool hasReachedMax}) = _$LoadedImpl<T>;

  List<T> get items;
  bool get hasReachedMax;

  /// Create a copy of PeriodPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<T, _$LoadedImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyImplCopyWith<T, $Res> {
  factory _$$EmptyImplCopyWith(
          _$EmptyImpl<T> value, $Res Function(_$EmptyImpl<T>) then) =
      __$$EmptyImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$EmptyImplCopyWithImpl<T, $Res>
    extends _$PeriodPaginationStateCopyWithImpl<T, $Res, _$EmptyImpl<T>>
    implements _$$EmptyImplCopyWith<T, $Res> {
  __$$EmptyImplCopyWithImpl(
      _$EmptyImpl<T> _value, $Res Function(_$EmptyImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PeriodPaginationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EmptyImpl<T> implements _Empty<T> {
  const _$EmptyImpl();

  @override
  String toString() {
    return 'PeriodPaginationState<$T>.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<T> items, bool isFirstFetch) loading,
    required TResult Function(List<T> items, bool hasReachedMax) loaded,
    required TResult Function() empty,
    required TResult Function(String message, List<T> items) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<T> items, bool isFirstFetch)? loading,
    TResult? Function(List<T> items, bool hasReachedMax)? loaded,
    TResult? Function()? empty,
    TResult? Function(String message, List<T> items)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<T> items, bool isFirstFetch)? loading,
    TResult Function(List<T> items, bool hasReachedMax)? loaded,
    TResult Function()? empty,
    TResult Function(String message, List<T> items)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Loaded<T> value) loaded,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Error<T> value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Loaded<T> value)? loaded,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Error<T> value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Loaded<T> value)? loaded,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty<T> implements PeriodPaginationState<T> {
  const factory _Empty() = _$EmptyImpl<T>;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<T, $Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl<T> value, $Res Function(_$ErrorImpl<T>) then) =
      __$$ErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message, List<T> items});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<T, $Res>
    extends _$PeriodPaginationStateCopyWithImpl<T, $Res, _$ErrorImpl<T>>
    implements _$$ErrorImplCopyWith<T, $Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl<T> _value, $Res Function(_$ErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PeriodPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? items = null,
  }) {
    return _then(_$ErrorImpl<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$ErrorImpl<T> implements _Error<T> {
  const _$ErrorImpl({required this.message, required final List<T> items})
      : _items = items;

  @override
  final String message;
  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'PeriodPaginationState<$T>.error(message: $message, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_items));

  /// Create a copy of PeriodPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      __$$ErrorImplCopyWithImpl<T, _$ErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<T> items, bool isFirstFetch) loading,
    required TResult Function(List<T> items, bool hasReachedMax) loaded,
    required TResult Function() empty,
    required TResult Function(String message, List<T> items) error,
  }) {
    return error(message, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<T> items, bool isFirstFetch)? loading,
    TResult? Function(List<T> items, bool hasReachedMax)? loaded,
    TResult? Function()? empty,
    TResult? Function(String message, List<T> items)? error,
  }) {
    return error?.call(message, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<T> items, bool isFirstFetch)? loading,
    TResult Function(List<T> items, bool hasReachedMax)? loaded,
    TResult Function()? empty,
    TResult Function(String message, List<T> items)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Loaded<T> value) loaded,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Loaded<T> value)? loaded,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Loaded<T> value)? loaded,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error<T> implements PeriodPaginationState<T> {
  const factory _Error(
      {required final String message,
      required final List<T> items}) = _$ErrorImpl<T>;

  String get message;
  List<T> get items;

  /// Create a copy of PeriodPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
