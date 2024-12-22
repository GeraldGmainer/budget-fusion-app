// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookingPageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BudgetBookFilter filter, BookingViewMode viewMode)
        loadInitial,
    required TResult Function() loadMore,
    required TResult Function(
            BudgetBookFilter? filter, BookingViewMode? viewMode)
        updateView,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BudgetBookFilter filter, BookingViewMode viewMode)?
        loadInitial,
    TResult? Function()? loadMore,
    TResult? Function(BudgetBookFilter? filter, BookingViewMode? viewMode)?
        updateView,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BudgetBookFilter filter, BookingViewMode viewMode)?
        loadInitial,
    TResult Function()? loadMore,
    TResult Function(BudgetBookFilter? filter, BookingViewMode? viewMode)?
        updateView,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInitial value) loadInitial,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_UpdateView value) updateView,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInitial value)? loadInitial,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_UpdateView value)? updateView,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInitial value)? loadInitial,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_UpdateView value)? updateView,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingPageEventCopyWith<$Res> {
  factory $BookingPageEventCopyWith(
          BookingPageEvent value, $Res Function(BookingPageEvent) then) =
      _$BookingPageEventCopyWithImpl<$Res, BookingPageEvent>;
}

/// @nodoc
class _$BookingPageEventCopyWithImpl<$Res, $Val extends BookingPageEvent>
    implements $BookingPageEventCopyWith<$Res> {
  _$BookingPageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingPageEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadInitialImplCopyWith<$Res> {
  factory _$$LoadInitialImplCopyWith(
          _$LoadInitialImpl value, $Res Function(_$LoadInitialImpl) then) =
      __$$LoadInitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BudgetBookFilter filter, BookingViewMode viewMode});
}

/// @nodoc
class __$$LoadInitialImplCopyWithImpl<$Res>
    extends _$BookingPageEventCopyWithImpl<$Res, _$LoadInitialImpl>
    implements _$$LoadInitialImplCopyWith<$Res> {
  __$$LoadInitialImplCopyWithImpl(
      _$LoadInitialImpl _value, $Res Function(_$LoadInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
    Object? viewMode = null,
  }) {
    return _then(_$LoadInitialImpl(
      null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
      null == viewMode
          ? _value.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as BookingViewMode,
    ));
  }
}

/// @nodoc

class _$LoadInitialImpl implements _LoadInitial {
  const _$LoadInitialImpl(this.filter, this.viewMode);

  @override
  final BudgetBookFilter filter;
  @override
  final BookingViewMode viewMode;

  @override
  String toString() {
    return 'BookingPageEvent.loadInitial(filter: $filter, viewMode: $viewMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadInitialImpl &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.viewMode, viewMode) ||
                other.viewMode == viewMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter, viewMode);

  /// Create a copy of BookingPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadInitialImplCopyWith<_$LoadInitialImpl> get copyWith =>
      __$$LoadInitialImplCopyWithImpl<_$LoadInitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BudgetBookFilter filter, BookingViewMode viewMode)
        loadInitial,
    required TResult Function() loadMore,
    required TResult Function(
            BudgetBookFilter? filter, BookingViewMode? viewMode)
        updateView,
  }) {
    return loadInitial(filter, viewMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BudgetBookFilter filter, BookingViewMode viewMode)?
        loadInitial,
    TResult? Function()? loadMore,
    TResult? Function(BudgetBookFilter? filter, BookingViewMode? viewMode)?
        updateView,
  }) {
    return loadInitial?.call(filter, viewMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BudgetBookFilter filter, BookingViewMode viewMode)?
        loadInitial,
    TResult Function()? loadMore,
    TResult Function(BudgetBookFilter? filter, BookingViewMode? viewMode)?
        updateView,
    required TResult orElse(),
  }) {
    if (loadInitial != null) {
      return loadInitial(filter, viewMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInitial value) loadInitial,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_UpdateView value) updateView,
  }) {
    return loadInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInitial value)? loadInitial,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_UpdateView value)? updateView,
  }) {
    return loadInitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInitial value)? loadInitial,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_UpdateView value)? updateView,
    required TResult orElse(),
  }) {
    if (loadInitial != null) {
      return loadInitial(this);
    }
    return orElse();
  }
}

