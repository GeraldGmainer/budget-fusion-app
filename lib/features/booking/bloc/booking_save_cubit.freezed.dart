// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_save_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingSaveState {

 BookingDraft get draft;
/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingSaveStateCopyWith<BookingSaveState> get copyWith => _$BookingSaveStateCopyWithImpl<BookingSaveState>(this as BookingSaveState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingSaveState&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode => Object.hash(runtimeType,draft);

@override
String toString() {
  return 'BookingSaveState(draft: $draft)';
}


}

/// @nodoc
abstract mixin class $BookingSaveStateCopyWith<$Res>  {
  factory $BookingSaveStateCopyWith(BookingSaveState value, $Res Function(BookingSaveState) _then) = _$BookingSaveStateCopyWithImpl;
@useResult
$Res call({
 BookingDraft draft
});


$BookingDraftCopyWith<$Res> get draft;

}
/// @nodoc
class _$BookingSaveStateCopyWithImpl<$Res>
    implements $BookingSaveStateCopyWith<$Res> {
  _$BookingSaveStateCopyWithImpl(this._self, this._then);

  final BookingSaveState _self;
  final $Res Function(BookingSaveState) _then;

/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? draft = null,}) {
  return _then(_self.copyWith(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as BookingDraft,
  ));
}
/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingDraftCopyWith<$Res> get draft {
  
  return $BookingDraftCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookingSaveState].
extension BookingSaveStatePatterns on BookingSaveState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _DraftUpdate value)?  draftUpdate,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Deleted value)?  deleted,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _DraftUpdate() when draftUpdate != null:
return draftUpdate(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Error() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _DraftUpdate value)  draftUpdate,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Deleted value)  deleted,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _DraftUpdate():
return draftUpdate(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Deleted():
return deleted(_that);case _Error():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _DraftUpdate value)?  draftUpdate,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Deleted value)?  deleted,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _DraftUpdate() when draftUpdate != null:
return draftUpdate(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Error() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( BookingDraft draft)?  initial,TResult Function( BookingDraft draft,  BookingDraft initialDraft)?  draftUpdate,TResult Function( BookingDraft draft)?  loading,TResult Function( BookingDraft draft)?  loaded,TResult Function( BookingDraft draft,  Booking booking)?  deleted,TResult Function( BookingDraft draft,  AppError error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.draft);case _DraftUpdate() when draftUpdate != null:
return draftUpdate(_that.draft,_that.initialDraft);case _Loading() when loading != null:
return loading(_that.draft);case _Loaded() when loaded != null:
return loaded(_that.draft);case _Deleted() when deleted != null:
return deleted(_that.draft,_that.booking);case _Error() when error != null:
return error(_that.draft,_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( BookingDraft draft)  initial,required TResult Function( BookingDraft draft,  BookingDraft initialDraft)  draftUpdate,required TResult Function( BookingDraft draft)  loading,required TResult Function( BookingDraft draft)  loaded,required TResult Function( BookingDraft draft,  Booking booking)  deleted,required TResult Function( BookingDraft draft,  AppError error)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.draft);case _DraftUpdate():
return draftUpdate(_that.draft,_that.initialDraft);case _Loading():
return loading(_that.draft);case _Loaded():
return loaded(_that.draft);case _Deleted():
return deleted(_that.draft,_that.booking);case _Error():
return error(_that.draft,_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( BookingDraft draft)?  initial,TResult? Function( BookingDraft draft,  BookingDraft initialDraft)?  draftUpdate,TResult? Function( BookingDraft draft)?  loading,TResult? Function( BookingDraft draft)?  loaded,TResult? Function( BookingDraft draft,  Booking booking)?  deleted,TResult? Function( BookingDraft draft,  AppError error)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.draft);case _DraftUpdate() when draftUpdate != null:
return draftUpdate(_that.draft,_that.initialDraft);case _Loading() when loading != null:
return loading(_that.draft);case _Loaded() when loaded != null:
return loaded(_that.draft);case _Deleted() when deleted != null:
return deleted(_that.draft,_that.booking);case _Error() when error != null:
return error(_that.draft,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements BookingSaveState {
   _Initial({required this.draft});
  

@override final  BookingDraft draft;

/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode => Object.hash(runtimeType,draft);

@override
String toString() {
  return 'BookingSaveState.initial(draft: $draft)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $BookingSaveStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 BookingDraft draft
});


@override $BookingDraftCopyWith<$Res> get draft;

}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? draft = null,}) {
  return _then(_Initial(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as BookingDraft,
  ));
}

/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingDraftCopyWith<$Res> get draft {
  
  return $BookingDraftCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}
}

/// @nodoc


class _DraftUpdate implements BookingSaveState {
   _DraftUpdate({required this.draft, required this.initialDraft});
  

@override final  BookingDraft draft;
 final  BookingDraft initialDraft;

/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DraftUpdateCopyWith<_DraftUpdate> get copyWith => __$DraftUpdateCopyWithImpl<_DraftUpdate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DraftUpdate&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.initialDraft, initialDraft) || other.initialDraft == initialDraft));
}


@override
int get hashCode => Object.hash(runtimeType,draft,initialDraft);

@override
String toString() {
  return 'BookingSaveState.draftUpdate(draft: $draft, initialDraft: $initialDraft)';
}


}

