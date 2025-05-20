// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CategoryGroup {
  Category get category => throw _privateConstructorUsedError;
  List<Booking> get bookings => throw _privateConstructorUsedError;
  Decimal get amount => throw _privateConstructorUsedError;
  List<CategoryGroup> get subGroups => throw _privateConstructorUsedError;

  /// Create a copy of CategoryGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryGroupCopyWith<CategoryGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryGroupCopyWith<$Res> {
  factory $CategoryGroupCopyWith(
    CategoryGroup value,
    $Res Function(CategoryGroup) then,
  ) = _$CategoryGroupCopyWithImpl<$Res, CategoryGroup>;
  @useResult
  $Res call({
    Category category,
    List<Booking> bookings,
    Decimal amount,
    List<CategoryGroup> subGroups,
  });

  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$CategoryGroupCopyWithImpl<$Res, $Val extends CategoryGroup>
    implements $CategoryGroupCopyWith<$Res> {
  _$CategoryGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? bookings = null,
    Object? amount = null,
    Object? subGroups = null,
  }) {
    return _then(
      _value.copyWith(
            category:
                null == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as Category,
            bookings:
                null == bookings
                    ? _value.bookings
                    : bookings // ignore: cast_nullable_to_non_nullable
                        as List<Booking>,
            amount:
                null == amount
                    ? _value.amount
                    : amount // ignore: cast_nullable_to_non_nullable
                        as Decimal,
            subGroups:
                null == subGroups
                    ? _value.subGroups
                    : subGroups // ignore: cast_nullable_to_non_nullable
                        as List<CategoryGroup>,
          )
          as $Val,
    );
  }

  /// Create a copy of CategoryGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryGroupImplCopyWith<$Res>
    implements $CategoryGroupCopyWith<$Res> {
  factory _$$CategoryGroupImplCopyWith(
    _$CategoryGroupImpl value,
    $Res Function(_$CategoryGroupImpl) then,
  ) = __$$CategoryGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Category category,
    List<Booking> bookings,
    Decimal amount,
    List<CategoryGroup> subGroups,
  });

  @override
  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$CategoryGroupImplCopyWithImpl<$Res>
    extends _$CategoryGroupCopyWithImpl<$Res, _$CategoryGroupImpl>
    implements _$$CategoryGroupImplCopyWith<$Res> {
  __$$CategoryGroupImplCopyWithImpl(
    _$CategoryGroupImpl _value,
    $Res Function(_$CategoryGroupImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? bookings = null,
    Object? amount = null,
    Object? subGroups = null,
  }) {
    return _then(
      _$CategoryGroupImpl(
        category:
            null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as Category,
        bookings:
            null == bookings
                ? _value._bookings
                : bookings // ignore: cast_nullable_to_non_nullable
                    as List<Booking>,
        amount:
            null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                    as Decimal,
        subGroups:
            null == subGroups
                ? _value._subGroups
                : subGroups // ignore: cast_nullable_to_non_nullable
                    as List<CategoryGroup>,
      ),
    );
  }
}

/// @nodoc

class _$CategoryGroupImpl extends _CategoryGroup {
  const _$CategoryGroupImpl({
    required this.category,
    final List<Booking> bookings = const [],
    required this.amount,
    final List<CategoryGroup> subGroups = const [],
  }) : _bookings = bookings,
       _subGroups = subGroups,
       super._();

  @override
  final Category category;
  final List<Booking> _bookings;
  @override
  @JsonKey()
  List<Booking> get bookings {
    if (_bookings is EqualUnmodifiableListView) return _bookings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookings);
  }

  @override
  final Decimal amount;
  final List<CategoryGroup> _subGroups;
  @override
  @JsonKey()
  List<CategoryGroup> get subGroups {
    if (_subGroups is EqualUnmodifiableListView) return _subGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subGroups);
  }

  @override
  String toString() {
    return 'CategoryGroup(category: $category, bookings: $bookings, amount: $amount, subGroups: $subGroups)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryGroupImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._bookings, _bookings) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality().equals(
              other._subGroups,
              _subGroups,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    category,
    const DeepCollectionEquality().hash(_bookings),
    amount,
    const DeepCollectionEquality().hash(_subGroups),
  );

  /// Create a copy of CategoryGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryGroupImplCopyWith<_$CategoryGroupImpl> get copyWith =>
      __$$CategoryGroupImplCopyWithImpl<_$CategoryGroupImpl>(this, _$identity);
}

abstract class _CategoryGroup extends CategoryGroup {
  const factory _CategoryGroup({
    required final Category category,
    final List<Booking> bookings,
    required final Decimal amount,
    final List<CategoryGroup> subGroups,
  }) = _$CategoryGroupImpl;
  const _CategoryGroup._() : super._();

  @override
  Category get category;
  @override
  List<Booking> get bookings;
  @override
  Decimal get amount;
  @override
  List<CategoryGroup> get subGroups;

  /// Create a copy of CategoryGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryGroupImplCopyWith<_$CategoryGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