abstract class _LoadInitial implements BookingPageEvent {
  const factory _LoadInitial(
          final BudgetBookFilter filter, final BookingViewMode viewMode) =
      _$LoadInitialImpl;

  BudgetBookFilter get filter;
  BookingViewMode get viewMode;

  /// Create a copy of BookingPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadInitialImplCopyWith<_$LoadInitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreImplCopyWith<$Res> {
  factory _$$LoadMoreImplCopyWith(
          _$LoadMoreImpl value, $Res Function(_$LoadMoreImpl) then) =
      __$$LoadMoreImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreImplCopyWithImpl<$Res>
    extends _$BookingPageEventCopyWithImpl<$Res, _$LoadMoreImpl>
    implements _$$LoadMoreImplCopyWith<$Res> {
  __$$LoadMoreImplCopyWithImpl(
      _$LoadMoreImpl _value, $Res Function(_$LoadMoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingPageEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadMoreImpl implements _LoadMore {
  const _$LoadMoreImpl();

  @override
  String toString() {
    return 'BookingPageEvent.loadMore()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMoreImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BudgetBookFilter filter, BookingViewMode viewMode)
        loadInitial,
    required TResult Function() loadMore,
    required TResult Function(
            BudgetBookFilter? filter, BookingViewMode? viewMode)
        updateView,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BudgetBookFilter filter, BookingViewMode viewMode)?
        loadInitial,
    TResult? Function()? loadMore,
    TResult? Function(BudgetBookFilter? filter, BookingViewMode? viewMode)?
        updateView,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BudgetBookFilter filter, BookingViewMode viewMode)?
        loadInitial,
    TResult Function()? loadMore,
    TResult Function(BudgetBookFilter? filter, BookingViewMode? viewMode)?
        updateView,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInitial value) loadInitial,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_UpdateView value) updateView,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInitial value)? loadInitial,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_UpdateView value)? updateView,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInitial value)? loadInitial,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_UpdateView value)? updateView,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements BookingPageEvent {
  const factory _LoadMore() = _$LoadMoreImpl;
}

/// @nodoc
abstract class _$$UpdateViewImplCopyWith<$Res> {
  factory _$$UpdateViewImplCopyWith(
          _$UpdateViewImpl value, $Res Function(_$UpdateViewImpl) then) =
      __$$UpdateViewImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BudgetBookFilter? filter, BookingViewMode? viewMode});
}

/// @nodoc
class __$$UpdateViewImplCopyWithImpl<$Res>
    extends _$BookingPageEventCopyWithImpl<$Res, _$UpdateViewImpl>
    implements _$$UpdateViewImplCopyWith<$Res> {
  __$$UpdateViewImplCopyWithImpl(
      _$UpdateViewImpl _value, $Res Function(_$UpdateViewImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = freezed,
    Object? viewMode = freezed,
  }) {
    return _then(_$UpdateViewImpl(
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter?,
      viewMode: freezed == viewMode
          ? _value.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as BookingViewMode?,
    ));
  }
}

/// @nodoc

class _$UpdateViewImpl implements _UpdateView {
  const _$UpdateViewImpl({this.filter, this.viewMode});

  @override
  final BudgetBookFilter? filter;
  @override
  final BookingViewMode? viewMode;

  @override
  String toString() {
    return 'BookingPageEvent.updateView(filter: $filter, viewMode: $viewMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateViewImpl &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.viewMode, viewMode) ||
                other.viewMode == viewMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter, viewMode);