/// @nodoc
abstract mixin class _$DraftUpdateCopyWith<$Res> implements $BookingSaveStateCopyWith<$Res> {
  factory _$DraftUpdateCopyWith(_DraftUpdate value, $Res Function(_DraftUpdate) _then) = __$DraftUpdateCopyWithImpl;
@override @useResult
$Res call({
 BookingDraft draft, BookingDraft initialDraft
});


@override $BookingDraftCopyWith<$Res> get draft;$BookingDraftCopyWith<$Res> get initialDraft;

}
/// @nodoc
class __$DraftUpdateCopyWithImpl<$Res>
    implements _$DraftUpdateCopyWith<$Res> {
  __$DraftUpdateCopyWithImpl(this._self, this._then);

  final _DraftUpdate _self;
  final $Res Function(_DraftUpdate) _then;

/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? draft = null,Object? initialDraft = null,}) {
  return _then(_DraftUpdate(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as BookingDraft,initialDraft: null == initialDraft ? _self.initialDraft : initialDraft // ignore: cast_nullable_to_non_nullable
as BookingDraft,
  ));
}

/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingDraftCopyWith<$Res> get draft {
  
  return $BookingDraftCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingDraftCopyWith<$Res> get initialDraft {
  
  return $BookingDraftCopyWith<$Res>(_self.initialDraft, (value) {
    return _then(_self.copyWith(initialDraft: value));
  });
}
}

/// @nodoc


class _Loading implements BookingSaveState {
  const _Loading({required this.draft});
  

@override final  BookingDraft draft;

/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingCopyWith<_Loading> get copyWith => __$LoadingCopyWithImpl<_Loading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode => Object.hash(runtimeType,draft);

@override
String toString() {
  return 'BookingSaveState.loading(draft: $draft)';
}


}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res> implements $BookingSaveStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) = __$LoadingCopyWithImpl;
@override @useResult
$Res call({
 BookingDraft draft
});


@override $BookingDraftCopyWith<$Res> get draft;

}
/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? draft = null,}) {
  return _then(_Loading(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as BookingDraft,
  ));
}

/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingDraftCopyWith<$Res> get draft {
  
  return $BookingDraftCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}
}

/// @nodoc


class _Loaded implements BookingSaveState {
  const _Loaded({required this.draft});
  

@override final  BookingDraft draft;

/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode => Object.hash(runtimeType,draft);

@override
String toString() {
  return 'BookingSaveState.loaded(draft: $draft)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $BookingSaveStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@override @useResult
$Res call({
 BookingDraft draft
});


@override $BookingDraftCopyWith<$Res> get draft;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? draft = null,}) {
  return _then(_Loaded(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as BookingDraft,
  ));
}

/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingDraftCopyWith<$Res> get draft {
  
  return $BookingDraftCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}
}

/// @nodoc


class _Deleted implements BookingSaveState {
  const _Deleted({required this.draft, required this.booking});
  

@override final  BookingDraft draft;
 final  Booking booking;

/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletedCopyWith<_Deleted> get copyWith => __$DeletedCopyWithImpl<_Deleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Deleted&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.booking, booking) || other.booking == booking));
}


@override
int get hashCode => Object.hash(runtimeType,draft,booking);

@override
String toString() {
  return 'BookingSaveState.deleted(draft: $draft, booking: $booking)';
}


}

/// @nodoc
abstract mixin class _$DeletedCopyWith<$Res> implements $BookingSaveStateCopyWith<$Res> {
  factory _$DeletedCopyWith(_Deleted value, $Res Function(_Deleted) _then) = __$DeletedCopyWithImpl;
@override @useResult
$Res call({
 BookingDraft draft, Booking booking
});


@override $BookingDraftCopyWith<$Res> get draft;$BookingCopyWith<$Res> get booking;

}
/// @nodoc
class __$DeletedCopyWithImpl<$Res>
    implements _$DeletedCopyWith<$Res> {
  __$DeletedCopyWithImpl(this._self, this._then);

  final _Deleted _self;
  final $Res Function(_Deleted) _then;

/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? draft = null,Object? booking = null,}) {
  return _then(_Deleted(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as BookingDraft,booking: null == booking ? _self.booking : booking // ignore: cast_nullable_to_non_nullable
as Booking,
  ));
}

/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingDraftCopyWith<$Res> get draft {
  
  return $BookingDraftCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingCopyWith<$Res> get booking {
  
  return $BookingCopyWith<$Res>(_self.booking, (value) {
    return _then(_self.copyWith(booking: value));
  });
}
}

/// @nodoc


class _Error implements BookingSaveState {
  const _Error({required this.draft, required this.error});
  

@override final  BookingDraft draft;
 final  AppError error;

/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,draft,error);

@override
String toString() {
  return 'BookingSaveState.error(draft: $draft, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $BookingSaveStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@override @useResult
$Res call({
 BookingDraft draft, AppError error
});


@override $BookingDraftCopyWith<$Res> get draft;

}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? draft = null,Object? error = null,}) {
  return _then(_Error(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as BookingDraft,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}

/// Create a copy of BookingSaveState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingDraftCopyWith<$Res> get draft {
  
  return $BookingDraftCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}
}

// dart format on
