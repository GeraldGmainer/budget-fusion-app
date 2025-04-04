// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_book_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BudgetBookState {
  List<BudgetViewData> get items => throw _privateConstructorUsedError;
  BudgetBookFilter get filter => throw _privateConstructorUsedError;
  BudgetViewMode get viewMode => throw _privateConstructorUsedError;
  PeriodMode get period => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BudgetViewData> items,
            BudgetBookFilter filter, BudgetViewMode viewMode, PeriodMode period)
        initial,
    required TResult Function(List<BudgetViewData> items,
            BudgetBookFilter filter, BudgetViewMode viewMode, PeriodMode period)
        loading,
    required TResult Function(List<BudgetViewData> items,
            BudgetBookFilter filter, BudgetViewMode viewMode, PeriodMode period)
        loaded,
    required TResult Function(
            List<BudgetViewData> items,
            BudgetBookFilter filter,
            BudgetViewMode viewMode,
            PeriodMode period,
            String message)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        initial,
    TResult? Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        loading,
    TResult? Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        loaded,
    TResult? Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period, String message)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        initial,
    TResult Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        loading,
    TResult Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        loaded,
    TResult Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period, String message)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of BudgetBookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetBookStateCopyWith<BudgetBookState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetBookStateCopyWith<$Res> {
  factory $BudgetBookStateCopyWith(
          BudgetBookState value, $Res Function(BudgetBookState) then) =
      _$BudgetBookStateCopyWithImpl<$Res, BudgetBookState>;
  @useResult
  $Res call(
      {List<BudgetViewData> items,
      BudgetBookFilter filter,
      BudgetViewMode viewMode,
      PeriodMode period});

  $BudgetBookFilterCopyWith<$Res> get filter;
}