  /// Create a copy of BookingPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateViewImplCopyWith<_$UpdateViewImpl> get copyWith =>
      __$$UpdateViewImplCopyWithImpl<_$UpdateViewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BudgetBookFilter filter, BookingViewMode viewMode)
        loadInitial,
    required TResult Function() loadMore,
    required TResult Function(
            BudgetBookFilter? filter, BookingViewMode? viewMode)
        updateView,
  }) {
    return updateView(filter, viewMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BudgetBookFilter filter, BookingViewMode viewMode)?
        loadInitial,
    TResult? Function()? loadMore,
    TResult? Function(BudgetBookFilter? filter, BookingViewMode? viewMode)?
        updateView,
  }) {
    return updateView?.call(filter, viewMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BudgetBookFilter filter, BookingViewMode viewMode)?
        loadInitial,
    TResult Function()? loadMore,
    TResult Function(BudgetBookFilter? filter, BookingViewMode? viewMode)?
        updateView,
    required TResult orElse(),
  }) {
    if (updateView != null) {
      return updateView(filter, viewMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInitial value) loadInitial,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_UpdateView value) updateView,
  }) {
    return updateView(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInitial value)? loadInitial,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_UpdateView value)? updateView,
  }) {
    return updateView?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInitial value)? loadInitial,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_UpdateView value)? updateView,
    required TResult orElse(),
  }) {
    if (updateView != null) {
      return updateView(this);
    }
    return orElse();
  }
}

abstract class _UpdateView implements BookingPageEvent {
  const factory _UpdateView(
      {final BudgetBookFilter? filter,
      final BookingViewMode? viewMode}) = _$UpdateViewImpl;

  BudgetBookFilter? get filter;
  BookingViewMode? get viewMode;

  /// Create a copy of BookingPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateViewImplCopyWith<_$UpdateViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BookingPageState {
  List<BookingPageData> get rawItems => throw _privateConstructorUsedError;
  List<BookingPageViewData> get viewItems => throw _privateConstructorUsedError;
  BudgetBookFilter get currentFilter => throw _privateConstructorUsedError;
  BookingViewMode get currentViewMode => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)
        initial,
    required TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool isFirstFetch,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)
        loading,
    required TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool hasReachedMax,
            bool isInitial,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)
        loaded,
    required TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            String message,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        initial,
    TResult? Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool isFirstFetch,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        loading,
    TResult? Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool hasReachedMax,
            bool isInitial,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        loaded,
    TResult? Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            String message,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        initial,
    TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool isFirstFetch,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        loading,
    TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool hasReachedMax,
            bool isInitial,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        loaded,
    TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            String message,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
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

  /// Create a copy of BookingPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingPageStateCopyWith<BookingPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingPageStateCopyWith<$Res> {
  factory $BookingPageStateCopyWith(
          BookingPageState value, $Res Function(BookingPageState) then) =
      _$BookingPageStateCopyWithImpl<$Res, BookingPageState>;
  @useResult
  $Res call(
      {List<BookingPageData> rawItems,
      List<BookingPageViewData> viewItems,
      BudgetBookFilter currentFilter,
      BookingViewMode currentViewMode});
}

