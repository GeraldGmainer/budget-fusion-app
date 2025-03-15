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
  List<BudgetPageData> get rawItems => throw _privateConstructorUsedError;
  List<SummaryViewData> get summaries => throw _privateConstructorUsedError;
  BudgetBookFilter get currentFilter => throw _privateConstructorUsedError;
  BudgetViewMode get currentViewMode => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)
        initial,
    required TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)
        loading,
    required TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)
        loaded,
    required TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode,
            String message)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        initial,
    TResult? Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        loading,
    TResult? Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        loaded,
    TResult? Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode,
            String message)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        initial,
    TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        loading,
    TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        loaded,
    TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode,
            String message)?
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
      {List<BudgetPageData> rawItems,
      List<SummaryViewData> summaries,
      BudgetBookFilter currentFilter,
      BudgetViewMode currentViewMode});

  $BudgetBookFilterCopyWith<$Res> get currentFilter;
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
    Object? rawItems = null,
    Object? summaries = null,
    Object? currentFilter = null,
    Object? currentViewMode = null,
  }) {
    return _then(_value.copyWith(
      rawItems: null == rawItems
          ? _value.rawItems
          : rawItems // ignore: cast_nullable_to_non_nullable
              as List<BudgetPageData>,
      summaries: null == summaries
          ? _value.summaries
          : summaries // ignore: cast_nullable_to_non_nullable
              as List<SummaryViewData>,
      currentFilter: null == currentFilter
          ? _value.currentFilter
          : currentFilter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
      currentViewMode: null == currentViewMode
          ? _value.currentViewMode
          : currentViewMode // ignore: cast_nullable_to_non_nullable
              as BudgetViewMode,
    ) as $Val);
  }

  /// Create a copy of BudgetBookState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BudgetBookFilterCopyWith<$Res> get currentFilter {
    return $BudgetBookFilterCopyWith<$Res>(_value.currentFilter, (value) {
      return _then(_value.copyWith(currentFilter: value) as $Val);
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
      {List<BudgetPageData> rawItems,
      List<SummaryViewData> summaries,
      BudgetBookFilter currentFilter,
      BudgetViewMode currentViewMode});

  @override
  $BudgetBookFilterCopyWith<$Res> get currentFilter;
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
    Object? rawItems = null,
    Object? summaries = null,
    Object? currentFilter = null,
    Object? currentViewMode = null,
  }) {
    return _then(_$InitialImpl(
      rawItems: null == rawItems
          ? _value._rawItems
          : rawItems // ignore: cast_nullable_to_non_nullable
              as List<BudgetPageData>,
      summaries: null == summaries
          ? _value._summaries
          : summaries // ignore: cast_nullable_to_non_nullable
              as List<SummaryViewData>,
      currentFilter: null == currentFilter
          ? _value.currentFilter
          : currentFilter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
      currentViewMode: null == currentViewMode
          ? _value.currentViewMode
          : currentViewMode // ignore: cast_nullable_to_non_nullable
              as BudgetViewMode,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<BudgetPageData> rawItems = const [],
      final List<SummaryViewData> summaries = const [],
      required this.currentFilter,
      required this.currentViewMode})
      : _rawItems = rawItems,
        _summaries = summaries;

  final List<BudgetPageData> _rawItems;
  @override
  @JsonKey()
  List<BudgetPageData> get rawItems {
    if (_rawItems is EqualUnmodifiableListView) return _rawItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rawItems);
  }

  final List<SummaryViewData> _summaries;
  @override
  @JsonKey()
  List<SummaryViewData> get summaries {
    if (_summaries is EqualUnmodifiableListView) return _summaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_summaries);
  }

  @override
  final BudgetBookFilter currentFilter;
  @override
  final BudgetViewMode currentViewMode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._rawItems, _rawItems) &&
            const DeepCollectionEquality()
                .equals(other._summaries, _summaries) &&
            (identical(other.currentFilter, currentFilter) ||
                other.currentFilter == currentFilter) &&
            (identical(other.currentViewMode, currentViewMode) ||
                other.currentViewMode == currentViewMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_rawItems),
      const DeepCollectionEquality().hash(_summaries),
      currentFilter,
      currentViewMode);

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
    required TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)
        initial,
    required TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)
        loading,
    required TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)
        loaded,
    required TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode,
            String message)
        error,
  }) {
    return initial(rawItems, summaries, currentFilter, currentViewMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        initial,
    TResult? Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        loading,
    TResult? Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        loaded,
    TResult? Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode,
            String message)?
        error,
  }) {
    return initial?.call(rawItems, summaries, currentFilter, currentViewMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        initial,
    TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        loading,
    TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        loaded,
    TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode,
            String message)?
        error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(rawItems, summaries, currentFilter, currentViewMode);
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
  const factory _Initial(
      {final List<BudgetPageData> rawItems,
      final List<SummaryViewData> summaries,
      required final BudgetBookFilter currentFilter,
      required final BudgetViewMode currentViewMode}) = _$InitialImpl;

  @override
  List<BudgetPageData> get rawItems;
  @override
  List<SummaryViewData> get summaries;
  @override
  BudgetBookFilter get currentFilter;
  @override
  BudgetViewMode get currentViewMode;

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
      {List<BudgetPageData> rawItems,
      List<SummaryViewData> summaries,
      BudgetBookFilter currentFilter,
      BudgetViewMode currentViewMode});

  @override
  $BudgetBookFilterCopyWith<$Res> get currentFilter;
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
    Object? rawItems = null,
    Object? summaries = null,
    Object? currentFilter = null,
    Object? currentViewMode = null,
  }) {
    return _then(_$LoadingImpl(
      rawItems: null == rawItems
          ? _value._rawItems
          : rawItems // ignore: cast_nullable_to_non_nullable
              as List<BudgetPageData>,
      summaries: null == summaries
          ? _value._summaries
          : summaries // ignore: cast_nullable_to_non_nullable
              as List<SummaryViewData>,
      currentFilter: null == currentFilter
          ? _value.currentFilter
          : currentFilter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
      currentViewMode: null == currentViewMode
          ? _value.currentViewMode
          : currentViewMode // ignore: cast_nullable_to_non_nullable
              as BudgetViewMode,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(
      {required final List<BudgetPageData> rawItems,
      required final List<SummaryViewData> summaries,
      required this.currentFilter,
      required this.currentViewMode})
      : _rawItems = rawItems,
        _summaries = summaries;

  final List<BudgetPageData> _rawItems;
  @override
  List<BudgetPageData> get rawItems {
    if (_rawItems is EqualUnmodifiableListView) return _rawItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rawItems);
  }

  final List<SummaryViewData> _summaries;
  @override
  List<SummaryViewData> get summaries {
    if (_summaries is EqualUnmodifiableListView) return _summaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_summaries);
  }

  @override
  final BudgetBookFilter currentFilter;
  @override
  final BudgetViewMode currentViewMode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            const DeepCollectionEquality().equals(other._rawItems, _rawItems) &&
            const DeepCollectionEquality()
                .equals(other._summaries, _summaries) &&
            (identical(other.currentFilter, currentFilter) ||
                other.currentFilter == currentFilter) &&
            (identical(other.currentViewMode, currentViewMode) ||
                other.currentViewMode == currentViewMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_rawItems),
      const DeepCollectionEquality().hash(_summaries),
      currentFilter,
      currentViewMode);

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
    required TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)
        initial,
    required TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)
        loading,
    required TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)
        loaded,
    required TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode,
            String message)
        error,
  }) {
    return loading(rawItems, summaries, currentFilter, currentViewMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        initial,
    TResult? Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        loading,
    TResult? Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        loaded,
    TResult? Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode,
            String message)?
        error,
  }) {
    return loading?.call(rawItems, summaries, currentFilter, currentViewMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        initial,
    TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        loading,
    TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        loaded,
    TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode,
            String message)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(rawItems, summaries, currentFilter, currentViewMode);
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
      {required final List<BudgetPageData> rawItems,
      required final List<SummaryViewData> summaries,
      required final BudgetBookFilter currentFilter,
      required final BudgetViewMode currentViewMode}) = _$LoadingImpl;

  @override
  List<BudgetPageData> get rawItems;
  @override
  List<SummaryViewData> get summaries;
  @override
  BudgetBookFilter get currentFilter;
  @override
  BudgetViewMode get currentViewMode;

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
      {List<BudgetPageData> rawItems,
      List<SummaryViewData> summaries,
      BudgetBookFilter currentFilter,
      BudgetViewMode currentViewMode});

  @override
  $BudgetBookFilterCopyWith<$Res> get currentFilter;
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
    Object? rawItems = null,
    Object? summaries = null,
    Object? currentFilter = null,
    Object? currentViewMode = null,
  }) {
    return _then(_$LoadedImpl(
      rawItems: null == rawItems
          ? _value._rawItems
          : rawItems // ignore: cast_nullable_to_non_nullable
              as List<BudgetPageData>,
      summaries: null == summaries
          ? _value._summaries
          : summaries // ignore: cast_nullable_to_non_nullable
              as List<SummaryViewData>,
      currentFilter: null == currentFilter
          ? _value.currentFilter
          : currentFilter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
      currentViewMode: null == currentViewMode
          ? _value.currentViewMode
          : currentViewMode // ignore: cast_nullable_to_non_nullable
              as BudgetViewMode,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required final List<BudgetPageData> rawItems,
      required final List<SummaryViewData> summaries,
      required this.currentFilter,
      required this.currentViewMode})
      : _rawItems = rawItems,
        _summaries = summaries;

  final List<BudgetPageData> _rawItems;
  @override
  List<BudgetPageData> get rawItems {
    if (_rawItems is EqualUnmodifiableListView) return _rawItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rawItems);
  }

  final List<SummaryViewData> _summaries;
  @override
  List<SummaryViewData> get summaries {
    if (_summaries is EqualUnmodifiableListView) return _summaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_summaries);
  }

  @override
  final BudgetBookFilter currentFilter;
  @override
  final BudgetViewMode currentViewMode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._rawItems, _rawItems) &&
            const DeepCollectionEquality()
                .equals(other._summaries, _summaries) &&
            (identical(other.currentFilter, currentFilter) ||
                other.currentFilter == currentFilter) &&
            (identical(other.currentViewMode, currentViewMode) ||
                other.currentViewMode == currentViewMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_rawItems),
      const DeepCollectionEquality().hash(_summaries),
      currentFilter,
      currentViewMode);

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
    required TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)
        initial,
    required TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)
        loading,
    required TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)
        loaded,
    required TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode,
            String message)
        error,
  }) {
    return loaded(rawItems, summaries, currentFilter, currentViewMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        initial,
    TResult? Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        loading,
    TResult? Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        loaded,
    TResult? Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode,
            String message)?
        error,
  }) {
    return loaded?.call(rawItems, summaries, currentFilter, currentViewMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        initial,
    TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        loading,
    TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        loaded,
    TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode,
            String message)?
        error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(rawItems, summaries, currentFilter, currentViewMode);
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
      {required final List<BudgetPageData> rawItems,
      required final List<SummaryViewData> summaries,
      required final BudgetBookFilter currentFilter,
      required final BudgetViewMode currentViewMode}) = _$LoadedImpl;

  @override
  List<BudgetPageData> get rawItems;
  @override
  List<SummaryViewData> get summaries;
  @override
  BudgetBookFilter get currentFilter;
  @override
  BudgetViewMode get currentViewMode;

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
      {List<BudgetPageData> rawItems,
      List<SummaryViewData> summaries,
      BudgetBookFilter currentFilter,
      BudgetViewMode currentViewMode,
      String message});

  @override
  $BudgetBookFilterCopyWith<$Res> get currentFilter;
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
    Object? rawItems = null,
    Object? summaries = null,
    Object? currentFilter = null,
    Object? currentViewMode = null,
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      rawItems: null == rawItems
          ? _value._rawItems
          : rawItems // ignore: cast_nullable_to_non_nullable
              as List<BudgetPageData>,
      summaries: null == summaries
          ? _value._summaries
          : summaries // ignore: cast_nullable_to_non_nullable
              as List<SummaryViewData>,
      currentFilter: null == currentFilter
          ? _value.currentFilter
          : currentFilter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
      currentViewMode: null == currentViewMode
          ? _value.currentViewMode
          : currentViewMode // ignore: cast_nullable_to_non_nullable
              as BudgetViewMode,
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
      {required final List<BudgetPageData> rawItems,
      required final List<SummaryViewData> summaries,
      required this.currentFilter,
      required this.currentViewMode,
      required this.message})
      : _rawItems = rawItems,
        _summaries = summaries;

  final List<BudgetPageData> _rawItems;
  @override
  List<BudgetPageData> get rawItems {
    if (_rawItems is EqualUnmodifiableListView) return _rawItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rawItems);
  }

  final List<SummaryViewData> _summaries;
  @override
  List<SummaryViewData> get summaries {
    if (_summaries is EqualUnmodifiableListView) return _summaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_summaries);
  }

  @override
  final BudgetBookFilter currentFilter;
  @override
  final BudgetViewMode currentViewMode;
  @override
  final String message;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            const DeepCollectionEquality().equals(other._rawItems, _rawItems) &&
            const DeepCollectionEquality()
                .equals(other._summaries, _summaries) &&
            (identical(other.currentFilter, currentFilter) ||
                other.currentFilter == currentFilter) &&
            (identical(other.currentViewMode, currentViewMode) ||
                other.currentViewMode == currentViewMode) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_rawItems),
      const DeepCollectionEquality().hash(_summaries),
      currentFilter,
      currentViewMode,
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
    required TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)
        initial,
    required TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)
        loading,
    required TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)
        loaded,
    required TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode,
            String message)
        error,
  }) {
    return error(rawItems, summaries, currentFilter, currentViewMode, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        initial,
    TResult? Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        loading,
    TResult? Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        loaded,
    TResult? Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode,
            String message)?
        error,
  }) {
    return error?.call(
        rawItems, summaries, currentFilter, currentViewMode, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        initial,
    TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        loading,
    TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode)?
        loaded,
    TResult Function(
            List<BudgetPageData> rawItems,
            List<SummaryViewData> summaries,
            BudgetBookFilter currentFilter,
            BudgetViewMode currentViewMode,
            String message)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(
          rawItems, summaries, currentFilter, currentViewMode, message);
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
      {required final List<BudgetPageData> rawItems,
      required final List<SummaryViewData> summaries,
      required final BudgetBookFilter currentFilter,
      required final BudgetViewMode currentViewMode,
      required final String message}) = _$ErrorImpl;

  @override
  List<BudgetPageData> get rawItems;
  @override
  List<SummaryViewData> get summaries;
  @override
  BudgetBookFilter get currentFilter;
  @override
  BudgetViewMode get currentViewMode;
  String get message;

  /// Create a copy of BudgetBookState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