/// @nodoc
class _$BudgetBookStateCopyWithImpl<$Res, $Val extends BudgetBookState>
    implements $BudgetBookStateCopyWith<$Res> {
  _$BudgetBookStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetBookState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? filter = null,
    Object? viewMode = null,
    Object? period = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BudgetViewData>,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
      viewMode: null == viewMode
          ? _value.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as BudgetViewMode,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as PeriodMode,
    ) as $Val);
  }

  /// Create a copy of BudgetBookState
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
abstract class _$$InitialImplCopyWith<$Res>
    implements $BudgetBookStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BudgetViewData> items,
      BudgetBookFilter filter,
      BudgetViewMode viewMode,
      PeriodMode period});

  @override
  $BudgetBookFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$BudgetBookStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetBookState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? filter = null,
    Object? viewMode = null,
    Object? period = null,
  }) {
    return _then(_$InitialImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BudgetViewData>,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
      viewMode: null == viewMode
          ? _value.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as BudgetViewMode,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as PeriodMode,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  _$InitialImpl(
      {final List<BudgetViewData> items = const [],
      required this.filter,
      this.viewMode = BudgetViewMode.summary,
      required this.period})
      : _items = items;

  final List<BudgetViewData> _items;
  @override
  @JsonKey()
  List<BudgetViewData> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final BudgetBookFilter filter;
  @override
  @JsonKey()
  final BudgetViewMode viewMode;
  @override
  final PeriodMode period;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.viewMode, viewMode) ||
                other.viewMode == viewMode) &&
            (identical(other.period, period) || other.period == period));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), filter, viewMode, period);

  /// Create a copy of BudgetBookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BudgetViewData> items,
            BudgetBookFilter filter, BudgetViewMode viewMode, PeriodMode period)
        initial,
    required TResult Function(List<BudgetViewData> items,
            BudgetBookFilter filter, BudgetViewMode viewMode, PeriodMode period)
        loading,
    required TResult Function(List<BudgetViewData> items,
            BudgetBookFilter filter, BudgetViewMode viewMode, PeriodMode period)
        loaded,
    required TResult Function(
            List<BudgetViewData> items,
            BudgetBookFilter filter,
            BudgetViewMode viewMode,
            PeriodMode period,
            String message)
        error,
  }) {
    return initial(items, filter, viewMode, period);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        initial,
    TResult? Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        loading,
    TResult? Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        loaded,
    TResult? Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period, String message)?
        error,
  }) {
    return initial?.call(items, filter, viewMode, period);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        initial,
    TResult Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        loading,
    TResult Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        loaded,
    TResult Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period, String message)?
        error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(items, filter, viewMode, period);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements BudgetBookState {
  factory _Initial(
      {final List<BudgetViewData> items,
      required final BudgetBookFilter filter,
      final BudgetViewMode viewMode,
      required final PeriodMode period}) = _$InitialImpl;

  @override
  List<BudgetViewData> get items;
  @override
  BudgetBookFilter get filter;
  @override
  BudgetViewMode get viewMode;
  @override
  PeriodMode get period;

  /// Create a copy of BudgetBookState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $BudgetBookStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BudgetViewData> items,
      BudgetBookFilter filter,
      BudgetViewMode viewMode,
      PeriodMode period});

  @override
  $BudgetBookFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$BudgetBookStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetBookState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? filter = null,
    Object? viewMode = null,
    Object? period = null,
  }) {
    return _then(_$LoadingImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BudgetViewData>,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
      viewMode: null == viewMode
          ? _value.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as BudgetViewMode,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as PeriodMode,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(
      {required final List<BudgetViewData> items,
      required this.filter,
      required this.viewMode,
      required this.period})
      : _items = items;

  final List<BudgetViewData> _items;
  @override
  List<BudgetViewData> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final BudgetBookFilter filter;
  @override
  final BudgetViewMode viewMode;
  @override
  final PeriodMode period;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.viewMode, viewMode) ||
                other.viewMode == viewMode) &&
            (identical(other.period, period) || other.period == period));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), filter, viewMode, period);

  /// Create a copy of BudgetBookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BudgetViewData> items,
            BudgetBookFilter filter, BudgetViewMode viewMode, PeriodMode period)
        initial,
    required TResult Function(List<BudgetViewData> items,
            BudgetBookFilter filter, BudgetViewMode viewMode, PeriodMode period)
        loading,
    required TResult Function(List<BudgetViewData> items,
            BudgetBookFilter filter, BudgetViewMode viewMode, PeriodMode period)
        loaded,
    required TResult Function(
            List<BudgetViewData> items,
            BudgetBookFilter filter,
            BudgetViewMode viewMode,
            PeriodMode period,
            String message)
        error,
  }) {
    return loading(items, filter, viewMode, period);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        initial,
    TResult? Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        loading,
    TResult? Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        loaded,
    TResult? Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period, String message)?
        error,
  }) {
    return loading?.call(items, filter, viewMode, period);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        initial,
    TResult Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        loading,
    TResult Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        loaded,
    TResult Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period, String message)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(items, filter, viewMode, period);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements BudgetBookState {
  const factory _Loading(
      {required final List<BudgetViewData> items,
      required final BudgetBookFilter filter,
      required final BudgetViewMode viewMode,
      required final PeriodMode period}) = _$LoadingImpl;

  @override
  List<BudgetViewData> get items;
  @override
  BudgetBookFilter get filter;
  @override
  BudgetViewMode get viewMode;
  @override
  PeriodMode get period;

  /// Create a copy of BudgetBookState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res>
    implements $BudgetBookStateCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BudgetViewData> items,
      BudgetBookFilter filter,
      BudgetViewMode viewMode,
      PeriodMode period});

  @override
  $BudgetBookFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$BudgetBookStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetBookState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? filter = null,
    Object? viewMode = null,
    Object? period = null,
  }) {
    return _then(_$LoadedImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BudgetViewData>,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
      viewMode: null == viewMode
          ? _value.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as BudgetViewMode,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as PeriodMode,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required final List<BudgetViewData> items,
      required this.filter,
      required this.viewMode,
      required this.period})
      : _items = items;

  final List<BudgetViewData> _items;
  @override
  List<BudgetViewData> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final BudgetBookFilter filter;
  @override
  final BudgetViewMode viewMode;
  @override
  final PeriodMode period;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.viewMode, viewMode) ||
                other.viewMode == viewMode) &&
            (identical(other.period, period) || other.period == period));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), filter, viewMode, period);

  /// Create a copy of BudgetBookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BudgetViewData> items,
            BudgetBookFilter filter, BudgetViewMode viewMode, PeriodMode period)
        initial,
    required TResult Function(List<BudgetViewData> items,
            BudgetBookFilter filter, BudgetViewMode viewMode, PeriodMode period)
        loading,
    required TResult Function(List<BudgetViewData> items,
            BudgetBookFilter filter, BudgetViewMode viewMode, PeriodMode period)
        loaded,
    required TResult Function(
            List<BudgetViewData> items,
            BudgetBookFilter filter,
            BudgetViewMode viewMode,
            PeriodMode period,
            String message)
        error,
  }) {
    return loaded(items, filter, viewMode, period);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        initial,
    TResult? Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        loading,
    TResult? Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        loaded,
    TResult? Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period, String message)?
        error,
  }) {
    return loaded?.call(items, filter, viewMode, period);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        initial,
    TResult Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        loading,
    TResult Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        loaded,
    TResult Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period, String message)?
        error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(items, filter, viewMode, period);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements BudgetBookState {
  const factory _Loaded(
      {required final List<BudgetViewData> items,
      required final BudgetBookFilter filter,
      required final BudgetViewMode viewMode,
      required final PeriodMode period}) = _$LoadedImpl;

  @override
  List<BudgetViewData> get items;
  @override
  BudgetBookFilter get filter;
  @override
  BudgetViewMode get viewMode;
  @override
  PeriodMode get period;

  /// Create a copy of BudgetBookState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $BudgetBookStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BudgetViewData> items,
      BudgetBookFilter filter,
      BudgetViewMode viewMode,
      PeriodMode period,
      String message});

  @override
  $BudgetBookFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$BudgetBookStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetBookState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? filter = null,
    Object? viewMode = null,
    Object? period = null,
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BudgetViewData>,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
      viewMode: null == viewMode
          ? _value.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as BudgetViewMode,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as PeriodMode,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(
      {required final List<BudgetViewData> items,
      required this.filter,
      required this.viewMode,
      required this.period,
      required this.message})
      : _items = items;

  final List<BudgetViewData> _items;
  @override
  List<BudgetViewData> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final BudgetBookFilter filter;
  @override
  final BudgetViewMode viewMode;
  @override
  final PeriodMode period;
  @override
  final String message;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.viewMode, viewMode) ||
                other.viewMode == viewMode) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      filter,
      viewMode,
      period,
      message);

  /// Create a copy of BudgetBookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BudgetViewData> items,
            BudgetBookFilter filter, BudgetViewMode viewMode, PeriodMode period)
        initial,
    required TResult Function(List<BudgetViewData> items,
            BudgetBookFilter filter, BudgetViewMode viewMode, PeriodMode period)
        loading,
    required TResult Function(List<BudgetViewData> items,
            BudgetBookFilter filter, BudgetViewMode viewMode, PeriodMode period)
        loaded,
    required TResult Function(
            List<BudgetViewData> items,
            BudgetBookFilter filter,
            BudgetViewMode viewMode,
            PeriodMode period,
            String message)
        error,
  }) {
    return error(items, filter, viewMode, period, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        initial,
    TResult? Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        loading,
    TResult? Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        loaded,
    TResult? Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period, String message)?
        error,
  }) {
    return error?.call(items, filter, viewMode, period, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        initial,
    TResult Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        loading,
    TResult Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period)?
        loaded,
    TResult Function(List<BudgetViewData> items, BudgetBookFilter filter,
            BudgetViewMode viewMode, PeriodMode period, String message)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(items, filter, viewMode, period, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements BudgetBookState {
  const factory _Error(
      {required final List<BudgetViewData> items,
      required final BudgetBookFilter filter,
      required final BudgetViewMode viewMode,
      required final PeriodMode period,
      required final String message}) = _$ErrorImpl;

  @override
  List<BudgetViewData> get items;
  @override
  BudgetBookFilter get filter;
  @override
  BudgetViewMode get viewMode;
  @override
  PeriodMode get period;
  String get message;

  /// Create a copy of BudgetBookState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