/// @nodoc
class _$BookingPageStateCopyWithImpl<$Res, $Val extends BookingPageState>
    implements $BookingPageStateCopyWith<$Res> {
  _$BookingPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawItems = null,
    Object? viewItems = null,
    Object? currentFilter = null,
    Object? currentViewMode = null,
  }) {
    return _then(_value.copyWith(
      rawItems: null == rawItems
          ? _value.rawItems
          : rawItems // ignore: cast_nullable_to_non_nullable
              as List<BookingPageData>,
      viewItems: null == viewItems
          ? _value.viewItems
          : viewItems // ignore: cast_nullable_to_non_nullable
              as List<BookingPageViewData>,
      currentFilter: null == currentFilter
          ? _value.currentFilter
          : currentFilter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
      currentViewMode: null == currentViewMode
          ? _value.currentViewMode
          : currentViewMode // ignore: cast_nullable_to_non_nullable
              as BookingViewMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $BookingPageStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BookingPageData> rawItems,
      List<BookingPageViewData> viewItems,
      BudgetBookFilter currentFilter,
      BookingViewMode currentViewMode});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$BookingPageStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawItems = null,
    Object? viewItems = null,
    Object? currentFilter = null,
    Object? currentViewMode = null,
  }) {
    return _then(_$InitialImpl(
      rawItems: null == rawItems
          ? _value._rawItems
          : rawItems // ignore: cast_nullable_to_non_nullable
              as List<BookingPageData>,
      viewItems: null == viewItems
          ? _value._viewItems
          : viewItems // ignore: cast_nullable_to_non_nullable
              as List<BookingPageViewData>,
      currentFilter: null == currentFilter
          ? _value.currentFilter
          : currentFilter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
      currentViewMode: null == currentViewMode
          ? _value.currentViewMode
          : currentViewMode // ignore: cast_nullable_to_non_nullable
              as BookingViewMode,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl(
      {required final List<BookingPageData> rawItems,
      required final List<BookingPageViewData> viewItems,
      required this.currentFilter,
      required this.currentViewMode})
      : _rawItems = rawItems,
        _viewItems = viewItems,
        super._();

  final List<BookingPageData> _rawItems;
  @override
  List<BookingPageData> get rawItems {
    if (_rawItems is EqualUnmodifiableListView) return _rawItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rawItems);
  }

  final List<BookingPageViewData> _viewItems;
  @override
  List<BookingPageViewData> get viewItems {
    if (_viewItems is EqualUnmodifiableListView) return _viewItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_viewItems);
  }

  @override
  final BudgetBookFilter currentFilter;
  @override
  final BookingViewMode currentViewMode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._rawItems, _rawItems) &&
            const DeepCollectionEquality()
                .equals(other._viewItems, _viewItems) &&
            (identical(other.currentFilter, currentFilter) ||
                other.currentFilter == currentFilter) &&
            (identical(other.currentViewMode, currentViewMode) ||
                other.currentViewMode == currentViewMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_rawItems),
      const DeepCollectionEquality().hash(_viewItems),
      currentFilter,
      currentViewMode);

  /// Create a copy of BookingPageState
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
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)
        initial,
    required TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool isFirstFetch,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)
        loading,
    required TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool hasReachedMax,
            bool isInitial,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)
        loaded,
    required TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            String message,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)
        error,
  }) {
    return initial(rawItems, viewItems, currentFilter, currentViewMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        initial,
    TResult? Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool isFirstFetch,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        loading,
    TResult? Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool hasReachedMax,
            bool isInitial,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        loaded,
    TResult? Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            String message,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        error,
  }) {
    return initial?.call(rawItems, viewItems, currentFilter, currentViewMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        initial,
    TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool isFirstFetch,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        loading,
    TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool hasReachedMax,
            bool isInitial,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        loaded,
    TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            String message,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(rawItems, viewItems, currentFilter, currentViewMode);
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

abstract class _Initial extends BookingPageState {
  const factory _Initial(
      {required final List<BookingPageData> rawItems,
      required final List<BookingPageViewData> viewItems,
      required final BudgetBookFilter currentFilter,
      required final BookingViewMode currentViewMode}) = _$InitialImpl;
  const _Initial._() : super._();

  @override
  List<BookingPageData> get rawItems;
  @override
  List<BookingPageViewData> get viewItems;
  @override
  BudgetBookFilter get currentFilter;
  @override
  BookingViewMode get currentViewMode;

  /// Create a copy of BookingPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $BookingPageStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BookingPageData> rawItems,
      List<BookingPageViewData> viewItems,
      bool isFirstFetch,
      BudgetBookFilter currentFilter,
      BookingViewMode currentViewMode});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$BookingPageStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawItems = null,
    Object? viewItems = null,
    Object? isFirstFetch = null,
    Object? currentFilter = null,
    Object? currentViewMode = null,
  }) {
    return _then(_$LoadingImpl(
      rawItems: null == rawItems
          ? _value._rawItems
          : rawItems // ignore: cast_nullable_to_non_nullable
              as List<BookingPageData>,
      viewItems: null == viewItems
          ? _value._viewItems
          : viewItems // ignore: cast_nullable_to_non_nullable
              as List<BookingPageViewData>,
      isFirstFetch: null == isFirstFetch
          ? _value.isFirstFetch
          : isFirstFetch // ignore: cast_nullable_to_non_nullable
              as bool,
      currentFilter: null == currentFilter
          ? _value.currentFilter
          : currentFilter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
      currentViewMode: null == currentViewMode
          ? _value.currentViewMode
          : currentViewMode // ignore: cast_nullable_to_non_nullable
              as BookingViewMode,
    ));
  }
}

