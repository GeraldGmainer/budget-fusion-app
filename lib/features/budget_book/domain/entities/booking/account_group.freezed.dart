// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountGroup {
  Account get account => throw _privateConstructorUsedError;
  List<CategoryGroup> get categoryGroups => throw _privateConstructorUsedError;

  /// Create a copy of AccountGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountGroupCopyWith<AccountGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountGroupCopyWith<$Res> {
  factory $AccountGroupCopyWith(
          AccountGroup value, $Res Function(AccountGroup) then) =
      _$AccountGroupCopyWithImpl<$Res, AccountGroup>;
  @useResult
  $Res call({Account account, List<CategoryGroup> categoryGroups});

  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class _$AccountGroupCopyWithImpl<$Res, $Val extends AccountGroup>
    implements $AccountGroupCopyWith<$Res> {
  _$AccountGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? categoryGroups = null,
  }) {
    return _then(_value.copyWith(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      categoryGroups: null == categoryGroups
          ? _value.categoryGroups
          : categoryGroups // ignore: cast_nullable_to_non_nullable
              as List<CategoryGroup>,
    ) as $Val);
  }

  /// Create a copy of AccountGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res> get account {
    return $AccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountGroupImplCopyWith<$Res>
    implements $AccountGroupCopyWith<$Res> {
  factory _$$AccountGroupImplCopyWith(
          _$AccountGroupImpl value, $Res Function(_$AccountGroupImpl) then) =
      __$$AccountGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Account account, List<CategoryGroup> categoryGroups});

  @override
  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class __$$AccountGroupImplCopyWithImpl<$Res>
    extends _$AccountGroupCopyWithImpl<$Res, _$AccountGroupImpl>
    implements _$$AccountGroupImplCopyWith<$Res> {
  __$$AccountGroupImplCopyWithImpl(
      _$AccountGroupImpl _value, $Res Function(_$AccountGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? categoryGroups = null,
  }) {
    return _then(_$AccountGroupImpl(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      categoryGroups: null == categoryGroups
          ? _value._categoryGroups
          : categoryGroups // ignore: cast_nullable_to_non_nullable
              as List<CategoryGroup>,
    ));
  }
}

/// @nodoc

class _$AccountGroupImpl extends _AccountGroup {
  const _$AccountGroupImpl(
      {required this.account,
      required final List<CategoryGroup> categoryGroups})
      : _categoryGroups = categoryGroups,
        super._();

  @override
  final Account account;
  final List<CategoryGroup> _categoryGroups;
  @override
  List<CategoryGroup> get categoryGroups {
    if (_categoryGroups is EqualUnmodifiableListView) return _categoryGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryGroups);
  }

  @override
  String toString() {
    return 'AccountGroup(account: $account, categoryGroups: $categoryGroups)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountGroupImpl &&
            (identical(other.account, account) || other.account == account) &&
            const DeepCollectionEquality()
                .equals(other._categoryGroups, _categoryGroups));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account,
      const DeepCollectionEquality().hash(_categoryGroups));

  /// Create a copy of AccountGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountGroupImplCopyWith<_$AccountGroupImpl> get copyWith =>
      __$$AccountGroupImplCopyWithImpl<_$AccountGroupImpl>(this, _$identity);
}

abstract class _AccountGroup extends AccountGroup {
  const factory _AccountGroup(
      {required final Account account,
      required final List<CategoryGroup> categoryGroups}) = _$AccountGroupImpl;
  const _AccountGroup._() : super._();

  @override
  Account get account;
  @override
  List<CategoryGroup> get categoryGroups;

  /// Create a copy of AccountGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountGroupImplCopyWith<_$AccountGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
