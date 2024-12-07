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
  BudgetBookFilter get filter => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BudgetBookFilter filter) loadInitial,
    required TResult Function(BudgetBookFilter filter) loadMore,
    required TResult Function(BudgetBookFilter filter) applyFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BudgetBookFilter filter)? loadInitial,
    TResult? Function(BudgetBookFilter filter)? loadMore,
    TResult? Function(BudgetBookFilter filter)? applyFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BudgetBookFilter filter)? loadInitial,
    TResult Function(BudgetBookFilter filter)? loadMore,
    TResult Function(BudgetBookFilter filter)? applyFilter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInitial value) loadInitial,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_ApplyFilter value) applyFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInitial value)? loadInitial,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_ApplyFilter value)? applyFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInitial value)? loadInitial,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_ApplyFilter value)? applyFilter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of BookingPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingPageEventCopyWith<BookingPageEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingPageEventCopyWith<$Res> {
  factory $BookingPageEventCopyWith(
          BookingPageEvent value, $Res Function(BookingPageEvent) then) =
      _$BookingPageEventCopyWithImpl<$Res, BookingPageEvent>;
  @useResult
  $Res call({BudgetBookFilter filter});

  $BudgetBookFilterCopyWith<$Res> get filter;
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

  /// Create a copy of BookingPageEvent
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
abstract class _$$LoadInitialImplCopyWith<$Res>
    implements $BookingPageEventCopyWith<$Res> {
  factory _$$LoadInitialImplCopyWith(
          _$LoadInitialImpl value, $Res Function(_$LoadInitialImpl) then) =
      __$$LoadInitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BudgetBookFilter filter});

  @override
  $BudgetBookFilterCopyWith<$Res> get filter;
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
  }) {
    return _then(_$LoadInitialImpl(
      null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
    ));
  }
}

/// @nodoc

class _$LoadInitialImpl implements _LoadInitial {
  const _$LoadInitialImpl(this.filter);

  @override
  final BudgetBookFilter filter;

  @override
  String toString() {
    return 'BookingPageEvent.loadInitial(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadInitialImpl &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

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
    required TResult Function(BudgetBookFilter filter) loadInitial,
    required TResult Function(BudgetBookFilter filter) loadMore,
    required TResult Function(BudgetBookFilter filter) applyFilter,
  }) {
    return loadInitial(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BudgetBookFilter filter)? loadInitial,
    TResult? Function(BudgetBookFilter filter)? loadMore,
    TResult? Function(BudgetBookFilter filter)? applyFilter,
  }) {
    return loadInitial?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BudgetBookFilter filter)? loadInitial,
    TResult Function(BudgetBookFilter filter)? loadMore,
    TResult Function(BudgetBookFilter filter)? applyFilter,
    required TResult orElse(),
  }) {
    if (loadInitial != null) {
      return loadInitial(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInitial value) loadInitial,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_ApplyFilter value) applyFilter,
  }) {
    return loadInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInitial value)? loadInitial,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_ApplyFilter value)? applyFilter,
  }) {
    return loadInitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInitial value)? loadInitial,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_ApplyFilter value)? applyFilter,
    required TResult orElse(),
  }) {
    if (loadInitial != null) {
      return loadInitial(this);
    }
    return orElse();
  }
}

abstract class _LoadInitial implements BookingPageEvent {
  const factory _LoadInitial(final BudgetBookFilter filter) = _$LoadInitialImpl;

  @override
  BudgetBookFilter get filter;

  /// Create a copy of BookingPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadInitialImplCopyWith<_$LoadInitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreImplCopyWith<$Res>
    implements $BookingPageEventCopyWith<$Res> {
  factory _$$LoadMoreImplCopyWith(
          _$LoadMoreImpl value, $Res Function(_$LoadMoreImpl) then) =
      __$$LoadMoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BudgetBookFilter filter});

  @override
  $BudgetBookFilterCopyWith<$Res> get filter;
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
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$LoadMoreImpl(
      null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
    ));
  }
}

/// @nodoc

class _$LoadMoreImpl implements _LoadMore {
  const _$LoadMoreImpl(this.filter);

  @override
  final BudgetBookFilter filter;