/// @nodoc

class _$LoadingImpl extends _Loading {
  const _$LoadingImpl(
      {required final List<BookingPageData> rawItems,
      required final List<BookingPageViewData> viewItems,
      required this.isFirstFetch,
      required this.currentFilter,
      required this.currentViewMode})
      : _rawItems = rawItems,
        _viewItems = viewItems,
        super._();

  final List<BookingPageData> _rawItems;
  @override
  List<BookingPageData> get rawItems {
    if (_rawItems is EqualUnmodifiableListView) return _rawItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rawItems);
  }

  final List<BookingPageViewData> _viewItems;
  @override
  List<BookingPageViewData> get viewItems {
    if (_viewItems is EqualUnmodifiableListView) return _viewItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_viewItems);
  }

  @override
  final bool isFirstFetch;
  @override
  final BudgetBookFilter currentFilter;
  @override
  final BookingViewMode currentViewMode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            const DeepCollectionEquality().equals(other._rawItems, _rawItems) &&
            const DeepCollectionEquality()
                .equals(other._viewItems, _viewItems) &&
            (identical(other.isFirstFetch, isFirstFetch) ||
                other.isFirstFetch == isFirstFetch) &&
            (identical(other.currentFilter, currentFilter) ||
                other.currentFilter == currentFilter) &&
            (identical(other.currentViewMode, currentViewMode) ||
                other.currentViewMode == currentViewMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_rawItems),
      const DeepCollectionEquality().hash(_viewItems),
      isFirstFetch,
      currentFilter,
      currentViewMode);

  /// Create a copy of BookingPageState
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
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)
        initial,
    required TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool isFirstFetch,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)
        loading,
    required TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool hasReachedMax,
            bool isInitial,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)
        loaded,
    required TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            String message,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)
        error,
  }) {
    return loading(
        rawItems, viewItems, isFirstFetch, currentFilter, currentViewMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        initial,
    TResult? Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool isFirstFetch,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        loading,
    TResult? Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool hasReachedMax,
            bool isInitial,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        loaded,
    TResult? Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            String message,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        error,
  }) {
    return loading?.call(
        rawItems, viewItems, isFirstFetch, currentFilter, currentViewMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        initial,
    TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool isFirstFetch,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        loading,
    TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool hasReachedMax,
            bool isInitial,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        loaded,
    TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            String message,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(
          rawItems, viewItems, isFirstFetch, currentFilter, currentViewMode);
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

abstract class _Loading extends BookingPageState {
  const factory _Loading(
      {required final List<BookingPageData> rawItems,
      required final List<BookingPageViewData> viewItems,
      required final bool isFirstFetch,
      required final BudgetBookFilter currentFilter,
      required final BookingViewMode currentViewMode}) = _$LoadingImpl;
  const _Loading._() : super._();

  @override
  List<BookingPageData> get rawItems;
  @override
  List<BookingPageViewData> get viewItems;
  bool get isFirstFetch;
  @override
  BudgetBookFilter get currentFilter;
  @override
  BookingViewMode get currentViewMode;

  /// Create a copy of BookingPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res>
    implements $BookingPageStateCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BookingPageData> rawItems,
      List<BookingPageViewData> viewItems,
      bool hasReachedMax,
      bool isInitial,
      BudgetBookFilter currentFilter,
      BookingViewMode currentViewMode});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$BookingPageStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawItems = null,
    Object? viewItems = null,
    Object? hasReachedMax = null,
    Object? isInitial = null,
    Object? currentFilter = null,
    Object? currentViewMode = null,
  }) {
    return _then(_$LoadedImpl(
      rawItems: null == rawItems
          ? _value._rawItems
          : rawItems // ignore: cast_nullable_to_non_nullable
              as List<BookingPageData>,
      viewItems: null == viewItems
          ? _value._viewItems
          : viewItems // ignore: cast_nullable_to_non_nullable
              as List<BookingPageViewData>,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      currentFilter: null == currentFilter
          ? _value.currentFilter
          : currentFilter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
      currentViewMode: null == currentViewMode
          ? _value.currentViewMode
          : currentViewMode // ignore: cast_nullable_to_non_nullable
              as BookingViewMode,
    ));
  }
}

