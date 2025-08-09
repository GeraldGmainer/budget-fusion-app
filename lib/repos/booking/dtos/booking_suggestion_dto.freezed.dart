// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_suggestion_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BookingSuggestionDto _$BookingSuggestionDtoFromJson(Map<String, dynamic> json) {
  return _BookingSuggestionDto.fromJson(json);
}

/// @nodoc
mixin _$BookingSuggestionDto {
  String get suggestion => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_type')
  @CategoryTypeSerializer()
  CategoryType get categoryType => throw _privateConstructorUsedError;

  /// Serializes this BookingSuggestionDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookingSuggestionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingSuggestionDtoCopyWith<BookingSuggestionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingSuggestionDtoCopyWith<$Res> {
  factory $BookingSuggestionDtoCopyWith(
    BookingSuggestionDto value,
    $Res Function(BookingSuggestionDto) then,
  ) = _$BookingSuggestionDtoCopyWithImpl<$Res, BookingSuggestionDto>;
  @useResult
  $Res call({
    String suggestion,
    @JsonKey(name: 'category_type')
    @CategoryTypeSerializer()
    CategoryType categoryType,
  });
}

/// @nodoc
class _$BookingSuggestionDtoCopyWithImpl<
  $Res,
  $Val extends BookingSuggestionDto
>
    implements $BookingSuggestionDtoCopyWith<$Res> {
  _$BookingSuggestionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingSuggestionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? suggestion = null, Object? categoryType = null}) {
    return _then(
      _value.copyWith(
            suggestion:
                null == suggestion
                    ? _value.suggestion
                    : suggestion // ignore: cast_nullable_to_non_nullable
                        as String,
            categoryType:
                null == categoryType
                    ? _value.categoryType
                    : categoryType // ignore: cast_nullable_to_non_nullable
                        as CategoryType,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookingSuggestionDtoImplCopyWith<$Res>
    implements $BookingSuggestionDtoCopyWith<$Res> {
  factory _$$BookingSuggestionDtoImplCopyWith(
    _$BookingSuggestionDtoImpl value,
    $Res Function(_$BookingSuggestionDtoImpl) then,
  ) = __$$BookingSuggestionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String suggestion,
    @JsonKey(name: 'category_type')
    @CategoryTypeSerializer()
    CategoryType categoryType,
  });
}

/// @nodoc
class __$$BookingSuggestionDtoImplCopyWithImpl<$Res>
    extends _$BookingSuggestionDtoCopyWithImpl<$Res, _$BookingSuggestionDtoImpl>
    implements _$$BookingSuggestionDtoImplCopyWith<$Res> {
  __$$BookingSuggestionDtoImplCopyWithImpl(
    _$BookingSuggestionDtoImpl _value,
    $Res Function(_$BookingSuggestionDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingSuggestionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? suggestion = null, Object? categoryType = null}) {
    return _then(
      _$BookingSuggestionDtoImpl(
        suggestion:
            null == suggestion
                ? _value.suggestion
                : suggestion // ignore: cast_nullable_to_non_nullable
                    as String,
        categoryType:
            null == categoryType
                ? _value.categoryType
                : categoryType // ignore: cast_nullable_to_non_nullable
                    as CategoryType,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingSuggestionDtoImpl extends _BookingSuggestionDto {
  const _$BookingSuggestionDtoImpl({
    required this.suggestion,
    @JsonKey(name: 'category_type')
    @CategoryTypeSerializer()
    required this.categoryType,
  }) : super._();

  factory _$BookingSuggestionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingSuggestionDtoImplFromJson(json);

  @override
  final String suggestion;
  @override
  @JsonKey(name: 'category_type')
  @CategoryTypeSerializer()
  final CategoryType categoryType;

  @override
  String toString() {
    return 'BookingSuggestionDto(suggestion: $suggestion, categoryType: $categoryType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingSuggestionDtoImpl &&
            (identical(other.suggestion, suggestion) ||
                other.suggestion == suggestion) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, suggestion, categoryType);

  /// Create a copy of BookingSuggestionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingSuggestionDtoImplCopyWith<_$BookingSuggestionDtoImpl>
  get copyWith =>
      __$$BookingSuggestionDtoImplCopyWithImpl<_$BookingSuggestionDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingSuggestionDtoImplToJson(this);
  }
}

abstract class _BookingSuggestionDto extends BookingSuggestionDto {
  const factory _BookingSuggestionDto({
    required final String suggestion,
    @JsonKey(name: 'category_type')
    @CategoryTypeSerializer()
    required final CategoryType categoryType,
  }) = _$BookingSuggestionDtoImpl;
  const _BookingSuggestionDto._() : super._();

  factory _BookingSuggestionDto.fromJson(Map<String, dynamic> json) =
      _$BookingSuggestionDtoImpl.fromJson;

  @override
  String get suggestion;
  @override
  @JsonKey(name: 'category_type')
  @CategoryTypeSerializer()
  CategoryType get categoryType;

  /// Create a copy of BookingSuggestionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingSuggestionDtoImplCopyWith<_$BookingSuggestionDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