  @override
  String toString() {
    return 'BookingPageEvent.loadMore(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreImpl &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  /// Create a copy of BookingPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMoreImplCopyWith<_$LoadMoreImpl> get copyWith =>
      __$$LoadMoreImplCopyWithImpl<_$LoadMoreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BudgetBookFilter filter) loadInitial,
    required TResult Function(BudgetBookFilter filter) loadMore,
    required TResult Function(BudgetBookFilter filter) applyFilter,
  }) {
    return loadMore(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BudgetBookFilter filter)? loadInitial,
    TResult? Function(BudgetBookFilter filter)? loadMore,
    TResult? Function(BudgetBookFilter filter)? applyFilter,
  }) {
    return loadMore?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BudgetBookFilter filter)? loadInitial,
    TResult Function(BudgetBookFilter filter)? loadMore,
    TResult Function(BudgetBookFilter filter)? applyFilter,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInitial value) loadInitial,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_ApplyFilter value) applyFilter,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInitial value)? loadInitial,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_ApplyFilter value)? applyFilter,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInitial value)? loadInitial,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_ApplyFilter value)? applyFilter,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements BookingPageEvent {
  const factory _LoadMore(final BudgetBookFilter filter) = _$LoadMoreImpl;

  @override
  BudgetBookFilter get filter;

  /// Create a copy of BookingPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadMoreImplCopyWith<_$LoadMoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApplyFilterImplCopyWith<$Res>
    implements $BookingPageEventCopyWith<$Res> {
  factory _$$ApplyFilterImplCopyWith(
          _$ApplyFilterImpl value, $Res Function(_$ApplyFilterImpl) then) =
      __$$ApplyFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BudgetBookFilter filter});

  @override
  $BudgetBookFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$ApplyFilterImplCopyWithImpl<$Res>
    extends _$BookingPageEventCopyWithImpl<$Res, _$ApplyFilterImpl>
    implements _$$ApplyFilterImplCopyWith<$Res> {
  __$$ApplyFilterImplCopyWithImpl(
      _$ApplyFilterImpl _value, $Res Function(_$ApplyFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$ApplyFilterImpl(
      null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as BudgetBookFilter,
    ));
  }
}

/// @nodoc

class _$ApplyFilterImpl implements _ApplyFilter {
  const _$ApplyFilterImpl(this.filter);

  @override
  final BudgetBookFilter filter;

  @override
  String toString() {
    return 'BookingPageEvent.applyFilter(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplyFilterImpl &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  /// Create a copy of BookingPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplyFilterImplCopyWith<_$ApplyFilterImpl> get copyWith =>
      __$$ApplyFilterImplCopyWithImpl<_$ApplyFilterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BudgetBookFilter filter) loadInitial,
    required TResult Function(BudgetBookFilter filter) loadMore,
    required TResult Function(BudgetBookFilter filter) applyFilter,
  }) {
    return applyFilter(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BudgetBookFilter filter)? loadInitial,
    TResult? Function(BudgetBookFilter filter)? loadMore,
    TResult? Function(BudgetBookFilter filter)? applyFilter,
  }) {
    return applyFilter?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BudgetBookFilter filter)? loadInitial,
    TResult Function(BudgetBookFilter filter)? loadMore,
    TResult Function(BudgetBookFilter filter)? applyFilter,
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
    required TResult Function(_LoadInitial value) loadInitial,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_ApplyFilter value) applyFilter,
  }) {
    return applyFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInitial value)? loadInitial,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_ApplyFilter value)? applyFilter,
  }) {
    return applyFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInitial value)? loadInitial,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_ApplyFilter value)? applyFilter,
    required TResult orElse(),
  }) {
    if (applyFilter != null) {
      return applyFilter(this);
    }
    return orElse();
  }
}

abstract class _ApplyFilter implements BookingPageEvent {
  const factory _ApplyFilter(final BudgetBookFilter filter) = _$ApplyFilterImpl;

  @override
  BudgetBookFilter get filter;

  /// Create a copy of BookingPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplyFilterImplCopyWith<_$ApplyFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BookingPageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<BookingPageData> items, bool isFirstFetch)
        loading,
    required TResult Function(List<BookingPageData> items, bool isInitial)
        loaded,
    required TResult Function(List<BookingPageData> items, String message)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BookingPageData> items, bool isFirstFetch)? loading,
    TResult? Function(List<BookingPageData> items, bool isInitial)? loaded,
    TResult? Function(List<BookingPageData> items, String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BookingPageData> items, bool isFirstFetch)? loading,
    TResult Function(List<BookingPageData> items, bool isInitial)? loaded,
    TResult Function(List<BookingPageData> items, String message)? error,
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
}

/// @nodoc
abstract class $BookingPageStateCopyWith<$Res> {
  factory $BookingPageStateCopyWith(
          BookingPageState value, $Res Function(BookingPageState) then) =
      _$BookingPageStateCopyWithImpl<$Res, BookingPageState>;
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
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
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
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'BookingPageState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<BookingPageData> items, bool isFirstFetch)
        loading,
    required TResult Function(List<BookingPageData> items, bool isInitial)
        loaded,
    required TResult Function(List<BookingPageData> items, String message)
        error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BookingPageData> items, bool isFirstFetch)? loading,
    TResult? Function(List<BookingPageData> items, bool isInitial)? loaded,
    TResult? Function(List<BookingPageData> items, String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BookingPageData> items, bool isFirstFetch)? loading,
    TResult Function(List<BookingPageData> items, bool isInitial)? loaded,
    TResult Function(List<BookingPageData> items, String message)? error,
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