/// @nodoc

class _$LoadedImpl extends _Loaded {
  const _$LoadedImpl(
      {required final List<BookingPageData> rawItems,
      required final List<BookingPageViewData> viewItems,
      required this.hasReachedMax,
      required this.isInitial,
      required this.currentFilter,
      required this.currentViewMode})
      : _rawItems = rawItems,
        _viewItems = viewItems,
        super._();

  final List<BookingPageData> _rawItems;
  @override
  List<BookingPageData> get rawItems {
    if (_rawItems is EqualUnmodifiableListView) return _rawItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rawItems);
  }

  final List<BookingPageViewData> _viewItems;
  @override
  List<BookingPageViewData> get viewItems {
    if (_viewItems is EqualUnmodifiableListView) return _viewItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_viewItems);
  }

  @override
  final bool hasReachedMax;
  @override
  final bool isInitial;
  @override
  final BudgetBookFilter currentFilter;
  @override
  final BookingViewMode currentViewMode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._rawItems, _rawItems) &&
            const DeepCollectionEquality()
                .equals(other._viewItems, _viewItems) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.isInitial, isInitial) ||
                other.isInitial == isInitial) &&
            (identical(other.currentFilter, currentFilter) ||
                other.currentFilter == currentFilter) &&
            (identical(other.currentViewMode, currentViewMode) ||
                other.currentViewMode == currentViewMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_rawItems),
      const DeepCollectionEquality().hash(_viewItems),
      hasReachedMax,
      isInitial,
      currentFilter,
      currentViewMode);

  /// Create a copy of BookingPageState
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
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)
        initial,
    required TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool isFirstFetch,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)
        loading,
    required TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool hasReachedMax,
            bool isInitial,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)
        loaded,
    required TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            String message,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)
        error,
  }) {
    return loaded(rawItems, viewItems, hasReachedMax, isInitial, currentFilter,
        currentViewMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        initial,
    TResult? Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool isFirstFetch,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        loading,
    TResult? Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool hasReachedMax,
            bool isInitial,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        loaded,
    TResult? Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            String message,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        error,
  }) {
    return loaded?.call(rawItems, viewItems, hasReachedMax, isInitial,
        currentFilter, currentViewMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        initial,
    TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool isFirstFetch,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        loading,
    TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool hasReachedMax,
            bool isInitial,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        loaded,
    TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            String message,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(rawItems, viewItems, hasReachedMax, isInitial,
          currentFilter, currentViewMode);
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

abstract class _Loaded extends BookingPageState {
  const factory _Loaded(
      {required final List<BookingPageData> rawItems,
      required final List<BookingPageViewData> viewItems,
      required final bool hasReachedMax,
      required final bool isInitial,
      required final BudgetBookFilter currentFilter,
      required final BookingViewMode currentViewMode}) = _$LoadedImpl;
  const _Loaded._() : super._();

  @override
  List<BookingPageData> get rawItems;
  @override
  List<BookingPageViewData> get viewItems;
  bool get hasReachedMax;
  bool get isInitial;
  @override
  BudgetBookFilter get currentFilter;
  @override
  BookingViewMode get currentViewMode;

  /// Create a copy of BookingPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $BookingPageStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BookingPageData> rawItems,
      List<BookingPageViewData> viewItems,
      String message,
      BudgetBookFilter currentFilter,
      BookingViewMode currentViewMode});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$BookingPageStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawItems = null,
    Object? viewItems = null,
    Object? message = null,
    Object? currentFilter = null,
    Object? currentViewMode = null,
  }) {
    return _then(_$ErrorImpl(
      rawItems: null == rawItems
          ? _value._rawItems
          : rawItems // ignore: cast_nullable_to_non_nullable
              as List<BookingPageData>,
      viewItems: null == viewItems
          ? _value._viewItems
          : viewItems // ignore: cast_nullable_to_non_nullable
              as List<BookingPageViewData>,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      currentFilter: null == currentFilter
          ? _value.currentFilter
          : currentFilter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
      currentViewMode: null == currentViewMode
          ? _value.currentViewMode
          : currentViewMode // ignore: cast_nullable_to_non_nullable
              as BookingViewMode,
    ));
  }
}

