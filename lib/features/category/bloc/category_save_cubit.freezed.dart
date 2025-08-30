// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_save_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategorySaveState {

 CategoryDraft get draft;
/// Create a copy of CategorySaveState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategorySaveStateCopyWith<CategorySaveState> get copyWith => _$CategorySaveStateCopyWithImpl<CategorySaveState>(this as CategorySaveState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategorySaveState&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode => Object.hash(runtimeType,draft);

@override
String toString() {
  return 'CategorySaveState(draft: $draft)';
}


}

/// @nodoc
abstract mixin class $CategorySaveStateCopyWith<$Res>  {
  factory $CategorySaveStateCopyWith(CategorySaveState value, $Res Function(CategorySaveState) _then) = _$CategorySaveStateCopyWithImpl;
@useResult
$Res call({
 CategoryDraft draft
});


$CategoryDraftCopyWith<$Res> get draft;

}
/// @nodoc
class _$CategorySaveStateCopyWithImpl<$Res>
    implements $CategorySaveStateCopyWith<$Res> {
  _$CategorySaveStateCopyWithImpl(this._self, this._then);

  final CategorySaveState _self;
  final $Res Function(CategorySaveState) _then;

/// Create a copy of CategorySaveState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? draft = null,}) {
  return _then(_self.copyWith(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as CategoryDraft,
  ));
}
/// Create a copy of CategorySaveState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryDraftCopyWith<$Res> get draft {
  
  return $CategoryDraftCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}
}


/// Adds pattern-matching-related methods to [CategorySaveState].
extension CategorySaveStatePatterns on CategorySaveState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _DraftUpdate value)?  draftUpdate,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  saved,TResult Function( _Deleted value)?  deleted,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _DraftUpdate() when draftUpdate != null:
return draftUpdate(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when saved != null:
return saved(_that);case _Deleted() when deleted != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _DraftUpdate value)  draftUpdate,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  saved,required TResult Function( _Deleted value)  deleted,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _DraftUpdate():
return draftUpdate(_that);case _Loading():
return loading(_that);case _Loaded():
return saved(_that);case _Deleted():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _DraftUpdate value)?  draftUpdate,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  saved,TResult? Function( _Deleted value)?  deleted,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _DraftUpdate() when draftUpdate != null:
return draftUpdate(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when saved != null:
return saved(_that);case _Deleted() when deleted != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CategoryDraft draft)?  initial,TResult Function( CategoryDraft draft,  CategoryDraft initialDraft)?  draftUpdate,TResult Function( CategoryDraft draft)?  loading,TResult Function( CategoryDraft draft)?  saved,TResult Function( CategoryDraft draft)?  deleted,TResult Function( CategoryDraft draft,  AppError error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.draft);case _DraftUpdate() when draftUpdate != null:
return draftUpdate(_that.draft,_that.initialDraft);case _Loading() when loading != null:
return loading(_that.draft);case _Loaded() when saved != null:
return saved(_that.draft);case _Deleted() when deleted != null:
return deleted(_that.draft);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CategoryDraft draft)  initial,required TResult Function( CategoryDraft draft,  CategoryDraft initialDraft)  draftUpdate,required TResult Function( CategoryDraft draft)  loading,required TResult Function( CategoryDraft draft)  saved,required TResult Function( CategoryDraft draft)  deleted,required TResult Function( CategoryDraft draft,  AppError error)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.draft);case _DraftUpdate():
return draftUpdate(_that.draft,_that.initialDraft);case _Loading():
return loading(_that.draft);case _Loaded():
return saved(_that.draft);case _Deleted():
return deleted(_that.draft);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CategoryDraft draft)?  initial,TResult? Function( CategoryDraft draft,  CategoryDraft initialDraft)?  draftUpdate,TResult? Function( CategoryDraft draft)?  loading,TResult? Function( CategoryDraft draft)?  saved,TResult? Function( CategoryDraft draft)?  deleted,TResult? Function( CategoryDraft draft,  AppError error)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.draft);case _DraftUpdate() when draftUpdate != null:
return draftUpdate(_that.draft,_that.initialDraft);case _Loading() when loading != null:
return loading(_that.draft);case _Loaded() when saved != null:
return saved(_that.draft);case _Deleted() when deleted != null:
return deleted(_that.draft);case _Error() when error != null:
return error(_that.draft,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CategorySaveState {
   _Initial({required this.draft});
  

@override final  CategoryDraft draft;

/// Create a copy of CategorySaveState
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
  return 'CategorySaveState.initial(draft: $draft)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $CategorySaveStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 CategoryDraft draft
});


@override $CategoryDraftCopyWith<$Res> get draft;

}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of CategorySaveState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? draft = null,}) {
  return _then(_Initial(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as CategoryDraft,
  ));
}

/// Create a copy of CategorySaveState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryDraftCopyWith<$Res> get draft {
  
  return $CategoryDraftCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}
}

/// @nodoc


class _DraftUpdate implements CategorySaveState {
   _DraftUpdate({required this.draft, required this.initialDraft});
  

@override final  CategoryDraft draft;
 final  CategoryDraft initialDraft;

/// Create a copy of CategorySaveState
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
  return 'CategorySaveState.draftUpdate(draft: $draft, initialDraft: $initialDraft)';
}


}