abstract class _Initial implements BookingPageState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BookingPageData> items, bool isFirstFetch});
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
    Object? items = null,
    Object? isFirstFetch = null,
  }) {
    return _then(_$LoadingImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BookingPageData>,
      isFirstFetch: null == isFirstFetch
          ? _value.isFirstFetch
          : isFirstFetch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(
      {required final List<BookingPageData> items, required this.isFirstFetch})
      : _items = items;

  final List<BookingPageData> _items;
  @override
  List<BookingPageData> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final bool isFirstFetch;

  @override
  String toString() {
    return 'BookingPageState.loading(items: $items, isFirstFetch: $isFirstFetch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.isFirstFetch, isFirstFetch) ||
                other.isFirstFetch == isFirstFetch));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), isFirstFetch);

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
    required TResult Function() initial,
    required TResult Function(List<BookingPageData> items, bool isFirstFetch)
        loading,
    required TResult Function(List<BookingPageData> items, bool isInitial)
        loaded,
    required TResult Function(List<BookingPageData> items, String message)
        error,
  }) {
    return loading(items, isFirstFetch);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BookingPageData> items, bool isFirstFetch)? loading,
    TResult? Function(List<BookingPageData> items, bool isInitial)? loaded,
    TResult? Function(List<BookingPageData> items, String message)? error,
  }) {
    return loading?.call(items, isFirstFetch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BookingPageData> items, bool isFirstFetch)? loading,
    TResult Function(List<BookingPageData> items, bool isInitial)? loaded,
    TResult Function(List<BookingPageData> items, String message)? error,
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

abstract class _Loading implements BookingPageState {
  const factory _Loading(
      {required final List<BookingPageData> items,
      required final bool isFirstFetch}) = _$LoadingImpl;

  List<BookingPageData> get items;
  bool get isFirstFetch;

  /// Create a copy of BookingPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BookingPageData> items, bool isInitial});
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
    Object? items = null,
    Object? isInitial = null,
  }) {
    return _then(_$LoadedImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BookingPageData>,
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required final List<BookingPageData> items, required this.isInitial})
      : _items = items;

  final List<BookingPageData> _items;
  @override
  List<BookingPageData> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final bool isInitial;

  @override
  String toString() {
    return 'BookingPageState.loaded(items: $items, isInitial: $isInitial)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.isInitial, isInitial) ||
                other.isInitial == isInitial));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), isInitial);

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
    required TResult Function() initial,
    required TResult Function(List<BookingPageData> items, bool isFirstFetch)
        loading,
    required TResult Function(List<BookingPageData> items, bool isInitial)
        loaded,
    required TResult Function(List<BookingPageData> items, String message)
        error,
  }) {
    return loaded(items, isInitial);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BookingPageData> items, bool isFirstFetch)? loading,
    TResult? Function(List<BookingPageData> items, bool isInitial)? loaded,
    TResult? Function(List<BookingPageData> items, String message)? error,
  }) {
    return loaded?.call(items, isInitial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BookingPageData> items, bool isFirstFetch)? loading,
    TResult Function(List<BookingPageData> items, bool isInitial)? loaded,
    TResult Function(List<BookingPageData> items, String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(items, isInitial);
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

abstract class _Loaded implements BookingPageState {
  const factory _Loaded(
      {required final List<BookingPageData> items,
      required final bool isInitial}) = _$LoadedImpl;

  List<BookingPageData> get items;
  bool get isInitial;

  /// Create a copy of BookingPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BookingPageData> items, String message});
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
    Object? items = null,
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BookingPageData>,
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
      {required final List<BookingPageData> items, required this.message})
      : _items = items;

  final List<BookingPageData> _items;
  @override
  List<BookingPageData> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String message;

  @override
  String toString() {
    return 'BookingPageState.error(items: $items, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), message);

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
    required TResult Function() initial,
    required TResult Function(List<BookingPageData> items, bool isFirstFetch)
        loading,
    required TResult Function(List<BookingPageData> items, bool isInitial)
        loaded,
    required TResult Function(List<BookingPageData> items, String message)
        error,
  }) {
    return error(items, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BookingPageData> items, bool isFirstFetch)? loading,
    TResult? Function(List<BookingPageData> items, bool isInitial)? loaded,
    TResult? Function(List<BookingPageData> items, String message)? error,
  }) {
    return error?.call(items, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BookingPageData> items, bool isFirstFetch)? loading,
    TResult Function(List<BookingPageData> items, bool isInitial)? loaded,
    TResult Function(List<BookingPageData> items, String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(items, message);
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

abstract class _Error implements BookingPageState {
  const factory _Error(
      {required final List<BookingPageData> items,
      required final String message}) = _$ErrorImpl;

  List<BookingPageData> get items;
  String get message;

  /// Create a copy of BookingPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