/// @nodoc

class _$ErrorImpl extends _Error {
  const _$ErrorImpl(
      {required final List<BookingPageData> rawItems,
      required final List<BookingPageViewData> viewItems,
      required this.message,
      required this.currentFilter,
      required this.currentViewMode})
      : _rawItems = rawItems,
        _viewItems = viewItems,
        super._();

  final List<BookingPageData> _rawItems;
  @override
  List<BookingPageData> get rawItems {
    if (_rawItems is EqualUnmodifiableListView) return _rawItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rawItems);
  }

  final List<BookingPageViewData> _viewItems;
  @override
  List<BookingPageViewData> get viewItems {
    if (_viewItems is EqualUnmodifiableListView) return _viewItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_viewItems);
  }

  @override
  final String message;
  @override
  final BudgetBookFilter currentFilter;
  @override
  final BookingViewMode currentViewMode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            const DeepCollectionEquality().equals(other._rawItems, _rawItems) &&
            const DeepCollectionEquality()
                .equals(other._viewItems, _viewItems) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.currentFilter, currentFilter) ||
                other.currentFilter == currentFilter) &&
            (identical(other.currentViewMode, currentViewMode) ||
                other.currentViewMode == currentViewMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_rawItems),
      const DeepCollectionEquality().hash(_viewItems),
      message,
      currentFilter,
      currentViewMode);

  /// Create a copy of BookingPageState
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
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)
        initial,
    required TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool isFirstFetch,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)
        loading,
    required TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool hasReachedMax,
            bool isInitial,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)
        loaded,
    required TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            String message,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)
        error,
  }) {
    return error(rawItems, viewItems, message, currentFilter, currentViewMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        initial,
    TResult? Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool isFirstFetch,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        loading,
    TResult? Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool hasReachedMax,
            bool isInitial,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        loaded,
    TResult? Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            String message,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        error,
  }) {
    return error?.call(
        rawItems, viewItems, message, currentFilter, currentViewMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        initial,
    TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool isFirstFetch,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        loading,
    TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            bool hasReachedMax,
            bool isInitial,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        loaded,
    TResult Function(
            List<BookingPageData> rawItems,
            List<BookingPageViewData> viewItems,
            String message,
            BudgetBookFilter currentFilter,
            BookingViewMode currentViewMode)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(
          rawItems, viewItems, message, currentFilter, currentViewMode);
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

abstract class _Error extends BookingPageState {
  const factory _Error(
      {required final List<BookingPageData> rawItems,
      required final List<BookingPageViewData> viewItems,
      required final String message,
      required final BudgetBookFilter currentFilter,
      required final BookingViewMode currentViewMode}) = _$ErrorImpl;
  const _Error._() : super._();

  @override
  List<BookingPageData> get rawItems;
  @override
  List<BookingPageViewData> get viewItems;
  String get message;
  @override
  BudgetBookFilter get currentFilter;
  @override
  BookingViewMode get currentViewMode;

  /// Create a copy of BookingPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