/// @nodoc
abstract mixin class _$DraftUpdateCopyWith<$Res> implements $CategorySaveStateCopyWith<$Res> {
  factory _$DraftUpdateCopyWith(_DraftUpdate value, $Res Function(_DraftUpdate) _then) = __$DraftUpdateCopyWithImpl;
@override @useResult
$Res call({
 CategoryDraft draft, CategoryDraft initialDraft
});


@override $CategoryDraftCopyWith<$Res> get draft;$CategoryDraftCopyWith<$Res> get initialDraft;

}
/// @nodoc
class __$DraftUpdateCopyWithImpl<$Res>
    implements _$DraftUpdateCopyWith<$Res> {
  __$DraftUpdateCopyWithImpl(this._self, this._then);

  final _DraftUpdate _self;
  final $Res Function(_DraftUpdate) _then;

/// Create a copy of CategorySaveState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? draft = null,Object? initialDraft = null,}) {
  return _then(_DraftUpdate(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as CategoryDraft,initialDraft: null == initialDraft ? _self.initialDraft : initialDraft // ignore: cast_nullable_to_non_nullable
as CategoryDraft,
  ));
}

/// Create a copy of CategorySaveState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryDraftCopyWith<$Res> get draft {
  
  return $CategoryDraftCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}/// Create a copy of CategorySaveState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryDraftCopyWith<$Res> get initialDraft {
  
  return $CategoryDraftCopyWith<$Res>(_self.initialDraft, (value) {
    return _then(_self.copyWith(initialDraft: value));
  });
}
}

/// @nodoc


class _Loading implements CategorySaveState {
  const _Loading({required this.draft});
  

@override final  CategoryDraft draft;

/// Create a copy of CategorySaveState
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
  return 'CategorySaveState.loading(draft: $draft)';
}


}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res> implements $CategorySaveStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) = __$LoadingCopyWithImpl;
@override @useResult
$Res call({
 CategoryDraft draft
});


@override $CategoryDraftCopyWith<$Res> get draft;

}
/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

/// Create a copy of CategorySaveState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? draft = null,}) {
  return _then(_Loading(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as CategoryDraft,
  ));
}

/// Create a copy of CategorySaveState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryDraftCopyWith<$Res> get draft {
  
  return $CategoryDraftCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}
}

/// @nodoc


class _Loaded implements CategorySaveState {
  const _Loaded({required this.draft});
  

@override final  CategoryDraft draft;

/// Create a copy of CategorySaveState
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
  return 'CategorySaveState.saved(draft: $draft)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $CategorySaveStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@override @useResult
$Res call({
 CategoryDraft draft
});


@override $CategoryDraftCopyWith<$Res> get draft;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of CategorySaveState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? draft = null,}) {
  return _then(_Loaded(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as CategoryDraft,
  ));
}

/// Create a copy of CategorySaveState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryDraftCopyWith<$Res> get draft {
  
  return $CategoryDraftCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}
}

/// @nodoc


class _Deleted implements CategorySaveState {
  const _Deleted({required this.draft});
  

@override final  CategoryDraft draft;

/// Create a copy of CategorySaveState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletedCopyWith<_Deleted> get copyWith => __$DeletedCopyWithImpl<_Deleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Deleted&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode => Object.hash(runtimeType,draft);

@override
String toString() {
  return 'CategorySaveState.deleted(draft: $draft)';
}


}

/// @nodoc
abstract mixin class _$DeletedCopyWith<$Res> implements $CategorySaveStateCopyWith<$Res> {
  factory _$DeletedCopyWith(_Deleted value, $Res Function(_Deleted) _then) = __$DeletedCopyWithImpl;
@override @useResult
$Res call({
 CategoryDraft draft
});


@override $CategoryDraftCopyWith<$Res> get draft;

}
/// @nodoc
class __$DeletedCopyWithImpl<$Res>
    implements _$DeletedCopyWith<$Res> {
  __$DeletedCopyWithImpl(this._self, this._then);

  final _Deleted _self;
  final $Res Function(_Deleted) _then;

/// Create a copy of CategorySaveState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? draft = null,}) {
  return _then(_Deleted(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as CategoryDraft,
  ));
}

/// Create a copy of CategorySaveState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryDraftCopyWith<$Res> get draft {
  
  return $CategoryDraftCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}
}

/// @nodoc


class _Error implements CategorySaveState {
  const _Error({required this.draft, required this.error});
  

@override final  CategoryDraft draft;
 final  AppError error;

/// Create a copy of CategorySaveState
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
  return 'CategorySaveState.error(draft: $draft, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $CategorySaveStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@override @useResult
$Res call({
 CategoryDraft draft, AppError error
});


@override $CategoryDraftCopyWith<$Res> get draft;

}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of CategorySaveState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? draft = null,Object? error = null,}) {
  return _then(_Error(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as CategoryDraft,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}

/// Create a copy of CategorySaveState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryDraftCopyWith<$Res> get draft {
  
  return $CategoryDraftCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}
}

// dart format on
