// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CategoryDraft {
  Uuid? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  CategoryType get categoryType => throw _privateConstructorUsedError;
  String get iconName => throw _privateConstructorUsedError;
  String get iconColor => throw _privateConstructorUsedError;
  Category? get parent => throw _privateConstructorUsedError;
  List<Category> get subcategories => throw _privateConstructorUsedError;
  SyncMeta? get syncMeta => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Create a copy of CategoryDraft
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryDraftCopyWith<CategoryDraft> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDraftCopyWith<$Res> {
  factory $CategoryDraftCopyWith(
    CategoryDraft value,
    $Res Function(CategoryDraft) then,
  ) = _$CategoryDraftCopyWithImpl<$Res, CategoryDraft>;
  @useResult
  $Res call({
    Uuid? id,
    String? name,
    CategoryType categoryType,
    String iconName,
    String iconColor,
    Category? parent,
    List<Category> subcategories,
    SyncMeta? syncMeta,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  });

  $CategoryCopyWith<$Res>? get parent;
}

/// @nodoc
class _$CategoryDraftCopyWithImpl<$Res, $Val extends CategoryDraft>
    implements $CategoryDraftCopyWith<$Res> {
  _$CategoryDraftCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryDraft
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? categoryType = null,
    Object? iconName = null,
    Object? iconColor = null,
    Object? parent = freezed,
    Object? subcategories = null,
    Object? syncMeta = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as Uuid?,
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            categoryType:
                null == categoryType
                    ? _value.categoryType
                    : categoryType // ignore: cast_nullable_to_non_nullable
                        as CategoryType,
            iconName:
                null == iconName
                    ? _value.iconName
                    : iconName // ignore: cast_nullable_to_non_nullable
                        as String,
            iconColor:
                null == iconColor
                    ? _value.iconColor
                    : iconColor // ignore: cast_nullable_to_non_nullable
                        as String,
            parent:
                freezed == parent
                    ? _value.parent
                    : parent // ignore: cast_nullable_to_non_nullable
                        as Category?,
            subcategories:
                null == subcategories
                    ? _value.subcategories
                    : subcategories // ignore: cast_nullable_to_non_nullable
                        as List<Category>,
            syncMeta:
                freezed == syncMeta
                    ? _value.syncMeta
                    : syncMeta // ignore: cast_nullable_to_non_nullable
                        as SyncMeta?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            deletedAt:
                freezed == deletedAt
                    ? _value.deletedAt
                    : deletedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of CategoryDraft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get parent {
    if (_value.parent == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.parent!, (value) {
      return _then(_value.copyWith(parent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryDraftImplCopyWith<$Res>
    implements $CategoryDraftCopyWith<$Res> {
  factory _$$CategoryDraftImplCopyWith(
    _$CategoryDraftImpl value,
    $Res Function(_$CategoryDraftImpl) then,
  ) = __$$CategoryDraftImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Uuid? id,
    String? name,
    CategoryType categoryType,
    String iconName,
    String iconColor,
    Category? parent,
    List<Category> subcategories,
    SyncMeta? syncMeta,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  });

  @override
  $CategoryCopyWith<$Res>? get parent;
}

/// @nodoc
class __$$CategoryDraftImplCopyWithImpl<$Res>
    extends _$CategoryDraftCopyWithImpl<$Res, _$CategoryDraftImpl>
    implements _$$CategoryDraftImplCopyWith<$Res> {
  __$$CategoryDraftImplCopyWithImpl(
    _$CategoryDraftImpl _value,
    $Res Function(_$CategoryDraftImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryDraft
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? categoryType = null,
    Object? iconName = null,
    Object? iconColor = null,
    Object? parent = freezed,
    Object? subcategories = null,
    Object? syncMeta = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _$CategoryDraftImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as Uuid?,
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        categoryType:
            null == categoryType
                ? _value.categoryType
                : categoryType // ignore: cast_nullable_to_non_nullable
                    as CategoryType,
        iconName:
            null == iconName
                ? _value.iconName
                : iconName // ignore: cast_nullable_to_non_nullable
                    as String,
        iconColor:
            null == iconColor
                ? _value.iconColor
                : iconColor // ignore: cast_nullable_to_non_nullable
                    as String,
        parent:
            freezed == parent
                ? _value.parent
                : parent // ignore: cast_nullable_to_non_nullable
                    as Category?,
        subcategories:
            null == subcategories
                ? _value._subcategories
                : subcategories // ignore: cast_nullable_to_non_nullable
                    as List<Category>,
        syncMeta:
            freezed == syncMeta
                ? _value.syncMeta
                : syncMeta // ignore: cast_nullable_to_non_nullable
                    as SyncMeta?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        deletedAt:
            freezed == deletedAt
                ? _value.deletedAt
                : deletedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$CategoryDraftImpl extends _CategoryDraft {
  _$CategoryDraftImpl({
    this.id,
    this.name,
    this.categoryType = CategoryType.outcome,
    this.iconName = "book_open_outline",
    this.iconColor = "9E9E9E",
    this.parent,
    final List<Category> subcategories = const [],
    this.syncMeta,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  }) : _subcategories = subcategories,
       super._();

  @override
  final Uuid? id;
  @override
  final String? name;
  @override
  @JsonKey()
  final CategoryType categoryType;
  @override
  @JsonKey()
  final String iconName;
  @override
  @JsonKey()
  final String iconColor;
  @override
  final Category? parent;
  final List<Category> _subcategories;
  @override
  @JsonKey()
  List<Category> get subcategories {
    if (_subcategories is EqualUnmodifiableListView) return _subcategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subcategories);
  }

  @override
  final SyncMeta? syncMeta;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'CategoryDraft(id: $id, name: $name, categoryType: $categoryType, iconName: $iconName, iconColor: $iconColor, parent: $parent, subcategories: $subcategories, syncMeta: $syncMeta, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryDraftImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.iconColor, iconColor) ||
                other.iconColor == iconColor) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            const DeepCollectionEquality().equals(
              other._subcategories,
              _subcategories,
            ) &&
            (identical(other.syncMeta, syncMeta) ||
                other.syncMeta == syncMeta) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    categoryType,
    iconName,
    iconColor,
    parent,
    const DeepCollectionEquality().hash(_subcategories),
    syncMeta,
    createdAt,
    updatedAt,
    deletedAt,
  );

  /// Create a copy of CategoryDraft
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryDraftImplCopyWith<_$CategoryDraftImpl> get copyWith =>
      __$$CategoryDraftImplCopyWithImpl<_$CategoryDraftImpl>(this, _$identity);
}

abstract class _CategoryDraft extends CategoryDraft {
  factory _CategoryDraft({
    final Uuid? id,
    final String? name,
    final CategoryType categoryType,
    final String iconName,
    final String iconColor,
    final Category? parent,
    final List<Category> subcategories,
    final SyncMeta? syncMeta,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final DateTime? deletedAt,
  }) = _$CategoryDraftImpl;
  _CategoryDraft._() : super._();

  @override
  Uuid? get id;
  @override
  String? get name;
  @override
  CategoryType get categoryType;
  @override
  String get iconName;
  @override
  String get iconColor;
  @override
  Category? get parent;
  @override
  List<Category> get subcategories;
  @override
  SyncMeta? get syncMeta;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  DateTime? get deletedAt;

  /// Create a copy of CategoryDraft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryDraftImplCopyWith<_$CategoryDraftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
